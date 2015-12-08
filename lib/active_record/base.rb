require 'csv'

module MicroActiveRecord
  # = MicroActive Record
  # Active Record objects store your objects in a text file.
  # To create a new text file format, you can just implement your own.
  #
  # == Creation
  #
  # To create an object, you just need to pass a hash with the attributes
  # Example:
  # Person < ActiveRecod::CSVAdapter
  #  columns :name, :age
  #
  #  def initialize(hash)
  #    super(hash)
  #  end
  #
  # end
  #
  #
  class CSVAdapter
    def initialize(attributes)
      invalid_attributes = attributes.keys - @@columns
      fail "Invalid attributes: #{invalid_attributes}" if invalid_attributes.any?
      @attributes = attributes
    end

    def save
      CSV.open(self.class.csv_file, 'ab', headers: @@columns) do |csv|
        csv << @attributes
      end
    end

    def to_s
      "#{self.class.name}: #{@attributes.inspect}"
    end

    class << self
      def create(attributes)
        new(attributes).save
      end

      def where(filter)
        [].tap do |result|
          CSV.foreach(csv_file, headers: @@columns) do |row|
            if filter.all? { |attr, value| row[attr] == value.to_s }
              result << new(row.to_h)
            end
          end
        end
      end

      def find_by(filter)
        where(filter).first
      end

      def all
        [].tap do |all|
          CSV.foreach(csv_file, headers: @@columns) do |row|
            all << new(row.to_h)
          end
        end
      end

      def csv_file
        "#{name}.csv"
      end

      private

      def columns(*column_names)
        @@columns = column_names

        column_names.each do |attr|
          define_method(attr) do
            @attributes[attr]
          end

          define_method("#{attr}=") do |val|
            @attributes[attr] = val
          end
        end

        initialize_db_if_needed
      end

      def initialize_db_if_needed
        unless File.exist?(csv_file)
          CSV.open(csv_file, 'w', headers: @@columns, write_headers: true) { |r| r << [] }
        end
      end
    end
  end
end

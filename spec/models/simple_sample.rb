class SimpleSample < MicroActiveRecord::CSVAdapter
  columns :field1, :field2

  def initialize(*hash)
    super(*hash)
  end
end

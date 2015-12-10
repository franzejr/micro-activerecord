class SampleWithoutColumns < MicroActiveRecord::CSVAdapter
  def initialize(*hash)
    super(*hash)
  end
end

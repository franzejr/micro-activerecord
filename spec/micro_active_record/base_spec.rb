require 'spec_helper'

describe MicroActiveRecord::CSVAdapter do
  let!(:simple_sample) { SimpleSample.create(field1: 'a', field2: '3') }
  after(:all) { database_clean_if_needed }

  describe '.initialize' do
    it 'fails if invalid attributes are passed' do
      expect { SimpleSample.new(a: 2) }.to raise_error('Invalid attributes: [:a]')
    end

    it 'fails if columns are not defined' do
      expect do
        SampleWithoutColumns.create(a: 3)
      end.to raise_error('Invalid attributes: [:a]')
    end
  end

  describe '.create' do
    it 'creates one instance' do
      expect_inside_file('SimpleSample.csv') do |file_string|
        expect(file_string).to include 'a'
        expect(file_string).to include '3'
      end
    end
  end

  describe '.where' do
    it 'returns a correct instance' do
      simple_sample = SimpleSample.where(field1: 'a').first
      expect(simple_sample.is_a?(SimpleSample)).to be_truthy
      expect(simple_sample.field1).to eq 'a'
      expect(simple_sample.field2).to eq '3'
    end
  end

  describe '.find_by' do
    it 'returns a correct instance' do
      simple_sample = SimpleSample.find_by(field1: 'a')
      expect(simple_sample.is_a?(SimpleSample)).to be_truthy
      expect(simple_sample.field1).to eq 'a'
      expect(simple_sample.field2).to eq '3'
    end
  end

  describe '.all' do
    it 'retrieves all the instances' do
      SimpleSample.create(field1: 'a', field2: '3')
      expect(SimpleSample.all.size).to eq 4
    end
  end
end

def expect_inside_file(filename)
  file_string = File.open(filename).read
  yield(file_string) if block_given?
  File.delete(filename)
end

def database_clean_if_needed
  File.delete('SimpleSample.csv') if File.exist?('SimpleSample.csv')
end

require 'rspec'
require 'cache'

describe 'LRU' do
  subject(:cache) { LRUCache.new(4) }
  describe '#initialize' do
    it "creates an array" do
      expect(cache.arr.is_a?(Array)).to be(true)
    end
  end
end

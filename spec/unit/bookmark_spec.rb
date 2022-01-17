require 'bookmark'

describe Bookmark do
  subject { described_class.new('Google', 'https://www.google.com/') }

  it 'knows its title' do
    expect(subject.title).to eq('Google')
  end

  it 'knows its URL' do
    expect(subject.url).to eq('https://www.google.com/')
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      expect(described_class.all).to all( be_a(described_class) )
    end
  end
end
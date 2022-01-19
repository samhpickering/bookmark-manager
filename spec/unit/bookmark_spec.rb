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
      expect(described_class.all).to all(be_a(described_class))
    end
    it 'returns the bookmarks inserted into the test database' do
      expect(Bookmark.all).to match_array([
        Bookmark.new('Google', 'https://www.google.com/'),
        Bookmark.new('Facebook', 'https://www.facebook.com/'),
        Bookmark.new('Instagram', 'https://www.instagram.com/')
      ])
    end
  end
end

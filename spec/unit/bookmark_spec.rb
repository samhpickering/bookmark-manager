require 'bookmark'

describe Bookmark do
  subject { described_class.new('Test Example', 'https://www.testexample.com/') }

  it 'knows its title' do
    expect(subject.title).to eq('Test Example')
  end

  it 'knows its URL' do
    expect(subject.url).to eq('https://www.testexample.com/')
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      expect(described_class.all).to all(be_a(described_class))
    end
    it 'returns the bookmarks inserted into the test database' do
      expect(Bookmark.all).to match_array(
        [
          Bookmark.new('Google', 'https://www.google.com/'),
          Bookmark.new('Facebook', 'https://www.facebook.com/'),
          Bookmark.new('Instagram', 'https://www.instagram.com/')
        ]
      )
    end
  end

  describe '.add' do
    it 'adds a bookmark to the test database' do
      Bookmark.add(subject)
      expect(Bookmark.all).to include(subject)
    end
  end
end

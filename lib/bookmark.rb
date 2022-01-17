class Bookmark
  attr_reader :title, :url
  def initialize(title, url)
    @title = title
    @url = url
  end

  def self.all
    [
      Bookmark.new('Google', 'https://www.google.com/'),
      Bookmark.new('Instagram', 'https://www.instagram.com/'),
      Bookmark.new('Snapchat', 'https://www.snapchat.com/')
    ]
  end
end

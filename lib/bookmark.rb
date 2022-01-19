require 'pg'

class Bookmark
  attr_reader :title, :url

  def initialize(title, url)
    @title = title
    @url = url
  end

  def self.all
    connection = PG.connect dbname: 'bookmark_manager', user: ENV['USER']
    result = connection.exec 'SELECT title, url FROM bookmarks;'
    result.map { |row| Bookmark.new(row['title'], row['url']) }
  ensure
    result&.clear
    connection&.close
  end
end

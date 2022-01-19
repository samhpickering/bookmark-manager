require 'pg'

class Bookmark
  attr_reader :title, :url

  def initialize(title, url)
    @title = title
    @url = url
  end

  def ==(other)
    @title == other.title && @url == other.url
  end

  def self.all
    dbname = 'bookmark_manager'
    dbname = 'bookmark_manager_test' if ENV['ENVIRONMENT'] == 'test'

    connection = PG.connect dbname: dbname, user: ENV['USER']
    result = connection.exec 'SELECT title, url FROM bookmarks;'
    result.map { |row| Bookmark.new(row['title'], row['url']) }
  ensure
    result&.clear
    connection&.close
  end
end

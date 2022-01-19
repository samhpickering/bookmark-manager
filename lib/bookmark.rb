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
    connection = db_connect
    result = connection.exec 'SELECT title, url FROM bookmarks;'
    result.map { |row| Bookmark.new(row['title'], row['url']) }
  ensure
    result&.clear
    connection&.close
  end

  def self.add(bookmark)
    connection = db_connect
    result = connection.exec_params 'INSERT INTO bookmarks (title, url) VALUES ($1, $2);', [bookmark.title, bookmark.url]
  ensure
    result&.clear
    connection&.close
  end

  def self.db_connect
    dbname = 'bookmark_manager'
    dbname = 'bookmark_manager_test' if ENV['RACK_ENV'] == 'test'

    PG.connect dbname: dbname
  end
end

require 'pg'

class Bookmark
  attr_reader :title, :url
  attr_accessor :id

  def initialize(params)
    @title = params[:title]
    @url = params[:url]
    @id = params[:id]
  end

  def ==(other)
    @title == other.title && @url == other.url
  end

  def self.all
    connection = db_connect
    result = connection.exec 'SELECT id, title, url FROM bookmarks;'
    result.map { |row| Bookmark.new(title: row['title'], url: row['url'], id: row['id']) }
  ensure
    result&.clear
    connection&.close
  end

  def self.add(bookmark)
    connection = db_connect
    result = connection.exec_params 'INSERT INTO bookmarks (title, url) VALUES ($1, $2) RETURNING id;', [bookmark.title, bookmark.url]
    bookmark.id = result[0]['id'] if result[0] && result[0]['id']
  ensure
    result&.clear
    connection&.close
  end

  def self.delete(id)
    connection = db_connect
    connection.exec_params 'DELETE FROM bookmarks WHERE id=$1;', [id]
  end

  def self.db_connect
    dbname = 'bookmark_manager'
    dbname = 'bookmark_manager_test' if ENV['RACK_ENV'] == 'test'

    PG.connect dbname: dbname
  end
end

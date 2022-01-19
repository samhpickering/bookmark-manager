def set_up_test_db
  connection = PG.connect dbname: 'bookmark_manager_test', user: ENV['USER']
  connection.exec 'DROP TABLE IF EXISTS bookmarks;'
  connection.exec 'CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(40), url VARCHAR(60));'
  add_test_bookmark(connection, 'Google', 'https://www.google.com/')
  add_test_bookmark(connection, 'Facebook', 'https://www.facebook.com/')
  add_test_bookmark(connection, 'Instagram', 'https://www.instagram.com/')
ensure
  @connection&.close
end

def add_test_bookmark(connection, title, url)
  connection.exec "INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}');"
end

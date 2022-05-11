# in spec/setup_test_database.rb

require 'pg'

def setup_test_database
  connection = PG.connect(dbname: "bookmark_manager_test")

  connection.exec("TRUNCATE bookmarks")

  # connection.exec("INSERT INTO bookmarks (url) VALUES('www.google.com');")
  # connection.exec("INSERT INTO bookmarks (url) VALUES('www.bing.com');")
  # connection.exec("INSERT INTO bookmarks (url) VALUES('www.duckduckgo.com');")
end
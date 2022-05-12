require 'pg'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    array = []
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end 
    
    result = connection.exec('SELECT * FROM bookmarks')
    # result.map { |bookmark| bookmark['url'] }
    result.each do |row| 
      array << Bookmark.new(row["id"],row["url"],row["title"])
    end
    return array
  end

  def self.create(website, name)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end 

    connection.exec_params("INSERT INTO bookmarks(url, title) VALUES($1, $2)", [website, name])
  end
end

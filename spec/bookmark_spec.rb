require 'bookmark'


describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all.map { |bookmark| {url: bookmark.url, title: bookmark.title} }

      expect(bookmarks).to include({:title=>nil, :url=>"http://www.makersacademy.com"})
    end
  end

  describe '.create' do
    it ' creates new entry to the database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.create("http://whatever.com", "nothing")
      bookmarks = Bookmark.all.map { |bookmark| {url: bookmark.url, title: bookmark.title} }

      expect(bookmarks).to include({:title=>"nothing", :url=>"http://whatever.com"})
    end
  end
end

# Test drive a refactor of the code to use a Model, that returns the list of bookmarks.
# You'll probably want to create a Bookmark model that responds to the class method .all with a hard-coded array of Bookmark instances.

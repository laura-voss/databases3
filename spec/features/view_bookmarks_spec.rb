require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can view bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    connection.exec("INSERT INTO bookmarks(url, title) VALUES('http://www.islandmonkey.com', 'something great');")

    visit('/bookmarks')

    expect(page).to have_content 'something great'
  end
end
  
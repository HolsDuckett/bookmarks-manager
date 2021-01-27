
feature 'Viewing Bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("This is a bookmark")
  end

  scenario 'clicking view bookmarks button' do
    visit('/')

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")

    click_button('View Bookmarks')

    expect(page).to have_content('Google')
    expect(page).to have_content('Makers Academy')
  end
end

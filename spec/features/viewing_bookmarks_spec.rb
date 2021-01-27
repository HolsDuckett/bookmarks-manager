
feature 'Viewing Bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("This is a bookmark")
  end

  scenario 'clicking view bookmarks button' do
    visit('/')

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

    click_button('View Bookmarks')

    expect(page).to have_content('www.google.com')
    expect(page).to have_content('www.makersacademy.com')
  end
end


feature 'Viewing Bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content("This is a bookmark")
  end

  scenario 'clicking view bookmarks button' do
    visit('/')
    click_button('View Bookmarks')
    expect(page).to have_content('www.google.com')
    expect(page).to have_content('www.makersacademy.com')
  end
end

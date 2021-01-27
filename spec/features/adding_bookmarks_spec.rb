feature 'adding bookmarks' do

  scenario 'should be able to add bookmarks'do
    visit('/')
    click_button('Add Bookmarks')
    fill_in('url', with: 'https://skribbl.io/')
    click_button('submit')
    click_button('View Bookmarks')
    expect(page).to have_content('https://skribbl.io/')
  end

end

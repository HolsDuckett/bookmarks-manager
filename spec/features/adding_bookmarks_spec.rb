feature 'adding bookmarks' do

  scenario 'should be able to add bookmarks'do
    visit('/')
    click_button('Add Bookmarks')
    fill_in('url', with: 'https://skribbl.io/')
    fill_in('title', with: 'Skribbl.io')
    click_button('submit')
    click_button('View Bookmarks')
    expect(page).to have_content('Skribbl.io')
  end

end

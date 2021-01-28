feature 'updating bookmarks' do

  scenario 'should be able to update bookmarks'do
    visit('/')
    click_button('Add Bookmarks')
    fill_in('url', with: 'https://skribbl.io/')
    fill_in('title', with: 'Skribbl.io')
    click_button('submit')
    click_button('View Bookmarks')
    expect(page).to have_content('Skribbl.io')

    visit('/')
    click_button("Update Bookmark")
    fill_in('current title', with: 'Skribbl.io')
    fill_in('new title', with: 'Skribbl.io 2.0')
    click_button('Update Bookmark')
    click_button('View Bookmarks')
    expect(page).to have_content('Skribbl.io 2.0')
  end

end

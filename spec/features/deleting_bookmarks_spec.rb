feature 'deleting bookmarks' do
  scenario 'deleting a bookmark by clicking the delete link' do
    visit('/bookmarks')
    click_link 'Delete Google'
    expect(page).to have_no_link('Google', href: 'https://www.google.com/')
  end
end

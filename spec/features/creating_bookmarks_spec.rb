feature 'creating bookmarks' do
  scenario 'creating a bookmark via the form' do
    visit('/bookmarks')
    click_link 'Add'
    fill_in 'title', with: 'Example Website'
    fill_in 'url', with: 'https://example.com/'
    click_button 'Submit'

    expect(page).to have_link('Example Website', href: 'https://example.com/')
  end
end

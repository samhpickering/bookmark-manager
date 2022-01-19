feature 'viewing bookmarks' do
  scenario 'visiting index page' do
    visit '/bookmarks'

    expect(page).to have_content 'Bookmarks'
    expect(page).to have_link('Google', href: 'https://www.google.com/')
    expect(page).to have_link('Facebook', href: 'https://www.facebook.com/')
    expect(page).to have_link('Instagram', href: 'https://www.instagram.com/')
  end
end

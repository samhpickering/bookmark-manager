feature "viewing bookmarks" do
  scenario "visiting index page" do
    visit ("/")
    expect(page).to have_content "Bookmarks"
    expect(page).to have_link("Google", :href => "https://www.google.com/")
    expect(page).to have_link("Facebook", :href => "https://www.facebook.com/")
    expect(page).to have_link("Twitter", :href => "https://www.twitter.com/")
  end
end

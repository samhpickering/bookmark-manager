feature "visitng index page" do
  scenario "visitng index page" do
    visit ("/")
    expect(page).to have_content "Bookmarks"
  end 
end
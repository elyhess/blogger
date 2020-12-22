require "rails_helper"

describe "user edits an article" do
  describe "they link from the article show" do
    describe "they fill in a title and body" do
      before :each do
        @article_1 = Article.create!(title: "Title 1", body: "Body 1")
        @article_2 = Article.create!(title: "Title 2", body: "Body 2")
      end

      it "updates an existing article" do
        visit article_path(@article_1)
        click_link "edit"

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]",  with: "New Body!"
        click_on "Update Article"
        
        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
        expect(page).to have_content("Article 'New Title!' was Updated!")
      end
    end
  end
end
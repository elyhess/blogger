require "rails_helper"

describe "user sees one article" do
  describe "they link from the articles index" do
    before :each do
      @article_1 = Article.create!(title: "Title 1", body: "Body 1")
      @article_2 = Article.create!(title: "Title 2", body: "Body 2")
    end

    it "displays information for one article" do
      visit articles_path

      click_link @article_1.title

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
    end
  end
end
require "rails_helper"

describe "user sees one article" do
  describe "they link from the articles index" do
    before :each do
      @article_1 = Article.create!(title: "New Title", body: "New Body")
      @comment_1 = @article_1.comments.create!(author_name: "Me", body: "Commenty comments")
      @comment_2 = @article_1.comments.create!(author_name: "You", body: "So much to say")
    end

    it "displays information for one article" do
      visit articles_path

      click_link @article_1.title

      expect(page).to have_content(@article_1.title)
      expect(page).to have_content(@article_1.body)
      expect(page).to have_content(@comment_1.author_name)
      expect(page).to have_content(@comment_1.body)
      expect(page).to have_content(@comment_2.author_name)
      expect(page).to have_content(@comment_2.body)
    end

    it 'they can fill out a comment form which displays on the article show page' do
      visit article_path(@article_1)

      fill_in "comment[author_name]", with: "ME!"
      fill_in "comment[body]", with: "Super amazing content, like, for real."
      click_on "Submit"

      expect(current_path).to eq(article_path(@article_1))
      expect(page).to have_content("Comments: (#{@article_1.comments.size})")
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("ME!")
      expect(page).to have_content("Super amazing content, like, for real.")
    end
  end
end
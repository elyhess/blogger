require "rails_helper"

describe "user sees one tag link" do
  describe "they click the link" do
    before :each do
      @article_1 = Article.create!(title: "New Title", body: "New Body")
      @comment_1 = @article_1.comments.create!(author_name: "Me", body: "Commenty comments")
      @comment_2 = @article_1.comments.create!(author_name: "You", body: "So much to say")
      @tag = Tag.create!(name: "Name")
      @tagging = Tagging.create!(article_id: @article_1.id, tag_id: @tag.id)
    end

    it 'from an article show and it displays a tags show page' do
      visit article_path(@article_1)

      click_link @tag.name

      expect(current_path).to eq(tag_path(@tag))

      expect(page).to have_content("Articles Tagged with #{@tag.name}")
      expect(page).to have_content(@article_1.title)
      save_and_open_page
    end
  end
end
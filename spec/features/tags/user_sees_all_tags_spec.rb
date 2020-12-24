require "rails_helper"

describe "As a user" do
  describe "when i visit the tags index" do
    before :each do
      @article_1 = Article.create!(title: "New Title", body: "New Body")
      @comment_1 = @article_1.comments.create!(author_name: "Me", body: "Commenty comments")
      @comment_2 = @article_1.comments.create!(author_name: "You", body: "So much to say")
      @tag = Tag.create!(name: "Name")
      @tag2 = Tag.create!(name: "Another tag")
      @tagging = Tagging.create!(article_id: @article_1.id, tag_id: @tag.id)
      @tagging2 = Tagging.create!(article_id: @article_1.id, tag_id: @tag2.id)
    end

    it 'I see all of the tags' do
      visit tags_path

      expect(page).to have_content("All Tags")
      expect(page).to have_content(@tag.name)
      expect(page).to have_content(@tag2.name)
    end

    it 'I can delete a tag' do
      visit tags_path

      all(:link, 'Delete')[0].click

      expect(page).to_not have_content(@tag.name)
      expect(page).to have_content(@tag2.name)
    end
  end
end
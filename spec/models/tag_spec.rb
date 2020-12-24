require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it { should have_many :taggings }
    it { should have_many(:articles).through(:taggings) }
  end

  describe 'instance methods' do
    it '#to_s' do
      article = Article.create(title: "Tall Tables", body: "They are tough for the short legged")
      article.tags.create(name: "furniture")
      article.tags.create(name: "opinions")

      expect(Tag.first.to_s).to eq("furniture")
    end
  end

  describe 'class methods' do
  end

end
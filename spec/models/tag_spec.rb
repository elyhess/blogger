require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it { should have_many :taggings }
    it { should have_many(:articles).through(:taggings) }
  end

  describe 'instance methods' do
  end

  describe 'class methods' do
  end

end
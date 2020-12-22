require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :body}
  end

  describe 'relationships' do
  end

  describe 'instance methods' do
  end

  describe 'class methods' do
  end

end
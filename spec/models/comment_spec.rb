require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it { should belong_to :article }
  end

  describe 'instance methods' do
  end

  describe 'class methods' do
  end

end
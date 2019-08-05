require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'is valid with valid attributes' do
    it "has a valid factory" do
      book = create(:book)
      expect(book).to be_valid
    end
    it "is not valid without a codename" do
      book2 = build(:book, title: nil)
      expect(book2).to_not be_valid
    end

  end
end

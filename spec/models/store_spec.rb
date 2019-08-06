require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'is valid with valid attributes' do
    it "has a valid factory" do
      store = create(:store)
      expect(store).to be_valid
    end
    it "is not valid without a codename" do
      store2 = build(:store, codename: nil)
      expect(store2).to_not be_valid
    end

  end
end

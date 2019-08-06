require 'rails_helper'
RSpec.feature "Stores", :type => :feature do
  before do
    begin
      @store = create(:store)
    rescue StandardError => e
      puts "#{e.message}"
    end
  end

  scenario "Creates a new Store" do
    begin
      visit "/catalogs/new"
      within find("#stores_form") do
        fill_in "codename", :with => "#{@store.codename}"
        fill_in "address", :with => "#{@store.address}"
        fill_in "phone", :with => "#{@store.phone}"

        click_button "Submit"
      end
    rescue StandardError => e
      puts "#{e.message}"
    end
  end
end
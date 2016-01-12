require 'capybara/rspec'

feature "Create a new Peach"

describe "create a new peach", :type => :feature do
	before :each do
		Peach.create(name: "learn testing", deadline: 1)
	end

	it "user sees the create a peach link" do
		visit '/peaches'
		expect(page).to have_css('div#create_peach')
  end

	it "user clicks the create a peach link" do
		visit '/peaches'
    click_link('Create a Peach')
    expect(current_path).to eq('/peaches/new')
	end

	it "fills in the form" do
		visit '/peaches/new'
		within("#new_peach") do
			fill_in 'Name', :with => 'Get a pet'
			fill_in 'Deadline', :with => 4
		end
		click_button 'Create Peach'
		expect(current_path).to eq("/peaches/#{Peach.last.id}")
	end
end

#given I'm in on the index page
#when click on new peach button
#then I am redirected to the peach/new#

#given I'm on the peach/new page
#when I fill in the form with name and deadline 
#and I click the submit button
#then I am redirected to the peach/show page#

#given I'm on the peach show page
#when I'm on the peach show page
#then I can see the peach we just made

require 'rails_helper'

feature 'User', driver: :selenium do
  before :each do
  	HeatingCord.create!(mode: HeatingCord::HEATIN_CORD_OFF_MODE)
  end	
  scenario 'can see titles and control buttons on main page' do 	

  	visit root_path
    
    # check labels
  	expect(page).to have_content 'Heating cord'
  	expect(page).to have_css ".heating_cord_mode h2", text: 'MODE: HEATIN_CORD_OFF_MODE'

  	#check buttons
  	expect(page).to have_css "#btn_auto_1h_per_day"
    expect(page).to have_css "#btn_auto_1h_switch_mode"
    page.save_screenshot('log/screenshot.png')
  end

  scenario 'can click on MANUAL_ON button and will see success status' do
  	visit root_path

  	click_link 'MANUAL ON'

  	expect(page).to have_content 'HeatingCord mode updated. {:status=>"OK"}'
  end 	
	
end
	

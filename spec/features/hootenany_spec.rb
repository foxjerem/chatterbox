require 'helpers/general'

feature 'Replying to hoots' do

	before(:each) do
		create_test_user
		sign_in_test_user	
		hoot('test hoot')	
	end
	
	scenario 'while browsing the home page' do
		visit('/')
		click_button 'reply'
		expect(page).to have_content("Hoot 'Em Backs")
		fill_in 'content', :with => 'reply'
		click_on "Hoot 'Em Back"
		expect(user.replies.count).to eq(1)
		expect(user.replies.first.content).to eq('reply')
	end

	scenario 'navigating to the hootenannies page' do
		visit('/')
		click_button 'reply'
		expect(page).to have_content("Hoot 'Em Backs")
		fill_in 'content', :with => 'reply'
		click_on "Hoot 'Em Back"

		visit('/')
		click_on 'profile-button'

		within 'div.hoot-daddy' do
			expect(page).to have_content('Hoot Daddy')
			expect(page).to have_content('test hoot')
		end

		within 'div.hoot-em-backs' do
			expect(page).to have_content("Hoot 'Em Backs")
			expect(page).to have_content('reply')
		end

	end

end
def create_test_user
	User.create(:username => 'test',
							:name => 'test name',
							:email => 'test@test.com',
							:password => 'password',
							:password_confirmation => 'password')
end

def user
	User.first
end

def sign_up(name, username, email, password, password_confirmation)
	visit '/users/new'
	within '#sign-up-form' do
		fill_in 'name', :with => name
		fill_in 'username', :with => username
		fill_in 'email', :with => email
		fill_in 'password', :with => password
		fill_in 'password_confirmation', :with => password_confirmation
		click_on 'Sign Up'
	end
end
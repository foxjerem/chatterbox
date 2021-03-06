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

def hoot
	Hoot.first
end

def reply
	Reply.first
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

def sign_in(username, password)
	visit '/sessions/new'
	fill_in 'username', :with => username
	fill_in 'password', :with => password
	click_button 'Sign In'
end

def sign_in_test_user
	sign_in('test', 'password')
end

def request_password_reset_for(username)
	visit '/sessions/new'
	click_link('Forgotten password?')
	fill_in 'username', :with => username
	click_button('Reset')
end

def set_new_password(token)
	visit "/users/reset_password/#{token}"
	fill_in 'new_password', :with => 'new'
	fill_in 'new_password_confirmation', :with => 'new'
	click_button 'Reset'
end

def create_hoot(content)
	click_on 'Hoot'
	fill_in 'content', :with => content
	click_on 'Hoot Away'
end

def create_hoot_em_back(content)
	visit('/')
	click_button 'reply'
	fill_in 'content', :with => content
	click_on "Hoot 'Em Back"
end

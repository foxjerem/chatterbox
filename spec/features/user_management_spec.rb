require './spec/helpers/general'

feature 'User signs up' do

	scenario 'while being logged out' do
		expect(Mailer).to receive(:send_message)
		sign_up('test', 'test', 'test@test.com', '1234', '1234')
		expect(page).to have_content('Welcome, test')
		expect(User.count).to eq(1)
		expect(user.name).to eq('test')
	end

	scenario 'with another users username' do
		sign_up('test', 'test', 'test@test.com', '1234', '1234')
		sign_up('test2', 'test', 'test2@test.com', '1234', '1234')
		expect(page).to have_content('This username is already taken')
	end

	scenario 'with another users email' do
		sign_up('test2', 'test', 'test@test.com', '1234', '1234')
		sign_up('test2', 'test2', 'test@test.com', '1234', '1234')
		expect(page).to have_content('This email is already taken')
	end

	scenario 'with passwords that do not match' do
		sign_up('test2', 'test2', 'test@test.com', '1234', 'Not 1234')
		expect(page).to have_content('Sorry your passwords do not match')
	end

end

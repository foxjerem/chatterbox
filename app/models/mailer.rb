class Mailer

		def self.send_message(to, subject, message_body)
			 RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
		  "@api.mailgun.net/v2/app28097521.mailgun.org/messages",
		  :from => "ChatterBOX <#{ENV['MAILGUN_SMTP_LOGIN']}>",
		  :to => to,
		  :subject => subject,
		  :text => message_body
		end

end
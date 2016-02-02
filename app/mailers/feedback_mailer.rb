class FeedbackMailer < ApplicationMailer
	def feedback_email(customer, host, current_user, feedback_body)
	@url = "http://localhost:3000/feedbacks"
	@host = "placero.noreply@gmail.com"
	@customer = customer
	@current_user = current_user
	@feedback_body = feedback_body 
	mail(to: @host, subject: "You have received a feedback from #{@current_user.email}")
	end
end

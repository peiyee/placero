class FeedbackJob < ActiveJob::Base
  	# include Sidekiq::Worker
	queue_as :default
	def perform(customer, host, current_user, feedback_body)
		@url = "http://localhost:3000/feedbacks"
		@host = "placero.noreply@gmail.com"
		@customer = customer
		@current_user = current_user
		@feedback_body = feedback_body
		FeedbackMailer.feedback_email(@customer, @host, @current_user, @feedback_body).deliver_now
	end 
end 
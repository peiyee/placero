class ReportJob < ActiveJob::Base
queue_as :default 
	def perform(customer, host, current_user, report_body)
	@url = "http://localhost:3000/places/:place_id/reports"
	@host = "placero.noreply@gmail.com"
	@customer = customer
	@current_user = current_user
	@report_body = report_body 
	ReportMailer.report_email(@customer, @host, @current_user, @report_body).deliver_now
	end 
end 
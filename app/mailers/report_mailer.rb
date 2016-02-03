class ReportMailer < ApplicationMailer
	def report_email(customer, host, current_user, report_body)
	@url = "http://localhost:3000/places/:place_id/reports"
	@host = "placero.noreply@gmail.com"
	@customer = customer
	@current_user = current_user
	@report_body = report_body 
	mail(to: @host, subject: "You have received a report from #{@current_user.email}")
	end
end

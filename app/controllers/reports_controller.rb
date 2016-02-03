require_relative '../jobs/reportjob'
class ReportsController < ApplicationController
  def index
  end

  def create 
  	ReportJob.perform_later(@customer, @host, current_user, report_params[:body])
  end

  private

  def report_params
  	params.require(:report).permit(:body)
  end
end  	
class FeedbacksController < ApplicationController
  def index
  end

  def create 
	FeedbackMailer.feedback_email(@customer, @host, current_user, feedback_params[:body]).deliver_now
  end

  private

  def feedback_params
  	params.require(:feedback).permit(:body)
  end
end  	
# def create
#     # @reservation = current_user.reservations.new(reservation_params)
#     @reservation = Reservation.new(reservation_params)
#     @reservation.user_id = current_user.id
#     @listing = Listing.find(params[:listing_id])
    
#     @customer = current_user
#     # @reservation.listing_id = params[:listing_id]
#     respond_to do |format|
#       if @reservation.save
#         format.html { redirect_to listing_reservation_url(@listing,@reservation), notice: 'Reservation was successfully created.' }
#         format.json { render :show, status: :created, location: @reservation }
#         ReservationMailer.booking_email(@customer, @host, @reservation_id).deliver_now
#         ReservationMailer.customer_email(@customer, @host).deliver_now
#       else
#         format.html { render :edit }
#         format.json { render json: @reservation.errors, status: :unprocessable_entity }
#       end
#     end
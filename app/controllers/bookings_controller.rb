class BookingsController < ApplicationController

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create
    @flat = Flat.find(params[:flat_id])

    @booking = Booking.new(params[:booking])

    @booking.flat = @flat

    @booking.save

  end

  private

  def user_params
    params.require(:booking).permit(:number_of_night, :date_check_in, :date_check_out, :number_of_guest, :flat_id, :traveller_id)
  end
end

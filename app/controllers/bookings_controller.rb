class BookingsController < ApplicationController

  def show
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.find(params[:id])
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.date_check_in = Date.new(params[:booking]['date_check_in(1i)'].to_i, params[:booking]['date_check_in(2i)'].to_i, params[:booking]['date_check_in(3i)'].to_i )
    @booking.date_check_out = Date.new(params[:booking]['date_check_out(1i)'].to_i, params[:booking]['date_check_out(2i)'].to_i, params[:booking]['date_check_out(3i)'].to_i )
    @booking.number_of_guests = params[:booking][:number_of_guests]
    @flat = Flat.find(params[:flat_id])

    @booking.flat = @flat
    @booking.user = current_user

    respond_to do |format|
      if @booking.save
        format.html { redirect_to flat_booking_path(@flat, @booking), notice: "Successfully created booking"}
        format.json {}
      else
        format.html { render :new }
      end
    end

  end

  def number_of_nights
    params[:date_check_out] - params[:date_check_in]
  end
end

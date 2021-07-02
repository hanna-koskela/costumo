class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end
  
  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
    @costume.costume_id = @costume
  end

  def create
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.costume_id = params[:costume_id]
    @booking.save
    if @booking.save
      puts "saved"
      redirect_to bookings_path(@booking)
    else
      puts "not saved"
      render :new
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :user_id, :costume_id)
  end 

end
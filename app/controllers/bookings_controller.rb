class BookingsController < ApplicationController
  before_action :find_costume, only: [:new, :create]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.costume = @costume
    if @booking.save
      redirect_to bookings_path, notice: "Costume #{@costume.title} is booked sucessfully !"
    else
      # render :new
      redirect_to costume_path(@costume), alert: @booking.errors.full_messages.first
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
    params.require(:booking).permit(:date_start, :date_end)
  end

  def find_costume
    @costume = Costume.find(params[:costume_id])
  end
end

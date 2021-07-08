class BookingsController < ApplicationController
  before_action :find_costume, only: [:new, :create]
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  
  def index
    @bookings = Booking.where(user: current_user).where('date_end > ?', Date.today)
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
      flash.now[:alert] = @booking.errors.full_messages.first
      render "costumes/show" # same as if going to costumes#show  , back to itself with selected dates untouched
      # redirect_to costume_path(@costume), alert: @booking.errors.full_messages.first
    end
  end

  def show
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: "Costume booking is updated sucessfully !"
    else
      flash.now[:alert] = @booking.errors.full_messages.first
      render :edit
    end
  end

  def edit
  end

  def destroy
    @booking.destroy

    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :costume_id)
  end

  def find_costume
    @costume = Costume.find(params[:costume_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end

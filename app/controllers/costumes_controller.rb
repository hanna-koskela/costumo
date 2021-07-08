class CostumesController < ApplicationController
  before_action :find_costume, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :home
  def home
    if params[:query].present?
      @costumes = Costume.search_by_title_and_description(params[:query])
    else
      @costumes = Costume.all
    end
  end

  def index
    @costumes = Costume.where(user: current_user) if user_signed_in?
  end

  def show
    @booking = Booking.new
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    if @costume.save
      redirect_to costumes_path, notice: "Costume #{@costume.title} posted sucessfully !"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @costume.update(costume_params)
      redirect_to costume_path(@costume)
    else
      render :edit
    end
  end

  def destroy
    @costume.destroy
    redirect_to costumes_path
  end

  private

  def costume_params
    params.require(:costume).permit(:title, :description, :price, photos: [])
  end

  def find_costume
    @costume = Costume.find(params[:id])
  end
end

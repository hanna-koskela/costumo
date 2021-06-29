class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @costumes = Costume.all
  end

  def index
  end

  def show
  end
end

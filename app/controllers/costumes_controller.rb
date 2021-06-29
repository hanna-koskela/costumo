class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @costumes = Costume.all
  end

  def show
  end
end

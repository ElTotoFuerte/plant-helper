class PlantsController < ApplicationController
  def index
    if params[:query].present?
      @plants = Plant.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @plants = Plant.all
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'plants/list', locals: { plants: @plants }, formats: [:html] }
    end
  end

  def show
    @plant = Plant.find(params[:id])
  end
end

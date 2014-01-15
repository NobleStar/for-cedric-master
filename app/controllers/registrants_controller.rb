class RegistrantsController < ApplicationController
	before_filter :set_registrant, only: [:show, :edit, :update, :destroy]
	respond_to :json

  def index
  	@registrants = User.all
  	respond_to do |format|
  		format.html
  		format.json { render json: @registrants }
  	end
  end

  def show
  end

  private
  def set_registrant 
  	@registrant = User.find(params[:id])
  end

  def registrant_params
  	params.require(:user).permit(:name, :email, :id, :created_at)
  end
end

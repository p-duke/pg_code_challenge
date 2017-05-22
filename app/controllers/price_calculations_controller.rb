class PriceCalculationsController < ApplicationController
  #before_action :parse_params only: [:create]
    
  def new
    #This is not necessary at the moment
    @price_calculation = PriceCalculation.new
  end

  def create
    @users = User.new(params[:user])
    @price_calculations = PriceCalculation.new(user: @user)

    if @price_calculation.valid?
      render "show", layout: false
    else
      render :new
    end
  end

  def show
  end

  private

  def parse_params
    
  end

end

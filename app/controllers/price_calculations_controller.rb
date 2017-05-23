class PriceCalculationsController < ApplicationController
  include PriceCalculationsHelper
    
  def new
    @price_calculation = PriceCalculation.new
  end

  def create
    @policy_calculations = create_policy_calculations(params)
    render "show", layout: false
  end

end

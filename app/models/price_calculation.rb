class PriceCalculation
  include ActiveModel::Model
  
  BASE_COST = 100.00

  attr_accessor :total_cost

  def initialize(params = {})
    @user = params[:user]
    @total_cost = BASE_COST
  end

  def run_policy_calculation
    if !user.over_18?
      return
    end

    age_eligibility
    east_coast_discount_eligibility
    health_condition_calculations
    female_discount_eligibility 
  end

  private 
  attr_reader :user

  def age_eligibility
    multiplier = (user.age - 18) / 5 
    additional_cost = multiplier * 20
    @total_cost += additional_cost
  end

  def east_coast_discount_eligibility
    if user.east_coast_location?
      @total_cost *= 0.95
    end
  end

  def health_condition_calculations
    user_hcs = user.health_conditions
    cost_increase = 0.00

    if user_hcs
      user_hcs.each {|hc| cost_increase += hc.cost_increase}
    end

    @total_cost += (@total_cost * cost_increase).round(2)
  end

  def female_discount_eligibility
    if user.is_female?
      @total_cost -= 12
    end
  end

end

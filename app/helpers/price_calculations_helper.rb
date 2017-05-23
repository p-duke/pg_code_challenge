module PriceCalculationsHelper

  def create_policy_calculations(params)
    policy_calculations = []
    users = parse_params(params)
    users.each do |user|
      new_user = User.new(user)
      price_calc = PriceCalculation.new(user: new_user)
      price_calc.run_policy_calculation
      policy_calculations << [new_user, price_calc]
    end

    policy_calculations
  end

  def parse_params(params)
   users = []
   user_params = params["info"].split("\r\n")
   header = user_params.shift.split("|").map(&:strip)
   header.map! {|title| title.parameterize.underscore}
   user_data = user_params.map {|param| param.split("|").map(&:strip)}

   user_data.each do |data|
     users << header.zip(data).to_h
   end

   users.each_with_index.map do |key,val|
     key["health_conditions"]= key["health_conditions"].split(',').map(&:strip)
     key["age"] = key["age"].to_i
   end

   users
  end
end

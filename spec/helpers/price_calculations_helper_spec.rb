require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PriceCalculationsHelper. For example:
#
# describe PriceCalculationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PriceCalculationsHelper, type: :helper do

  describe '#create_policy_calculations' do
    let(:params) { { "info"=>"First Name | Age | Gender | Location | Health Conditions\r\nKelly | 50 | female | Boston | Allergies\r\nJosh | 40 | male | Seattle | Sleep Apnea\r\nJan | 30 | female | New York | Heart Disease, High Cholesterol\r\nBrad | 20 | male | San Francisco | n/a\r\nPetr | 10 | male | Los Angeles | Asthma", "controller"=>"price_calculations", "action"=>"create" } }

    it 'should create an array of users and price calculations' do
      expect(helper.create_policy_calculations(params).first).to include(a_kind_of(User))
      expect(helper.create_policy_calculations(params).first).to include(a_kind_of(PriceCalculation))
    end
  end
end

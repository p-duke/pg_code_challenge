require 'rails_helper'

RSpec.describe PriceCalculation, type: :model do
  let(:user) { User.new(name: "Kelly", age: 50, gender: 'female', location: 'Boston', health_conditions: ['Allergies', 'Heart Disease']) }
  let(:params) { { user: user } }

  subject(:price_calculation) { PriceCalculation.new(params) }

  describe 'initialize' do
    it { is_expected.to have_attributes(total_cost: 100) }
  end

  describe '#run_policy_calculation' do
    before do
      price_calculation.total_cost = 100
    end

    context 'when the entire calculation is run' do
      before { price_calculation.run_policy_calculation }

      it 'should calculate the entire policy price' do
        expect(price_calculation.total_cost).to eq(234.62)
      end
    end

    describe '#age_eligibility' do
      context 'when the user is over 18' do
        before { price_calculation.send(:age_eligibility) }

        it 'should apply the appropriate additional cost' do
          expect(price_calculation.total_cost).to eq(220)
        end
      end
    end

    describe '#east_coast_discout_eligibility' do
      context 'when the user is located on the east coast' do
        before { price_calculation.send(:east_coast_discount_eligibility) }

        it 'should apply the appropriate east coast discout' do
          expect(price_calculation.total_cost).to eq(95)
        end
      end
    end

    describe '#health_condition_calculations' do
      context 'when the user has health conditions' do
        before { price_calculation.send(:health_condition_calculations) }

        it 'should apply the additional health increases' do
          expect(price_calculation.total_cost).to eq(118)
        end
      end
    end

    describe '#female_discount_eligibility' do
      context 'when the users gender is female' do
        before { price_calculation.send(:female_discount_eligibility) }

        it 'should apply the current discount' do
          expect(price_calculation.total_cost).to eq(88)
        end
      end
    end
  end
end

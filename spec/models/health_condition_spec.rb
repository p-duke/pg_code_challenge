require 'rails_helper'

RSpec.describe HealthCondition, type: :model do

  let(:params) { {name: 'Heart Disease'} }
  subject(:health_condition) { HealthCondition.new(params) }


  describe 'initialize' do
    it { is_expected.to have_attributes(name: 'Heart Disease') }
    it { is_expected.to have_attributes(cost_increase: 0.17) }
  end

  describe 'validations' do
    context 'when the health conditions name exists' do
      it { should be_valid }
    end

    context 'when the health conditions name is blank' do
      before { health_condition.name = '' }

      it { should_not be_valid }

      it 'should add an error message' do
        expect { health_condition.valid? }.to change { health_condition.errors.messages.count }.by(1)
      end
    end
  end

  describe 'CONSTANTS' do
    subject { HealthCondition }

    it { should be_const_defined(:CONDITIONS) }
  end
end

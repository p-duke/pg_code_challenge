require 'rails_helper'

RSpec.describe User, type: :model  do

  params = {name: 'Charlie', age: 50, gender: 'male', location: 'California', health_conditions: ["Heart Disease", "High Cholesterol"]} 
  subject(:user) { User.new(params) }
    
  describe 'initialize' do

    it { is_expected.to have_attributes(name: 'Charlie') }
    it { is_expected.to have_attributes(age: 50) }
    it { is_expected.to have_attributes(gender: 'male') }
    it { is_expected.to have_attributes(location: 'California') }
    it { is_expected.to have_attributes(health_conditions: ['Heart Disease', 'High Cholesterol'] ) }

  end

  describe "validations" do
    
    context "when the user's name exists" do
      it { should be_valid }
    end

    context "when the user's name is empty" do
      before { user.name = "" }

      it { should_not be_valid }

      it 'adds the error message' do
        expect { user.valid? }.to change{ user.errors.messages.count }.by(1)
      end

    end

    context "when the user's age is an integer" do
      it { should be_valid }
    end

    context "when the user's age is not an integer" do
      before { subject.age = "pizza" }

      it { should_not be_valid }
    end

    context "when the user's gender is either male or female" do
      it { should be_valid }
    end

    context "when the user's gender is not male or female" do
      before { subject.gender = "taco" }

      it { should_not be_valid }
    end
  end
end

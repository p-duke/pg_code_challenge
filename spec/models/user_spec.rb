require 'rails_helper'

RSpec.describe User, type: :model  do

  params = {"first_name"=> 'Charlie', "age"=> 22, "gender"=> 'female', "location"=> 'Boston', "health_conditions"=> ["Heart Disease", "High Cholesterol"]}
  subject(:user) { User.new(params) }
    
  describe 'initialize' do

    it { is_expected.to have_attributes(first_name: 'Charlie') }
    it { is_expected.to have_attributes(age: 22) }
    it { is_expected.to have_attributes(gender: 'female') }

    it 'should contain a health condition object' do
      expect(user.health_conditions.first).to be_instance_of(HealthCondition)
    end
  end

  describe "validations" do
    
    context "when the user's first_name exists" do
      it { should be_valid }
    end

    context "when the user's first_name is empty" do
      before { user.first_name = "" }

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

  describe '#number_of_years_over_18' do
    it 'should return the number of years over' do
      expect(user.number_of_years_over_18).to eq(4)
    end
  end

  describe '#over_18?' do
    context 'when the users age is > 18' do
      it 'should be truthy' do
        expect(user.over_18?).to be_truthy
      end
    end

    context 'when the users age is <= 18' do
      before { user.age = 17 }

      it 'should be falsey' do
        expect(user.over_18?).to be_falsey
      end
    end
  end

  describe '#east_coast_location?' do
    context 'when the users location is on the east coast' do
      it 'should be truthy' do
        expect(user.east_coast_location?).to be_truthy
      end
    end

    context 'when the users location is not on the east coast' do
      before { user.location = 'Mars' }

      it 'should be falsey' do
        expect(user.east_coast_location?).to be_falsey
      end
    end
  end

  describe '#is_female?' do
    context 'when the users gender is female' do
      it 'should be truthy' do
        expect(user.is_female?).to be_truthy
      end
    end

    context 'when the users gender is not female' do
      before { user.gender = 'male' }

      it 'should be falsey' do
        expect(user.is_female?).to be_falsey
      end
    end
  end
end

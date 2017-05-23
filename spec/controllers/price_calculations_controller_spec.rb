require 'rails_helper'

RSpec.describe PriceCalculationsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:info) { { "info"=>"First Name | Age | Gender | Location | Health Conditions\r\nKelly | 50 | female | Boston | Allergies\r\nJosh | 40 | male | Seattle | Sleep Apnea\r\nJan | 30 | female | New York | Heart Disease, High Cholesterol\r\nBrad | 20 | male | San Francisco | n/a\r\nPetr | 10 | male | Los Angeles | Asthma", "controller"=>"price_calculations", "action"=>"create" } }

    it "renders the show view" do
      post :create, info 
      expect(response).to render_template(:show)
    end
  end
end

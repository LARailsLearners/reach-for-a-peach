require 'rails_helper'

RSpec.describe PeachesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "populates an array of peaches" do
      peach = create(:peach)
      get :index
      expect(peach.name).to eq("Get a life")
      expect(peach.deadline).to eq(5)
    end
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  describe "GET #new" do
      it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  #WIP
  describe "GET #show" do
    it "get correct peach id" do
      peach = create(:peach)
      get :show, id: peach
      assigns(:peach).should eq(peach)
      expect(peach.name).to eq("Get a life")
      expect(peach.deadline).to eq(5)
    end
  end

end

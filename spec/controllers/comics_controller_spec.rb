require 'rails_helper'

describe ComicsController do
  describe "GET #Index" do
    it "populates a list of comics" do
      comic = 
      get :index
      assigns(:comics).should eq([comic])
    end
    it "renders the :index view"
  end
end

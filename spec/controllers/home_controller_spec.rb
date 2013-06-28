require 'spec_helper'

describe HomeController do
  describe "GET show" do
    it "renders the page" do
      get :show
      expect(response.status).to eq 200
    end
  end
end

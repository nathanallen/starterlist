require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  # describe "GET ':custom_url'" do
  #   it "reroutes to index displaying list name" do
  #     visit '/custom'
  #     response.should be_success
  #   end
  # end

end

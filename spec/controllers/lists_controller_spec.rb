require 'spec_helper'

describe ListsController do

  valid_input = {requested_name: Time.now.to_i.to_s, owner_email: "owner@email.com"}
  invalid_input = valid_input #list name now exists in database

  context "Creating a new list" do
    describe "with an available name" do
      it "returns status:success" do
        post :create, valid_input
        response_json.should eq({status: "success"})
      end
    end

    describe "with a taken name" do
      it "returns an error" do
        post :create, invalid_input
        response_json.should eq({status: "failed", error_message: "Name not available"})
      end
    end
  end

  context "Subscribing to a list" do
    describe "that exists" do
      it "returns status:success" do
        post :subscribe, valid_input
        response_json.should eq({status: "success"})
      end
    end

    describe "that does not exist" do
      it "returns an error" do
        post :subscribe, list_name: "!doesnotexist", email: "unique@email.com"
        response_json.should eq({status: "failed", error_message: "List does not exist"})
      end
    end
  end

end

def response_json
  JSON.parse(response.body)
end

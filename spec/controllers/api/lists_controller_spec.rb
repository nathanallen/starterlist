require 'spec_helper'

describe Api::ListsController do

  valid_input = {"requested_name" => Time.now.to_i.to_s, "owner_email" => "owner@email.com"}

  context "Creating a new list" do
    describe "with an available name" do
      it "returns status:success" do
        post :create, valid_input
        response_json.should eq({"status" => "success"})
      end
    end

    describe "with a name that's been taken" do
      it "returns an error" do
        List.create(url: "taken", owner: User.create(email:"e@g.com"))
        post :create, "requested_name" => "taken", "owner_email" => "owner@email.com"
        response_json.should eq({"status" => "failed", "error_message" => "Name not available"})
      end
    end
  end

  context "Subscribing to a list" do
    describe "that exists" do
      it "returns status:success" do
        post :subscribe, valid_input
        response_json.should eq({"status" => "success"})
      end
    end

    describe "that does not exist" do
      it "returns an error" do
        post :subscribe, "list_name" => "!doesnotexist", "email" => "unique@email.com"
        response_json.should eq({"status" => "failed", "error_message" => "List does not exist"})
      end
    end
  end

end

def response_json
  JSON.parse(response.body)
end

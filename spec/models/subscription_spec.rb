require 'spec_helper'

describe Subscription do
  context "database associations" do
    it { should belong_to(:user) }
    it { should belong_to(:list) }
  end

  context "on creating a new list" do
    it "ensures list owner is a subscriber" do
      new_user = User.create(email: "test@test.com")
      new_list = List.create(url: "test", owner: new_user)
      new_subscription = Subscription.where(list_id: new_list.id)
      expect(new_subscription.last.user_id).to eq(new_user.id)
    end
  end
end
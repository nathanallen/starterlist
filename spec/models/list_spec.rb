require 'spec_helper'

describe List do
  it { should belong_to(:owner) }
  it { should have_many(:users).through(:subscriptions) }
  it { should validate_uniqueness_of(:url) }
end

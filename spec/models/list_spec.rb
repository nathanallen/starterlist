require 'spec_helper'

describe List do
  it { should belong_to(:owner) }
  it { should have_many(:users).through(:subscriptions) }
  it { should validate_uniqueness_of(:url) }
  it { should_not allow_value('/?=illegal', '#symbol', 'punctuat!on', 'space ' ).for(:url) }
end

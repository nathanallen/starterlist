class User < ActiveRecord::Base
  has_many :lists
  has_many :subscriptions
  has_many :lists, through: :subscriptions
end
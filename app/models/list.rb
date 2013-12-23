class List < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :subscriptions
  has_many :users, through: :subscriptions
  validates_uniqueness_of :url
end
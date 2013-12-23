class List < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :subscriptions
  has_many :users, through: :subscriptions
  validates_uniqueness_of :url
  after_create :subscribe_owner_to_list

  def subscribe_owner_to_list
    Subscription.find_or_create_by(list_id: self.id, user_id: self.owner.id)
  end

  def subscriptions
    Subscription.where(list_id: self.id)
  end

  def subscribers
    subscriptions.map{ |s| User.find_by(id: s.user_id) }
  end

  def emails
    subscribers.map{ |user| user.email }
  end
end
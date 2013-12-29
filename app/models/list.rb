class List < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  has_many :subscriptions
  has_many :users, through: :subscriptions
  validates_uniqueness_of :url
  validates_format_of :url, with: /\A[a-zA-Z0-9\_]+\z/, on: :create
  after_create :subscribe_owner_to_list

  def subscribe(user)
    Subscription.find_or_create_by(list_id: self.id, user_id: user.id)
  end

  def subscribe_owner_to_list
    subscribe(self.owner)
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
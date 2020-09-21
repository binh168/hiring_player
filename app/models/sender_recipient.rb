class SenderRecipient < ApplicationRecord
  belongs_to :actionable, polymorphic: true, optional: true
  belongs_to :sender, class_name: User.name
  belongs_to :receiver, class_name: User.name

  validates :receiver_id, presence: true

  scope :order_comment, ->{order created_at: :desc}
  scope :find_receiver, ->(user_id){where receiver_id: user_id}
  scope :find_sender, ->(user_id){where sender_id: user_id}
  scope :unread, -> (user_id){where(checked: false, receiver_id: user_id)}
  scope :notification, -> do
    where(actionable_type: Comment.name)
    .or(where(actionable_type: Follow.name))
    .or(where(actionable_type: Order.name))
    .or(where(actionable_type: Rating.name))
  end
  scope :ratings, -> (user_id){select(:actionable_id)
    .where(receiver_id: user_id, actionable_type: Rating.name)}
  scope :messenger, -> {where(actionable_type: Messenger.name)}
  scope :find_messenger, -> (sender, receiver) do
    where(sender_id: sender, receiver_id: receiver)
    .or(where(sender_id: receiver, receiver_id: sender))
  end
  scope :message, -> (sender_id){where(actionable_type: Messenger.name, sender_id: sender_id)}
  scope :find_in_time, -> (from, to){where("created_at >= ? AND created_at <= ?", from, to)}
  scope :order_yesterday, ->(yesterday, now){where(created_at: yesterday..now)}
end

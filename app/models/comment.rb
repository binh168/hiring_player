class Comment < ApplicationRecord
  has_many :sender_recipients, as: :actionable, dependent: :destroy

  COMMENT_PARAMS = [:comment].freeze

  scope :order_comment, ->{order created_at: :desc}
end

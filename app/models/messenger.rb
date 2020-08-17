class Messenger < ApplicationRecord
  has_many :sender_recipients, as: :actionable

  scope :messenger, -> id{select("message").where(id: id)}
end

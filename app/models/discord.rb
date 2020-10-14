class Discord < ApplicationRecord
  has_many :sender_recipients, as: :actionable, dependent: :destroy
end

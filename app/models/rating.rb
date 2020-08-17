class Rating < ApplicationRecord
  has_one :sender_recipient, as: :actionable, dependent: :destroy

  scope :by_ids, -> (rating_id){select(:rating).where(id: rating_id)}

  RATING_PARAMS = %i(rating).freeze
end

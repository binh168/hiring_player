class User < ApplicationRecord
  has_secure_password

  has_one :user_profile, dependent: :destroy

  has_many :active, class_name: SenderRecipient.name, foreign_key: :sender_id
  has_many :active_follow, ->{where actionable_type: Follow.name}, class_name: SenderRecipient.name,
    foreign_key: :sender_id
  has_many :active_comment, ->{where actionable_type: Comment.name}, class_name: SenderRecipient.name,
    foreign_key: :sender_id
  has_many :active_rating, ->{where actionable_type: Rating.name}, class_name: SenderRecipient.name,
    foreign_key: :sender_id
  has_many :active_order, ->{where actionable_type: Order.name}, class_name: SenderRecipient.name,
    foreign_key: :sender_id
  has_many :active_messenger, ->{where actionable_type: Messenger.name}, class_name: SenderRecipient.name,
    foreign_key: :sender_id
  has_many :active_discord, ->{where actionable_type: Discord.name}, class_name: SenderRecipient.name,
    foreign_key: :sender_id
  has_many :passive, class_name: SenderRecipient.name, foreign_key: :receiver_id
  has_many :passive_follow, ->{where actionable_type: Follow.name}, class_name: SenderRecipient.name,
    foreign_key: :receiver_id
  has_many :passive_comment, ->{where actionable_type: Comment.name}, class_name: SenderRecipient.name,
    foreign_key: :receiver_id
  has_many :passive_rating, ->{where actionable_type: Rating.name}, class_name: SenderRecipient.name,
    foreign_key: :receiver_id
  has_many :passive_order, ->{where actionable_type: Order.name}, class_name: SenderRecipient.name,
    foreign_key: :receiver_id
  has_many :passive_messenger, ->{where actionable_type: Messenger.name}, class_name: SenderRecipient.name,
    foreign_key: :receiver_id
  has_many :passive_discord, ->{where actionable_type: Discord.name}, class_name: SenderRecipient.name,
    foreign_key: :receiver_id
  has_many :following, through: :active_follow, source: :receiver
  has_many :followers, through: :passive_follow, source: :sender
  has_many :players, class_name: Player.name, foreign_key: :user_id

  accepts_nested_attributes_for :user_profile

  USER_PARAMS = %i(name email password password_confirmation).freeze
  USER_UPDATE_PARAMS = [:name, :email, :password, :password_confirmation, user_profile_attributes: 
    [:id, :address, :age, :gender, :hourly_rent, :avatar], player_attributes: [:game_id, :rank_id]].freeze
  
  before_create :build_user_profile
  
  validates :name, presence: true, length: {maximum: Settings.username_maximum}
  validates :email, presence: true, length: {maximum: Settings.email_maximum}, 
    format: {with: Settings.validate_email}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.password_minimum}
  
  scope :search_name, ->name{where "name LIKE ?", "%#{name}%"}
  scope :except_user, ->(user_id) { where.not(id: user_id) }

  delegate :name, :email, to: :sender_recipients, prefix: :user, allow_nil: true

  devise :omniauthable, omniauth_providers: %i(facebook google_oauth2)
  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 
                                                    BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end
  end

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end
  
  def following? other_user
    following.include? other_user
  end

  def self.from_omniauth auth
    result = User.where(email: auth.info.email).first

    if result
      return result
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.uid = auth.uid
        user.provider = auth.provider
      end
    end
  end
end

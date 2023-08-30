# frozen_string_literal: true

# this is a model
class User < ApplicationRecord
  before_create :generate_confirmation_token
  before_save { self.email = email.downcase }

  has_secure_password

  belongs_to :role

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

  attribute :failed_login_attempts, :integer, default: 0

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    update(confirmed: true, confirmation_token: nil)
  end

  def generate_reset_password_token
    self.reset_password_token = SecureRandom.urlsafe_base64
    save(validate: false)
  end

  def generate_unlock_token
    self.unlock_token = SecureRandom.urlsafe_base64
  end
end

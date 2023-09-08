class User < ApplicationRecord
  has_secure_password

  # Relationships
  has_many :entries
  has_many :categories

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  # Scopes
  scope :for_email, ->(email) { where(email: email) }

  def generate_token(password)
    Authentication::TokenService.new(self).generate_token(password)
  end
end

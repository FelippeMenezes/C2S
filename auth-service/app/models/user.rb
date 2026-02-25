class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, presence: true, length: { minimum: 8 },
            format: {
              with: /(?=.*[A-Za-z])(?=.*\d)/,
              message: "Deve conter pelo menos uma letra e um número"
            }, if: -> { password.present? }
end

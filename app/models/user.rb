# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  validates :email, allow_blank: false, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end

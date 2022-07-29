class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: /@/, uniqueness: true
    validates :password, length: 6..20, on:[:create]
    validates :password_confirmation, presence: true
end

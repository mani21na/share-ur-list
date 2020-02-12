class User < ApplicationRecord
    has_many :lists 
    has_many :share_users, through: :lists

    validates :username, :password, :first_name, :last_name, presence: true
    validates :username, uniqueness: true
    validates :username, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

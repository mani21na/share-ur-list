class User < ApplicationRecord
    has_secure_password
    has_many :lists 
    has_many :share_users
    has_many :shared_lists, through: :share_users, source: :list

    validates :username, :password, :first_name, :last_name, presence: true
    validates :username, uniqueness: true
    validates :username, format: { with: URI::MailTo::EMAIL_REGEXP } 

    def self.search_users_by_username(search)
        self.select("username, id").where("username like ?", "#{search.downcase}")
    end
end

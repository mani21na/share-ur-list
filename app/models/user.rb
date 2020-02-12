class User < ApplicationRecord
    has_many :lists 
    has_many :share_users, through: :lists
end

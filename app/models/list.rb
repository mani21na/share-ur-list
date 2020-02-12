class List < ApplicationRecord
    belongs_to :user
    has_many :share_users
end

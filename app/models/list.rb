class List < ApplicationRecord
    belongs_to :user
    has_many :share_users
    accepts_nested_attributes_for :list
end

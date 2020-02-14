class List < ApplicationRecord
    belongs_to :user
    has_many :items
    has_many :share_users

    accepts_nested_attributes_for :items, :allow_destroy => true

    validates :subject, presence: true, uniqueness: true
end

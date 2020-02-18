class ShareUser < ApplicationRecord
    belongs_to :list

    validates :user_id, uniqueness: true
end

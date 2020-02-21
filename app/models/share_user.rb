class ShareUser < ApplicationRecord
    belongs_to :list
    belongs_to :user

    validates_uniqueness_of :user_id, scope: :list_id
end

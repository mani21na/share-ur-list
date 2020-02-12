class ShareUser < ApplicationRecord
    belongs_to :list
    belongs_to :user, through: :list
end

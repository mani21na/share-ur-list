class Item < ApplicationRecord
    belongs_to :list
    validates :item, presence: true, if: :done_checked?
    validates :quantity, presence: true, if: :item_is_exist?

    def item_is_exist?
        !(item == "") 
    end

    def done_checked?
        done
    end
end
class List < ApplicationRecord
    belongs_to :user
    has_many :items, :dependent => :delete_all
    has_many :share_users, :dependent => :delete_all
    has_many :users, through: :share_users


    accepts_nested_attributes_for :items, :allow_destroy => true
    validates_associated :items

    validates :subject, presence: true
    validates_uniqueness_of :subject, scope: :user_id

    def self.search_lists_by_item(search)
        self.joins(:items).where("item like ?", "#{search.downcase}")
    end
end

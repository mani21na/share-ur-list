class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :share_users, :note, :string
  end
end

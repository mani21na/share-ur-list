class CreateShareUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :share_users do |t|
      t.integer :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end

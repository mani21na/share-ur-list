class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :subject
      t.string :list
      t.boolean :list_check

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :list_id
      t.string :item_no
      t.string :item 
      t.string :quantity
      t.boolean :done

      t.timestamps
    end
  end
end

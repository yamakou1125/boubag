class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.integer :amount, null: false
      t.date :expiration_date
      t.integer :user_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end

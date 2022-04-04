class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string "title"
      t.text  "description"
      t.decimal "price"
      t.timestamps
    end
  end
end

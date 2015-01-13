class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :owner_email, required: true
      t.string :title, required: true
      t.references :category, index: true
      t.text :content
      t.string :location
      t.string :edit_key, null: false
      t.integer :price

      t.timestamps null: false
    end
    add_foreign_key :listings, :categories
  end
end

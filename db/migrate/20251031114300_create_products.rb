class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :size
      t.string :brand
      t.string :condition
      t.decimal :price
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.string :location

      t.timestamps
    end
  end
end

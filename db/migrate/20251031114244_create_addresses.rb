class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :street
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :country
      t.string :address_type

      t.timestamps
    end
  end
end

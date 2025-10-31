class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_price
      t.string :status
      t.string :payment_method
      t.references :shipping_address, null: false, foreign_key: { to_table: :addresses }

      t.timestamps
    end
  end
end

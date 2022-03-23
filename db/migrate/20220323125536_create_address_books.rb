class CreateAddressBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :address_books do |t|
      t.string :name
      t.integer :age
      t.string :phone_number

      t.timestamps
    end
  end
end

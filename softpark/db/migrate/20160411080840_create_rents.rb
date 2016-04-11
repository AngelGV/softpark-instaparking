class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :addres
      t.string :phone
      t.references :user, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

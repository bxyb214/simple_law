class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category, index: true
      t.string :name
      t.string :title
      t.string :sub_title
      t.decimal :price, precision: 12, scale: 3
      t.string :price_desc
      t.boolean :active
      t.text :description

      t.timestamps null: false
    end
  end
end

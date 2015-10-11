class AddPicUrlToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :pic_url, :string
    add_column :categories, :status,  :integer, :default => 0
  end
end

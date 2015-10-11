class CreateKnowledges < ActiveRecord::Migration
  def change
    create_table :knowledges do |t|
      t.belongs_to :category, index: true
      t.string :author
      t.string :title
      t.text :abstract
      t.text :body
      t.boolean :trashed, default: false

      t.timestamps
    end

  end
end

class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.float :price
      t.string :name
      t.string :category
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

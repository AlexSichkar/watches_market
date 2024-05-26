class CreateWatches < ActiveRecord::Migration[7.1]
  def change
    create_table :watches do |t|
      t.string :name
      t.text :description
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :price, precision: 6, scale: 2
      t.text :view_url

      t.timestamps
    end
  end
end

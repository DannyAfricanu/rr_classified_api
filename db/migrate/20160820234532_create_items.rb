class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :category
      t.decimal :price
      t.string :seller_name
      t.decimal :seller_latitude
      t.decimal :seller_longitude
      t.integer :status
      t.date :published_date

      t.timestamps
    end
  end
end

class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :rental_length

      t.timestamps
    end
  end
end

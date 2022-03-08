class AddGameToAssets < ActiveRecord::Migration[6.1]
  def change
    add_column :assets, :game, :string
  end
end

class AddRestaurantToItem < ActiveRecord::Migration
  def change
    add_column :items, :restaurant, :string
  end
end

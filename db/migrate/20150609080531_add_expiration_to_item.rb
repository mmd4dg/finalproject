class AddExpirationToItem < ActiveRecord::Migration
  def change
    add_column :items, :expiration, :date
  end
end

class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :giver, :boolean, default: true
  end
end

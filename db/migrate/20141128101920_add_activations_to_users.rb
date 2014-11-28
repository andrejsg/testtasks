class AddActivationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activated_at, :string
    add_column :users, :activation_digest, :string
    add_column :users, :activated, :boolean, default: false
  end
end

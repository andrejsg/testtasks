class RenameFieldInUsers < ActiveRecord::Migration
  def up
  	rename_column :users, :reset_send_at, :reset_sent_at
  end

  def down
  end
end

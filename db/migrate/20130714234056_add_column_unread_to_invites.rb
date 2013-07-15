class AddColumnUnreadToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :unread, :boolean, default: true
  end
end

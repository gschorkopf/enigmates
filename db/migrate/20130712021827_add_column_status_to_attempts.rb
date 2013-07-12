class AddColumnStatusToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :status, :string
  end
end

class AddColumnModeToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :mode, :string
  end
end

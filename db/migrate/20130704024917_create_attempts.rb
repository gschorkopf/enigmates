class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :puzzle_id
      t.timestamps
    end
  end
end

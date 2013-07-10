class CreateAttemptUsers < ActiveRecord::Migration
  def change
    create_table :attempt_users do |t|
      t.integer :user_id
      t.integer :attempt_id
      t.timestamps
    end
  end
end

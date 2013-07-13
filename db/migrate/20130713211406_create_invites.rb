class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :puzzle_id
      t.integer :attempt_id
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps 
    end
  end
end

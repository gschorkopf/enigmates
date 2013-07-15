class Invite < ActiveRecord::Base
  attr_accessible :puzzle_id, :attempt_id, :sender_id, :receiver_id, :unread

  belongs_to :puzzle
  belongs_to :attempt 
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id

  default_scope order('updated_at DESC')

  def message
    "#{sender} has invited you to attempt <a href='/puzzles/#{puzzle_id}/attempts/#{attempt_id}'>#{puzzle}</a>"
  end

  def mark_as_read
    self.unread = false
    self.save
  end

  def mark_as_unread
    self.unread = true
    self.save
  end
end

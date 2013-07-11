class Attempt < ActiveRecord::Base
  has_many :guesses
  has_many :attempt_users
  has_many :users, through: :attempt_users
  belongs_to :puzzle

  def piece_exists?(piece_id)
    guesses.map(&:piece_id).include?(piece_id)
  end

  def add_player(user_id)
    attempt_users.create(
      attempt_id: id,
      user_id: user_id )
  end

  def has_player?(user_id)
    attempt_users.map(&:user_id).include?(user_id)
  end
end

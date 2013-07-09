class Attempt < ActiveRecord::Base
  has_many :guesses
  belongs_to :puzzle

  def piece_exists?(piece_id)
    guesses.map(&:piece_id).include?(piece_id)
  end
end

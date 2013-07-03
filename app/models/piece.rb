class Piece < ActiveRecord::Base
  attr_accessible :content
  belongs_to :puzzle

  def to_s
    content
  end
end

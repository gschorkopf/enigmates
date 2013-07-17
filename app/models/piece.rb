class Piece < ActiveRecord::Base
  attr_accessible :content, :hint, :alternatives
  belongs_to :puzzle

  def to_s
    content
  end
end

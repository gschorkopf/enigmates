 class Puzzle < ActiveRecord::Base
  attr_accessible :name, :topic, :format, :image_url, :content_noun, :hint_noun, :summary
  has_many :pieces
  has_many :attempts

  def to_s
    name
  end

  def contents
    (pieces.map(&:content) + pieces.map(&:alternatives)).compact
  end

  def total
    pieces.count
  end

  def pieces_in_pairs
    pieces.each_slice(2).to_a
  end
end 

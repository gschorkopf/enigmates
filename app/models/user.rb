class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :authorizations
  validates :name, :email, :presence => true
end

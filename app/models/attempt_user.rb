class AttemptUser < ActiveRecord::Base
  attr_accessible :user_id, :attempt_id

  belongs_to :user
  belongs_to :attempt
end

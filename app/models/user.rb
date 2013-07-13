class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :authorizations
  has_many :attempt_users
  has_many :attempts, through: :attempt_users

  validates :name, :email, :presence => true

  def add_provider(auth_hash)
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create(
        user: self,
        provider: auth_hash["provider"],
        uid: auth_hash["uid"])
    end
  end

  def to_s
    name
  end

  def invited?(attempt_id, sender_id)
    !Invite.where(attempt_id: attempt_id, sender_id: sender_id).empty?
  end

  def invites
    Invite.where(receiver_id: id)
  end
end

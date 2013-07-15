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

  def mark_invites_as_read(attempt_id)
    Invite.where(attempt_id: attempt_id, receiver_id: id).each do |invite|
      invite.mark_as_read
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

  def messages
    Message.where(receiver_id: id)
  end

  def unread_invites
    invites.where(unread: true)
  end

  def has_unread_invites?
    !unread_invites.empty?
  end
end

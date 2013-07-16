class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :user
  belongs_to :user
  validates :provider, :uid, presence: true

  def self.create_from_auth(auth_hash)
    user = User.create(
      name: auth_hash["info"]["name"],
      email: auth_hash["info"]["email"],
      avatar: auth_hash["info"]["image"])
    create(
      user: user,
      provider: auth_hash["provider"],
      uid: auth_hash["uid"])
  end
end

class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    # byebug
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      # byebug
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.name
      user.age = auth.info.age
      user.gender = auth.info.gender
      user.email = auth.info.email
      user.save!
    end
  end
end

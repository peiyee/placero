class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    # byebug
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      byebug
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.name
      user.age = auth.info.age
      user.gender = auth.info.gender
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.save!
    end
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
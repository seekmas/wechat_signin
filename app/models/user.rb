class User < ActiveRecord::Base

  has_one :card
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:wechat]

  def self.from_omniauth(auth)
      puts auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = Time.now.utc.to_i.to_s + ("%04d" % rand(9999)) + '@mot99.com'
          user.password = Devise.friendly_token[0,6]
          user.password_confirmation = user.password
          user.nickname = auth.info.nickname
          user.headimgurl = auth.info.headimgurl
      end
  end

  def self.new_with_session(params, session)
      super.tap do |user|
          if data = session["devise.wechat_data"] && session["devise.wechat_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
          end
      end
  end

end



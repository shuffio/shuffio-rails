class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :brackets
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    User.find_or_create_by!(email: access_token.info['email']) do |user|
      user.email = data['email']
      user.first_name = data['first_name']
      user.last_name = data['last_name']
      user.password = Devise.friendly_token[0, 20]
      user.provider = access_token.provider
      user.uid = access_token.uid
    end
  end
end

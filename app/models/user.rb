class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable , omniauth_providers: [:facebook, :google_oauth2]
  validates :full_name, length: { maximum: 100 } 
  validates :email, presence: true, uniqueness: true, length: { maximum: 150 }
  validates :address, length: { maximum: 200 }
  enum role: [:commom, :admin, :super_admin]
  enum job: [:student, :teacher, :programmer]

  def self.from_omniauth(auth)
    result = User.where(email: auth.info.email).first
    if result
      return result
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.full_name = auth.info.name
        user.image = auth.info.image
        user.uid = auth.uid
        user.provider = auth.provider

        #  If you are using confirmable and the provider(s) you use validate emails
        user.skip_confirmation!
      end
    end
  end
end

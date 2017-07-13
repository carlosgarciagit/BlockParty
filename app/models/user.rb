class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  serialize :avatars, JSON # If you use SQLite, add this line.
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, omniauth_providers: [:facebook]

  has_and_belongs_to_many :interests
  has_many :event_registrations
  has_many :events, through: :event_registrations


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]

      name_array = auth.info.name.split(" ")
      user.first_name = name_array[0]
      user.last_name = name_array[1]

      #binding.pry
      uploader = AvatarUploader.new
      uploader.download! auth.info.image.gsub('http://','https://')

      user.avatar = uploader

      #TODO add these
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end

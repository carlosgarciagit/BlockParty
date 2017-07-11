class Event < ApplicationRecord
  mount_uploader :event_photo, EventPhotoUploader

  has_many :event_registrations
  has_many :users, through: :event_registrations
end

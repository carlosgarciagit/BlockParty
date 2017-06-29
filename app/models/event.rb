class Event < ApplicationRecord
  mount_uploader :event_photo, EventPhotoUploader

end

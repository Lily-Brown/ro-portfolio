class Project < ApplicationRecord
  has_many :images
  has_one  :primary_image, -> { where(is_primary: true) }, :class_name=> 'Image'

end

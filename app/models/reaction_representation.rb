# frozen_string_literal: true

class ReactionRepresentation < ApplicationRecord
  has_many :reactions, dependent: :destroy
  has_attached_file :image,
                    styles: { small: '32x32', med: '64x64' }

  validates :image, # http://stackoverflow.com/a/6645740/3281097
            presence: true
  validates :description,
            presence: true,
            length: { in: 2..40 }
  validates_attachment_content_type :image,
                                    content_type: %r{\Aimage\/.*\z}
  validates_attachment_size :image,
                            less_than: 5.megabytes
end

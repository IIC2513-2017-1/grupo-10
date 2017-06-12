# frozen_string_literal: true

class Prize < ApplicationRecord
  has_attached_file :image,
                    styles: { small: '64x64', med: '100x100', large: '200x200' }

  belongs_to :raffle

  validates :name,
            presence: true,
            length: { in: 2..40 }
  validates :description,
            presence: true,
            exclusion: { in: [nil] },
            length: { maximum: 100 }
  validates :image, # http://stackoverflow.com/a/6645740/3281097
            presence: true
  validates :raffle,
            presence: true,
            exclusion: { in: [nil] }
  validates_attachment_content_type :image,
                                    content_type: %r{\Aimage\/.*\z}
  validates_attachment_size :image,
                            less_than: 5.megabytes
end

# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  style      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :band_id, :style, presence: true
  validates :style, inclusion: { in: %w(live studio) }


  belongs_to :band

  has_many :tracks,
    dependent: :destroy
end

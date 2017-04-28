# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  album_id   :integer          not null
#  lyrics     :text
#  release    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :title, :album_id, :release, presence: true
  validates :release, inclusion: { in: %w(bonus regular) }

  belongs_to :album

  has_many :notes

end

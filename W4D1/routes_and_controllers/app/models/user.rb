class User < ApplicationRecord

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'Artwork'

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: 'ArtworkShare'

  has_many :shared_artworks,
    source: :artwork,
    through: :artwork_shares
end

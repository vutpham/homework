class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :track, null: false
      t.timestamps
    end
  end
end

class CreateBands < ActiveRecord::Migration[5.0]
  def change
    create_table :bands do |t|
      t.string :name

      t.timestamps
    end
    add_index :bands, :name
  end
end

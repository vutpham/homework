class CreateHouseTable < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :address
      t.timestamps null: false
    end
  end
end

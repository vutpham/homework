class CreatePeopleTable < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :house_id
      t.timestamps null: false
    end
  end
end

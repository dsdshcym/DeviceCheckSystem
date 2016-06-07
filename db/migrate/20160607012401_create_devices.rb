class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :model
      t.string :location
      t.references :device_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

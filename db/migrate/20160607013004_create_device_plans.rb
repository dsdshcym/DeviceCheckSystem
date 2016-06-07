class CreateDevicePlans < ActiveRecord::Migration
  def change
    create_table :device_plans do |t|
      t.date :scheduled_date
      t.string :status
      t.references :device, index: true, foreign_key: true
      t.references :check_plan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

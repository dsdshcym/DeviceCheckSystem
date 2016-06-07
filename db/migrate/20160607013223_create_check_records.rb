class CreateCheckRecords < ActiveRecord::Migration
  def change
    create_table :check_records do |t|
      t.date :date
      t.time :time_usage
      t.string :note
      t.references :device_plan, index: true, foreign_key: true
      t.references :engineer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateCheckPlans < ActiveRecord::Migration
  def change
    create_table :check_plans do |t|
      t.string :name
      t.integer :interval
      t.string :remark
      t.references :device_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

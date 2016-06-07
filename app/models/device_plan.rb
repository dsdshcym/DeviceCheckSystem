class DevicePlan < ActiveRecord::Base
  belongs_to :device
  belongs_to :check_plan

  validates :scheduled_date, uniqueness: {
              scope: [:device_id,
                      :check_plan_id]
            }
end

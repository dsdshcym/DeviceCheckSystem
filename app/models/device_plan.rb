class DevicePlan < ActiveRecord::Base
  belongs_to :device
  belongs_to :check_plan

  validates :scheduled_date, uniqueness: {
              scope: [:device_id,
                      :check_plan_id]
            }, on: :create

  scope :next_n_days, lambda { |days|
    where(
      scheduled_date:(Date.today)..(Date.today+days.days),
      status: "TODO"
    )
  }
end

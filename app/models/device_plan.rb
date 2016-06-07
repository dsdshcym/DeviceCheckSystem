class DevicePlan < ActiveRecord::Base
  belongs_to :device
  belongs_to :check_plan
end

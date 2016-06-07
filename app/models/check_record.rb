class CheckRecord < ActiveRecord::Base
  belongs_to :device_plan
  belongs_to :engineer
end

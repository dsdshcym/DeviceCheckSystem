class Device < ActiveRecord::Base
  belongs_to :device_type
  has_many :device_plans
end

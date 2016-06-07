class DeviceType < ActiveRecord::Base
  has_many :devices
  has_many :check_plans

  def to_s
    name
  end
end

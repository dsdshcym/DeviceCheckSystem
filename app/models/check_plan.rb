class CheckPlan < ActiveRecord::Base
  belongs_to :device_type
  has_many :devices, through: :device_type

  def to_s
    name
  end
end

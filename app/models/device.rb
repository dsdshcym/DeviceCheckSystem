class Device < ActiveRecord::Base
  belongs_to :device_type
  has_many :device_plans
  has_many :check_plans, through: :device_type

  def to_s
    name
  end
end

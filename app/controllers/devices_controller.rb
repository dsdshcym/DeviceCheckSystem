class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy, :generate]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /devices/1/generate
  # POST /devices/1/generate.json
  def generate
    check_plans = @device.check_plans
    plans_to_add = check_plans.map do |check_plan|
      interval = check_plan.interval
      ((Date.today)..(Date.today+1.year)).step(interval).to_a[1..-1].map do |scheduled_date|
        {
          scheduled_date: scheduled_date,
          status: "TODO",
          device: @device,
          check_plan: check_plan
        }
      end
    end.flatten
    DevicePlan.create(plans_to_add)
    respond_to do |format|
      format.html {
        redirect_to @device,
        notice: 'Device Plans in the next year were generated.'
      }
      format.json { render @show, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :model, :location, :device_type_id)
    end
end

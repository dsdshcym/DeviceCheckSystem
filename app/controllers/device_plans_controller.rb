class DevicePlansController < ApplicationController
  before_action :set_device_plan, only: [:show, :edit, :update, :destroy]

  # GET /device_plans
  # GET /device_plans.json
  def index
    @device_plans = DevicePlan.all
  end

  # GET /device_plans/query/10
  # GET /device_plans/query/10.json
  def query
    span = params[:span].to_i
    @device_plans = DevicePlan.where(scheduled_date: (Date.today)..(Date.today+span.days))
    respond_to do |format|
      format.html { render :index }
      format.json { render :index }
    end
  end

  # GET /device_plans/1
  # GET /device_plans/1.json
  def show
  end

  # GET /device_plans/new
  def new
    @device_plan = DevicePlan.new
  end

  # GET /device_plans/1/edit
  def edit
  end

  # POST /device_plans
  # POST /device_plans.json
  def create
    @device_plan = DevicePlan.new(device_plan_params)

    respond_to do |format|
      if @device_plan.save
        format.html { redirect_to @device_plan, notice: 'Device plan was successfully created.' }
        format.json { render :show, status: :created, location: @device_plan }
      else
        format.html { render :new }
        format.json { render json: @device_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /device_plans/1
  # PATCH/PUT /device_plans/1.json
  def update
    respond_to do |format|
      if @device_plan.update(device_plan_params)
        format.html { redirect_to @device_plan, notice: 'Device plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @device_plan }
      else
        format.html { render :edit }
        format.json { render json: @device_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /device_plans/1
  # DELETE /device_plans/1.json
  def destroy
    @device_plan.destroy
    respond_to do |format|
      format.html { redirect_to device_plans_url, notice: 'Device plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device_plan
      @device_plan = DevicePlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_plan_params
      params.require(:device_plan).permit(:scheduled_date, :status, :device_id, :check_plan_id)
    end
end

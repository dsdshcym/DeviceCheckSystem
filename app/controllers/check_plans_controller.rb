class CheckPlansController < ApplicationController
  before_action :set_check_plan, only: [:show, :edit, :update, :destroy]

  # GET /check_plans
  # GET /check_plans.json
  def index
    @check_plans = CheckPlan.all
  end

  # GET /check_plans/1
  # GET /check_plans/1.json
  def show
  end

  # GET /check_plans/new
  def new
    @check_plan = CheckPlan.new
  end

  # GET /check_plans/1/edit
  def edit
  end

  # POST /check_plans
  # POST /check_plans.json
  def create
    @check_plan = CheckPlan.new(check_plan_params)

    respond_to do |format|
      if @check_plan.save
        format.html { redirect_to @check_plan, notice: 'Check plan was successfully created.' }
        format.json { render :show, status: :created, location: @check_plan }
      else
        format.html { render :new }
        format.json { render json: @check_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_plans/1
  # PATCH/PUT /check_plans/1.json
  def update
    respond_to do |format|
      if @check_plan.update(check_plan_params)
        format.html { redirect_to @check_plan, notice: 'Check plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @check_plan }
      else
        format.html { render :edit }
        format.json { render json: @check_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_plans/1
  # DELETE /check_plans/1.json
  def destroy
    @check_plan.destroy
    respond_to do |format|
      format.html { redirect_to check_plans_url, notice: 'Check plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_plan
      @check_plan = CheckPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_plan_params
      params.require(:check_plan).permit(:name, :interval, :remark, :device_type_id)
    end
end

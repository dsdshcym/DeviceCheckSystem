class CheckRecordsController < ApplicationController
  before_action :set_check_record, only: [:show, :edit, :update, :destroy]

  # GET /check_records
  # GET /check_records.json
  def index
    @check_records = CheckRecord.all
  end

  # GET /check_records/1
  # GET /check_records/1.json
  def show
  end

  # GET /check_records/new
  def new
    @check_record = CheckRecord.new(device_plan_id: params[:device_plan])
  end

  # GET /check_records/1/edit
  def edit
  end

  # POST /check_records
  # POST /check_records.json
  def create
    @check_record = CheckRecord.new(check_record_params)

    respond_to do |format|
      if @check_record.save
        format.html { redirect_to @check_record, notice: 'Check record was successfully created.' }
        format.json { render :show, status: :created, location: @check_record }
      else
        format.html { render :new }
        format.json { render json: @check_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_records/1
  # PATCH/PUT /check_records/1.json
  def update
    respond_to do |format|
      if @check_record.update(check_record_params)
        format.html { redirect_to @check_record, notice: 'Check record was successfully updated.' }
        format.json { render :show, status: :ok, location: @check_record }
      else
        format.html { render :edit }
        format.json { render json: @check_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_records/1
  # DELETE /check_records/1.json
  def destroy
    @check_record.destroy
    respond_to do |format|
      format.html { redirect_to check_records_url, notice: 'Check record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_record
      @check_record = CheckRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_record_params
      params.require(:check_record).permit(:date, :time_usage, :note, :device_plan_id, :engineer_id)
    end
end

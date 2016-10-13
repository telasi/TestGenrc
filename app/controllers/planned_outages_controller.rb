class PlannedOutagesController < ApplicationController
  before_action :set_planned_outage, only: [:show, :edit, :update, :destroy]

  # GET /planned_outages
  # GET /planned_outages.json
  def index
    @planned_outages = PlannedOutage.all
  end

  # GET /planned_outages/1
  # GET /planned_outages/1.json
  def show
  end

  # GET /planned_outages/new
  def new
    @planned_outage = PlannedOutage.new
  end

  # GET /planned_outages/1/edit
  def edit
  end

  # POST /planned_outages
  # POST /planned_outages.json
  def create
    @planned_outage = PlannedOutage.new(planned_outage_params)

    respond_to do |format|
      if @planned_outage.save
        format.html { redirect_to @planned_outage, notice: 'Planned outage was successfully created.' }
        format.json { render :show, status: :created, location: @planned_outage }
      else
        format.html { render :new }
        format.json { render json: @planned_outage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planned_outages/1
  # PATCH/PUT /planned_outages/1.json
  def update
    respond_to do |format|
      if @planned_outage.update(planned_outage_params)
        format.html { redirect_to @planned_outage, notice: 'Planned outage was successfully updated.' }
        format.json { render :show, status: :ok, location: @planned_outage }
      else
        format.html { render :edit }
        format.json { render json: @planned_outage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planned_outages/1
  # DELETE /planned_outages/1.json
  def destroy
    @planned_outage.destroy
    respond_to do |format|
      format.html { redirect_to planned_outages_url, notice: 'Planned outage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planned_outage
      @planned_outage = PlannedOutage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planned_outage_params
      params.require(:planned_outage).permit(:disabling_area, :break_reason, :abonent_amount, :self_governed_district_name, :self_governed_district_abonents_count, :jit_infromation_consumer_count, :compare_date_2, :list_of_media, :info_url, :sms, :record_status, :log_day, :response_id)
    end
end

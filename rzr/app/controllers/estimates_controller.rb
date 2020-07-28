class EstimatesController < ApplicationController
  before_action :set_estimate, only: [:show, :edit, :update, :destroy]

  # GET /estimates
  # GET /estimates.json
  def index
    @estimates = Estimate.all
  end

  # GET /estimates/1
  # GET /estimates/1.json
  def show
  end

  # GET /estimates/new
  def new
    @estimate = Estimate.new
  end

  # GET /estimates/1/edit
  def edit
  end

  # POST /estimates
  # POST /estimates.json
  def create
    @estimate = Estimate.new(estimate_params)

    respond_to do |format|
      if @estimate.save
        format.html { redirect_to @estimate, notice: 'Estimate was successfully created.' }
        format.json { render :show, status: :created, location: @estimate }
      else
        format.html { render :new }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimates/1
  # PATCH/PUT /estimates/1.json
  def update
    respond_to do |format|
      if @estimate.update(estimate_params)
        format.html { redirect_to @estimate, notice: 'Estimate was successfully updated.' }
        format.json { render :show, status: :ok, location: @estimate }
      else
        format.html { render :edit }
        format.json { render json: @estimate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimates/1
  # DELETE /estimates/1.json
  def destroy
    @estimate.destroy
    respond_to do |format|
      format.html { redirect_to estimates_url, notice: 'Estimate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def scrape
    address = params[:address]
    zillow_scrape= 'https://www.zillow.com/homes/11-Taylor-St-Gloucester,-MA,-01930_rb'
    response = EstimatesSpider.process(url)
    if response[:status] == :completed && response[:error].nil?
      flash.now[:notice] = "Successfully scraped url"
    else
      flash.now[:alert] = response[:error]
    end
  rescue StandardError => e
    flash.now[:alert] = "Error: #{e}"
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimate
      @estimate = Estimate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estimate_params
      params.require(:estimate).permit(:site, :address, :price)
    end
end

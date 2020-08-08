class MutualFundsController < ApplicationController
  before_action :set_mutual_fund, only: [:show, :edit, :update, :destroy]

  # GET /mutual_funds
  # GET /mutual_funds.json
  def index
    @mutual_funds = MutualFund.all
  end

  # GET /mutual_funds/1
  # GET /mutual_funds/1.json
  def show
  end

  # GET /mutual_funds/new
  def new
    @mutual_fund = MutualFund.new
  end

  # GET /mutual_funds/1/edit
  def edit
  end

  # POST /mutual_funds
  # POST /mutual_funds.json
  def create
    @mutual_fund = current_user.portfolios.default.mutual_funds.build(mutual_fund_params)

    respond_to do |format|
      if @mutual_fund.save
        format.html { redirect_to root_path, notice: 'Mutual fund was successfully created.' }
        format.json { render :show, status: :created, location: @mutual_fund }
      else
        format.html { render :new }
        format.json { render json: @mutual_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mutual_funds/1
  # PATCH/PUT /mutual_funds/1.json
  def update
    respond_to do |format|
      if @mutual_fund.update(mutual_fund_params)
        format.html { redirect_to @mutual_fund, notice: 'Mutual fund was successfully updated.' }
        format.json { render :show, status: :ok, location: @mutual_fund }
      else
        format.html { render :edit }
        format.json { render json: @mutual_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mutual_funds/1
  # DELETE /mutual_funds/1.json
  def destroy
    @mutual_fund.destroy
    respond_to do |format|
      format.html { redirect_to mutual_funds_url, notice: 'Mutual fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    # make an API call to valueresearch to get the list of mutual funds.
    # make sure to set the headers.
    @mutual_funds = ValueResearchServices::GetMutualFunds.call(params[:q])
    # TODO: remove this when feature is done
    expires_in 1.year, public: true
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mutual_fund
      @mutual_fund = MutualFund.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mutual_fund_params
      params.require(:mutual_fund).permit(:name, :investment_type, :date_of_investment, :units, :investment_amount, :nav)
    end
end

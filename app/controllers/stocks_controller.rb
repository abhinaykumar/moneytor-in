class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stock, only: %i[edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = current_user.portfolios.default.stocks.build(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to root_path, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to root_path, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_stock
    @stock = Stock.find(params[:id])
  end

  def authorize_user
    authorize @stock, :modify?
  end

  # Only allow a list of trusted parameters through.
  def stock_params
    params.require(:stock).permit(:investment_date, :investment_amount, :quantity, :at_price, :listed_stock_id)
  end
end

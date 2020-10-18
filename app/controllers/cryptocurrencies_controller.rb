class CryptocurrenciesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cryptocurrency, only: %i[edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  # GET /cryptocurrencies/new
  def new
    @cryptocurrency = Cryptocurrency.new
  end

  # GET /cryptocurrencies/1/edit
  def edit
  end

  # POST /cryptocurrencies
  # POST /cryptocurrencies.json
  def create
    @cryptocurrency = current_user.portfolios.default.cryptocurrencies.build(cryptocurrency_params)
    respond_to do |format|
      if @cryptocurrency.save
        format.html { redirect_to root_path, notice: 'Cryptocurrency was successfully created.' }
        format.json { render :show, status: :created, location: @cryptocurrency }
      else
        format.html { render :new }
        format.json { render json: @cryptocurrency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cryptocurrencies/1
  # PATCH/PUT /cryptocurrencies/1.json
  def update
    respond_to do |format|
      if @cryptocurrency.update(cryptocurrency_params)
        format.html { redirect_to root_path, notice: 'Cryptocurrency was successfully updated.' }
        format.json { render :show, status: :ok, location: @cryptocurrency }
      else
        format.html { render :edit }
        format.json { render json: @cryptocurrency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cryptocurrencies/1
  # DELETE /cryptocurrencies/1.json
  def destroy
    @cryptocurrency.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cryptocurrency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cryptocurrency
    @cryptocurrency = Cryptocurrency.find(params[:id])
  end

  def authorize_user
    authorize @cryptocurrency, :modify?
  end

  # Only allow a list of trusted parameters through.
  def cryptocurrency_params
    params.require(:cryptocurrency).permit(:investment_date, :investment_amount, :quantity, :at_price, :listed_cryptocurrency_id)
  end
end

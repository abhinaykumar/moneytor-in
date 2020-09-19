class SavingAccountsController < ApplicationController
  before_action :set_saving_account, only: [:edit, :update, :destroy]

  # GET /saving_accounts/new
  def new
    @saving_account = SavingAccount.new
  end

  # GET /saving_accounts/1/edit
  def edit
  end

  # POST /saving_accounts
  # POST /saving_accounts.json
  def create
    @saving_account = current_user.portfolios.default.saving_accounts.build(saving_account_params)

    respond_to do |format|
      if @saving_account.save
        format.html { redirect_to root_path, notice: 'Saving Account was successfully added.' }
        format.json { render :show, status: :created, location: @saving_account }
      else
        format.html { render :new }
        format.json { render json: @saving_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saving_accounts/1
  # PATCH/PUT /saving_accounts/1.json
  def update
    respond_to do |format|
      if @saving_account.update(saving_account_params)
        format.html { redirect_to @saving_account, notice: 'Saving account was successfully updated.' }
        format.json { render :show, status: :ok, location: @saving_account }
      else
        format.html { render :edit }
        format.json { render json: @saving_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saving_accounts/1
  # DELETE /saving_accounts/1.json
  def destroy
    @saving_account.destroy
    respond_to do |format|
      format.html { redirect_to saving_accounts_url, notice: 'Saving account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving_account
      @saving_account = SavingAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saving_account_params
      params.require(:saving_account).permit(:branch_name, :amount_saved, :rate_of_interest, :listed_bank_id)
    end
end

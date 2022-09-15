class BudgetUsersController < ApplicationController
  before_action :set_budget_user, only: %i[ show update destroy ]

  # GET /budget_users
  def index
    @budget_users = BudgetUser.all

    render json: @budget_users
  end

  # GET /budget_users/1
  def show
    render json: @budget_user
  end

  # POST /budget_users
  def create
    @budget_user = BudgetUser.new(budget_user_params)

    if @budget_user.save
      render json: @budget_user, status: :created, location: @budget_user
    else
      render json: @budget_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /budget_users/1
  def update
    if @budget_user.update(budget_user_params)
      render json: @budget_user
    else
      render json: @budget_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /budget_users/1
  def destroy
    @budget_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_user
      @budget_user = BudgetUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_user_params
      params.fetch(:budget_user, {})
    end
end

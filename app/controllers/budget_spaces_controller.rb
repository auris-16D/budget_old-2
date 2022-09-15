class BudgetSpacesController < ApplicationController
  before_action :set_budget_space, only: %i[ show update destroy ]

  # GET /budget_spaces
  def index
    @budget_spaces = BudgetSpace.all

    render json: @budget_spaces
  end

  # GET /budget_spaces/1
  def show
    render json: @budget_space
  end

  # POST /budget_spaces
  def create
    @budget_space = BudgetSpace.new(budget_space_params)

    if @budget_space.save
      render json: @budget_space, status: :created, location: @budget_space
    else
      render json: @budget_space.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /budget_spaces/1
  def update
    if @budget_space.update(budget_space_params)
      render json: @budget_space
    else
      render json: @budget_space.errors, status: :unprocessable_entity
    end
  end

  # DELETE /budget_spaces/1
  def destroy
    @budget_space.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_space
      @budget_space = BudgetSpace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_space_params
      params.fetch(:budget_space, {})
    end
end

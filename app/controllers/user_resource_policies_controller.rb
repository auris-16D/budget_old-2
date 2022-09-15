class UserResourcePoliciesController < ApplicationController
  before_action :set_user_resource_policy, only: %i[ show update destroy ]

  # GET /user_resource_policies
  def index
    @user_resource_policies = UserResourcePolicy.all

    render json: @user_resource_policies
  end

  # GET /user_resource_policies/1
  def show
    render json: @user_resource_policy
  end

  # POST /user_resource_policies
  def create
    @user_resource_policy = UserResourcePolicy.new(user_resource_policy_params)

    if @user_resource_policy.save
      render json: @user_resource_policy, status: :created, location: @user_resource_policy
    else
      render json: @user_resource_policy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_resource_policies/1
  def update
    if @user_resource_policy.update(user_resource_policy_params)
      render json: @user_resource_policy
    else
      render json: @user_resource_policy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_resource_policies/1
  def destroy
    @user_resource_policy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_resource_policy
      @user_resource_policy = UserResourcePolicy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_resource_policy_params
      params.fetch(:user_resource_policy, {})
    end
end

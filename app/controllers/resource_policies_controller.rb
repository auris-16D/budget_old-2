class ResourcePoliciesController < ApplicationController
  before_action :set_resource_policy, only: %i[ show update destroy ]

  # GET /resource_policies
  def index
    @resource_policies = ResourcePolicy.all

    render json: @resource_policies
  end

  # GET /resource_policies/1
  def show
    render json: @resource_policy
  end

  # POST /resource_policies
  def create
    @resource_policy = ResourcePolicy.new(resource_policy_params)

    if @resource_policy.save
      render json: @resource_policy, status: :created, location: @resource_policy
    else
      render json: @resource_policy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resource_policies/1
  def update
    if @resource_policy.update(resource_policy_params)
      render json: @resource_policy
    else
      render json: @resource_policy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resource_policies/1
  def destroy
    @resource_policy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_policy
      @resource_policy = ResourcePolicy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resource_policy_params
      params.fetch(:resource_policy, {})
    end
end

class DomainsController < ApplicationController
  before_action :set_domain, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in

  # GET /domains
  # GET /domains.json
  def index
    @domains = current_user.domains
               .sort_by { |d| -d.links_count }
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
  end

  # GET /domains/1/edit
  def edit
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    update_and_respond(@domain, domain_params)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_domain
    @domain = current_user.domains.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def domain_params
    params.require(:domain).permit(:description)
  end
end

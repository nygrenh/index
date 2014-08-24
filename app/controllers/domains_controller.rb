class DomainsController < ApplicationController
  before_action :set_domain, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_signed_in

  # GET /domains
  # GET /domains.json
  def index
    @domains = Domain.where(user_id: current_user.id).sort_by { |d| -d.link_count }
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
    create_response(@domain.update(domain_params), @domain, 'updated', @domain, 'edit')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_domain
    @domain = Domain.find(params[:id])
    check_for_permission(@domain)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def domain_params
    params.require(:domain).permit(:description)
  end
end

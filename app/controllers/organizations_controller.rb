class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.friendly.find(params[:id])
    @tickets = []
    if params[:search] && !@organization.blank?
      @tickets = Ticket.all.
        joins(pool: :organization).
        where('organizations.id = ?', @organization.id).
        where("tickets.public_label ILIKE ?", "%#{params[:search]}%").
        limit(20)
    end
  end

end

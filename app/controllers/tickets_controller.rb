class TicketsController < ApplicationController

  def show
    @organization = Organization.friendly.find(params[:organization_id])
    @ticket = @organization.tickets.friendly.find(params[:id])
    @pool = @ticket.pool
    @lanes = @pool.lanes.order('lanes.id ASC')
  end

end

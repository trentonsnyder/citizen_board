class TicketsController < ApplicationController

  def show
    @organization = Organization.friendly.find(params[:organization_id])
    @ticket = Ticket.
      joins(pool: :organization).
      where('organizations.id = ?', @organization.id).
      find(params[:id])

    @pool = @ticket.pool
    @lanes = @pool.lanes.order('lanes.id ASC')
  end

end

class Auth::TicketsController < Auth::AuthenticatedController
  before_action :set_pool
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = @pool.tickets
  end

  def show
    @ticket = @pool.ticket.find(params[:id])
  end
  
  def new
    @ticket = @pool.tickets.new
  end

  def create
    @ticket = @pool.tickets.new(ticket_params)
    @ticket.organization_id = @pool.organization.id
    # TODO: make this the first lane in the :order
    @ticket.lane_id = @pool.lanes.first.id
    if @ticket.save
      redirect_to auth_pool_path(@pool.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_pool
    @organization = current_user.organization
    @pool = @organization.pools.find(params[:pool_id])
  end

  def ticket_params
    params.require(:ticket).permit(:nickname)
  end
end
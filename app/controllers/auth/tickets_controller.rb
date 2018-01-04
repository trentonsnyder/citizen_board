class Auth::TicketsController < Auth::AuthenticatedController
  before_action :set_pool
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :move_left, :move_right]

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

  def move_left
    lane = @ticket.lane
    if lane.position > 0
      new_lane = @pool.lanes.find_by(position: lane.position-1)
      if new_lane
        @ticket.update(lane_id: new_lane.id)
      end
    end
    redirect_to auth_pool_path(@pool.id)
  end

  def move_right
    new_lane = @pool.lanes.find_by(position: @ticket.lane.position+1)
    if new_lane
      @ticket.update(lane_id: new_lane.id)
    end
    redirect_to auth_pool_path(@pool.id)
  end

  private

  def set_pool
    @organization = current_user.organization
    @pool = @organization.pools.find(params[:pool_id])
  end

  def set_ticket
    @ticket = @pool.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:nickname)
  end
end
class Auth::LanesController < Auth::AuthenticatedController
  before_action :set_organization
  before_action :set_lane

  def new
    @lane = @pool.lanes.new
  end

  def create
    @lane = @pool.lanes.new(lane_params)
    if @lane.save
      redirect_to auth_pool_path(@pool.id)
    else
      render 'new'
    end
  end

  def move_right
    @lane = @pool.lanes.find(params[:id])
    @lane.move_lower
    redirect_to auth_pool_path(@pool.id)
  end

  def move_left
    @lane = @pool.lanes.find(params[:id])
    @lane.move_higher
    redirect_to auth_pool_path(@pool.id)
  end

  private

  def set_lane
    @pool = @organization.pools.find(params[:pool_id])
  end

  def lane_params
    params.require(:lane).permit(:name)
  end
end
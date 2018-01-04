class Auth::LanesController < Auth::AuthenticatedController
  before_action :set_organization

  def move_right
    @pool = @organization.pools.find(params[:pool_id])
    @lane = @pool.lanes.find(params[:id])
    @lane.move_lower
    redirect_to auth_pool_path(@pool.id)
  end

  def move_left
    @pool = @organization.pools.find(params[:pool_id])
    @lane = @pool.lanes.find(params[:id])
    @lane.move_higher
    redirect_to auth_pool_path(@pool.id)
  end
end
class Auth::PoolsController < Auth::AuthenticatedController
  def show
    @organization = current_user.organization
    @pool = @organization.pools.find(params[:id])
    @lanes = @pool.lanes.includes(:tickets)
  end
end
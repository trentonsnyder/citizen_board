class Auth::PoolsController < Auth::AuthenticatedController
  before_action :set_organization

  def show
    @pool = @organization.pools.find(params[:id])
    @lanes = @pool.lanes.includes(:tickets)
  end

  def new
    @pool = @organization.pools.new
  end

  def create
    @pool = @organization.pools.new(pool_params)
    if @pool.save
      redirect_to auth_organization_path(@organization.id)
    else
      render 'new'
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:name)
  end
end
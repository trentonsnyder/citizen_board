class Auth::OrganizationsController < Auth::AuthenticatedController
  def show
    @organization = current_user.organization
    @pools = @organization.pools
  end
end
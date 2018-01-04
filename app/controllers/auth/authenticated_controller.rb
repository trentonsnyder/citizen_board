class Auth::AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  def set_organization
    @organization = current_user.organization
  end
end

class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorized?

  private

  def authorized?
    return if current_user.is_admin?

    flash[:error] = 'You are not authorized to view that page'
    redirect_to root_path
  end
end

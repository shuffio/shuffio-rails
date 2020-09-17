class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :allow_iframe

  private

  def allow_iframe
    response.headers['Content-Security-Policy'] = "frame-ancestors #{helpers.allowed_frame_domains.join(' ')}"
  end
end

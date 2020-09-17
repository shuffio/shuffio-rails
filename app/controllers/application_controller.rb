class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :allow_iframe

  private

  def allow_iframe
    response.headers['Content-Security-Policy'] = "frame-ancestors #{helpers.allowed_frame_domains.join(' ')}"
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  rescue StandardError
    render_404
  end

  def render_404
    render file: Rails.root.join('public/404'), status: :not_found
  end
end

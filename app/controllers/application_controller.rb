class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_security_headers

  private

  def set_security_headers
    response.set_header('Content-Security-Policy', "default-src 'self'")
    response.set_header('X-Frame-Options', 'DENY')
    response.set_header('X-Content-Type-Options', 'nosniff')
    response.set_header('Strict-Transport-Security', 'max-age=31536000; includeSubDomains')
  end
end

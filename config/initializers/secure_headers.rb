SecureHeaders::Configuration.default do |config|
    config.csp = {
      default_src: ["'self'"],
      script_src: ["'self'", "'unsafe-inline'", "'unsafe-eval'"],
      object_src: ["'none'"],
      style_src: ["'self'", "'unsafe-inline'"],
      img_src: ["'self'", "data:"],
      font_src: ["'self'"],
      connect_src: ["'self'"],
      media_src: ["'self'"],
      frame_src: ["'none'"]
    }
  end
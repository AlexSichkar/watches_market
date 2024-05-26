class ApplicationController < ActionController::Base
  # include Pundit::Authorization
  include Authorization
  #   include Pundit::Authorization
  # protect_from_fogery
  rescue_from ActiveRecord::RecordNotFound, with: :notfound


  private
  def notfound(exception)
    logger.warn exception
    render file: 'public/404.html', status: :not_found, layout: false
  end
end

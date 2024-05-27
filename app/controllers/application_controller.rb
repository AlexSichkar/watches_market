class ApplicationController < ActionController::Base
  include Authorization

  rescue_from ActiveRecord::RecordNotFound, with: :notfound
  rescue_from Object::NoMethodError, with: :notfound
  private
  def notfound(exception)
    logger.warn exception
    render file: 'public/404.html', status: :not_found, layout: false
  end
end

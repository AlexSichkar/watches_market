module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    render file: 'public/unauthorized.html', status: :not_found, layout: false
  end
end
end
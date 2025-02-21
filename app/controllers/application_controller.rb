class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { error: "Vous n'êtes pas autorisé à effectuer cette action" }, status: :forbidden
  end
end

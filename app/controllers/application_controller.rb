class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :move_to_index, only: [:index, :show]

  def index

  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name , :profile , :occupation , :position])
  end

end
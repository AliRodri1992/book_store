class HomeController < ApplicationController
  def index; end

  def show_perfil
    @user = User.find(current_user.id)
  end
end
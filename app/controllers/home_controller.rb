class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = Account.includes(:server).where(user: current_user)
  end
end

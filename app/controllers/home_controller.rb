class HomeController < ApplicationController
  before_action :user_logged_in!

  def index; end
end

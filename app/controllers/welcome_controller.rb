class WelcomeController < ApplicationController
  #WelcomeController's index action will work as before without requiring the user to be logged in
  skip_before_action :authenticate_user!, only: [:index]
  def index
  end
end

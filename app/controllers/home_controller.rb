class HomeController < ApplicationController

  def index
    @user = current_user
    print @user
  end
end




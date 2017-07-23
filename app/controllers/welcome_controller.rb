class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早安！你好！"
    flash[:alert] = "Sorry, you're late!"
    flash[:warning] = "PLease take attention for the time"
  end



end

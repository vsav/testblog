class HomeController < ApplicationController
  def new

  end

  def contacts
    
  end

  def create
    render plain: params[:contact].inspect
  end
end

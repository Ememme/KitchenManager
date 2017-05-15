class HomeController < ApplicationController
  before_action :authenticate_member!
  def index
    render html :"Welcome to your kitchen manager"
  end
end

class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      @search_keyword = params[:word]
      render "/searches/search_result"
    else
      @books = Book.looks(params[:search], params[:word])
      @search_keyword = params[:word]
      render "/searches/search_result"
    end
  end
end

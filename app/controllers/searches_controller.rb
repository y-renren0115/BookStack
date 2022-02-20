class SearchesController < ApplicationController
  
  def search
    @mode = params[:mode]
    session[:mode] = params[:mode]
    session[:word] = params[:word]
    if @mode == "User"
      @users = User.seeks(params[:word], params[:search])
    else
      @books = Book.seeks(params[:word], params[:search])
    end
  end
end

class SearchesController < ApplicationController
  before_action :authenticate_user!#ユーザのログイン状態を確認する記述

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      render "searches/search_result"
      #レンダー先を他のViewに設定することで遷移先エラーが出ない
    else
      @books = Book.looks(params[:search], params[:word])
      render "searches/search_result"
    end

  end

end

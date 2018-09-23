class CommentsController < ApplicationController
  before_action :require_user_logged_in
 
  def create
    # render　で　toppage/index　に飛ばした時用のproduction.all
    @productions = Production.all
    
    @production_comment = current_user.comments.build(comment_params)
    if @production_comment.save
      flash[:success] = 'コメントを送信しました。'
      # redirect_to 'productions/new'
      render 'toppages/index'
    else
      # @comment = current_user.productions.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'コメントの送信に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
 
  end


  def new

  end
  
  private
  
 
  
end

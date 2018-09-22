class ProductionsController < ApplicationController
  def index
  end

  def show
    @production_show = Production.find(params[:id])
    
    
    @display_comment = Comment.where(production_id: params[:id]).all.order(created_at: "DESC")
    # productionのidが欲しい
    @production_comment = current_production.comments.new
    
    
  end

  def new
    #制作物投稿フォーム作成のため空のインスタンスを生成
    @production = current_user.productions.build
  end

  def create
    @productions = Production.all
    @production = current_user.productions.new(user_id: current_user.id,content: params[:content],production_id: current_production.id)
    if @production.save
      flash[:success] = '制作物を出品しました。'
      # redirect_to 'productions/new'
      render 'toppages/index'
    else
      @production = current_user.productions.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '制作物出品に失敗しました。'
      render 'toppages/index'
    end
    
  end

  def destroy
  end
 
 def update
 
 end
  
  def aiueo
    # render　で　toppage/index　に飛ばした時用のproduction.all
    
    @this_production = Production.find(comment_params[:production_id])
    # @productions = Production.all
    @production_comment = current_user.comments.build(comment_params)
    if @production_comment.save
      flash[:success] = 'コメントを送信しました。'
      puts('成功しました')
      redirect_to @this_production
    else
      flash[:danger] = 'コメントの送信に失敗しました。'
      puts('失敗しました')
      redirect_to @this_production
    end
  end
  
  private
  
  def production_params
    params.require(:production).permit(:production_title, :production_picture, :production_information, :production_genre, :production_season)
  end
  def comment_params
    params.require(:comment).permit(:content,:production_id)
  end
end

class ProductionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    #制作物投稿フォーム作成のため空のインスタンスを生成
    @production = current_user.productions.build
  end

  def create
    @productions = Production.all
    @production = current_user.productions.build(production_params)
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
  
  
  
  private
  
  def production_params
    params.require(:production).permit(:production_title, :production_picture, :production_information, :production_genre, :production_season)
  end
end

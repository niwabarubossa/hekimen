class ToppagesController < ApplicationController
  def index
    @productions = Production.all
  end
end

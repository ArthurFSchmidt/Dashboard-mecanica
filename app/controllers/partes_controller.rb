class PartesController < ApplicationController
  before_action :authenticate_user!
  def index
    @partes = Parte.all
  end

  def show
    @parte = Parte.find(params[:id])
  end

  def new
    @parte = Parte.new
  end

  def create
    @parte = Parte.new(parte_params)

    if @parte.save
      redirect_to @parte
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @parte = Parte.find(params[:id])
  end

  def update
    @parte = Parte.find(params[:id])

    if @parte.update(ordem_params)
      redirect_to @parte
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def parte_params
      params.require(:parte).permit(:nome, :descricao, :modelo, :valor)
    end
end

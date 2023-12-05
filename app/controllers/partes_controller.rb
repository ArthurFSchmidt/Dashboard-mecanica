class PartesController < ApplicationController
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

  private
    def parte_params
      params.require(:parte).permit(:nome, :descricao, :valor)
    end
end

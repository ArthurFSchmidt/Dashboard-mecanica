class ServicosController < ApplicationController
  def index
    @servicos = Servico.all
  end

  def show
    @servico = Servico.find(params[:id])
  end

  def new
    @servico = Servico.new
  end

  def create
    @servico = Servico.new(servico_params)

    if @servico.save
      redirect_to @servico
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def servico_params
      params.require(:servico).permit(:nome, :descricao, :valor)
    end
end

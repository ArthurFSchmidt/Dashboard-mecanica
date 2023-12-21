class OrdemsController < ApplicationController
  before_action :carregarDependencias, only: [:new, :show]

  def index
    @ordems = Ordem.all
  end

  def show
    @ordem = Ordem.find(params[:id])
    @veiculo = Veiculo.find(@ordem.veiculo_id)
    @equipe = Equipe.find(@ordem.equipe_id)
  end

  def new
    @ordem = Ordem.new
  end

  def create
    params = ordem_params
    params.delete(:partes)
    params.delete(:servicos)
    @ordem = Ordem.new(params)

    if @ordem.save
      partes = ordem_params[:partes]
      servicos = ordem_params[:servicos]
      puts partes
      puts servicos
      redirect_to @ordem
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def ordem_params
      params.require(:partes, :servicos)
      params.require(:ordem).permit(:dataEmissao, :dataConclusao, :valor, :veiculo_id, :equipe_id)
    end

    def carregarDependencias
      @veiculos = Veiculo.all
      @equipes = Equipe.all
      @partes = Parte.all
      @servicos = Servico.all
    end
end

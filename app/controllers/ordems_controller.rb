class OrdemsController < ApplicationController
  before_action :authenticate_user!
  before_action :carregarDependencias, only: [:new, :index, :edit]

  def index
    @ordems = Ordem.all
  end

  def show
    @ordem = Ordem.find(params[:id])
    @veiculo = Veiculo.find(@ordem.veiculo_id)
    @equipe = Equipe.find(@ordem.equipe_id)
    @partes = []
    @servicos = []
  end

  def new
    @novo = true
    @ordem = Ordem.new
  end

  def create

    @ordem = Ordem.new(ordem_params)

    if @ordem.save
      redirect_to @ordem
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @novo = false
    @ordem = Ordem.find(params[:id])
  end

  def update
    @ordem = Ordem.find(params[:id])

    if @ordem.update(ordem_params)
      redirect_to @ordem
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def ordem_params
      params.require(:ordem).permit(:dataEmissao, :problema, :equipe_id, :status, :veiculo_id, :partes, :servicos)
    end

    def carregarDependencias
      @veiculos = Veiculo.all
      @equipes = Equipe.all
      @partes = Parte.all
      @servicos = Servico.all
    end
end

class OrdemsController < ApplicationController
  before_action :carregarDependencias, only: [:new, :show]

  def index
    @ordems = Ordem.all
  end

  def show
    @ordem = Ordem.find(params[:id])
    @veiculo = Veiculo.find(@ordem.veiculo_id)
    @equipe = Equipe.find(@ordem.equipe_id)

    @partesInclusas = @ordem.partes
    @servicosInclusos = @ordem.servicos

    unless (@partesInclusas == nil)
      @partesInclusas.each do |n|
        @partes.delete(n)
      end
    end
    unless (@servicosInclusosInclusas == nil)
      @servicosInclusos.each do |n|
        @servicos.delete(n)
      end
    end
  end

  def new
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

  def configurar
    @ordem_id = params[:id]
    @partes = params[:partes]
    @servicos = params[:servicos]
    if(@partes.length > 1)
      @partes.shift
    end
    if(@servicos.length > 1)
      @servicos.shift
    end

    @ordem = Ordem.find(@ordem_id)

    @ordem.partes = @ordem.partes << @partes
    @ordem.servicos = @ordem.servicos << @servicos

    @ordem.save

    render :show, id: @ordem_id
  end

  private
    def ordem_params
      params.require(:ordem).permit(:dataEmissao, :dataConclusao, :valor, :veiculo_id, :equipe_id, :partes, :servicos)
    end

    def carregarDependencias
      @veiculos = Veiculo.all
      @equipes = Equipe.all
      @partes = Parte.all
      @servicos = Servico.all
    end
end

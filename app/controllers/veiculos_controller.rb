class VeiculosController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def show
    @veiculo = Veiculo.find(params[:id])
  end

  def new
    @cliente = Cliente.find(params[:cliente_id])
    @veiculo = @cliente.veiculos.new
  end

  def create
    @cliente = Cliente.find(params[:cliente_id])
    @veiculo = @cliente.veiculos.new(veiculo_params)

    if @veiculo.save
      redirect_to @cliente
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @cliente = Cliente.find(params[:cliente_id])
    @veiculo = Veiculo.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:cliente_id])
    @veiculo = Veiculo.find(params[:id])

    if @veiculo.update(ordem_params)
      redirect_to @veiculo
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def veiculo_params
      params.require(:veiculo).permit(:placa, :marca, :modelo, :ano, :cor, :descricao)
    end
end

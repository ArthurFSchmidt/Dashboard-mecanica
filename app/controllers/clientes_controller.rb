class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      redirect_to @cliente
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cliente = Cliente.find(params[:id])
    @veiculos = Veiculo.where(cliente_id: params[:id])
  end

  private
    def cliente_params
      params.require(:cliente).permit(:nome, :endereco, :telefone)
    end
end

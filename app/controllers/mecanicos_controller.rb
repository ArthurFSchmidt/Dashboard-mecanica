class MecanicosController < ApplicationController
  def index
    @mecanicos = Mecanico.all
  end

  def show
    @mecanico = Mecanico.find(params[:id])
  end

  def new
    @mecanico = Mecanico.new(equipe_id:nil)
  end

  def create
    @mecanico = Mecanico.new(mecanico_params)

    if @mecanico.save
      redirect_to @mecanico
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @mecanico = Mecanico.find(params[:id])
  end

  def update
    @mecanico = Mecanico.find(params[:id])

    if @mecanico.update(ordem_params)
      redirect_to @mecanico
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def mecanico_params
      params.require(:mecanico).permit(:nome, :endereco, :especialidade)
    end

end

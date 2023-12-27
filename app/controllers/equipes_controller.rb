class EquipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @equipes = Equipe.all
  end

  def show
    @equipe = Equipe.find(params[:id])
    @integrantes = Mecanico.all
  end

  def new
    @equipe = Equipe.new
  end

  def create
    @equipe = Equipe.new(equipe_params)

    if @equipe.save
      redirect_to @equipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @integrantes = params[:integrantes]
    @integrantes.each do |integrante|
      if(integrante != "")
        @mecanico = Mecanico.find(integrante)
        @mecanico.equipe_id = params[:equipe_id]
        @mecanico.save
      end
    end
    redirect_to equipe_path(params[:equipe_id])
  end

  private
    def equipe_params
      params.require(:equipe).permit(:nome)
    end


end

class Equipe < ApplicationRecord
  has_many :mecanicos

  validates :nome, presence: true

  def numIntegrantes?
    Mecanico.where(equipe_id:id).count
  end
end

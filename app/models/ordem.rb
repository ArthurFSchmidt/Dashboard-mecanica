class Ordem < ApplicationRecord

  STATUS_VALIDOS = ['Aberto', 'Em andamento', 'Pausado', 'Finalizado']

  validates :problema, presence: true
  validates :dataEmissao, presence: true
  validates :veiculo_id, presence: true
  validates :status, presence: true, inclusion: { in: STATUS_VALIDOS }

  has_many :ordems_partes, dependent: :destroy
  has_many :ordems_servicos, dependent: :destroy

  has_many :partes, through: :ordems_partes
  has_many :servicos, through: :ordems_servicos

end

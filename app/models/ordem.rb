class Ordem < ApplicationRecord

  STATUS_VALIDOS = ['Aberto', 'Em andamento', 'Pausado', 'Finalizado']

  validates :problema, presence: true
  validates :dataEmissao, presence: true
  validates :veiculo_id, presence: true
  validates :status, presence: true, inclusion: { in: STATUS_VALIDOS }



end

class Veiculo < ApplicationRecord
  belongs_to :cliente

  validates :placa, presence: true
  validates :marca, presence: true
  validates :modelo, presence: true
  validates :ano, presence: true
  validates :cor, presence: true
  validates :descricao, presence: true
end

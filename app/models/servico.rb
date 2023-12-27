class Servico < ApplicationRecord

  validates :nome, presence: true
  validates :descricao, presence: true
  validates :valor, presence: true

  has_many :ordems, through: :ordems_servicos
  has_many :ordems_servicos, dependent: :destroy
end

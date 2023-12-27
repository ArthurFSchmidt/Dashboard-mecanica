class Parte < ApplicationRecord

  validates :nome, presence: true
  validates :descricao, presence: true
  validates :valor, presence: true

  has_many :ordems, through: :ordems_partes
  has_many :ordems_partes, dependent: :destroy

end

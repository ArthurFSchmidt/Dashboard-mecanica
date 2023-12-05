class Mecanico < ApplicationRecord
  validates :nome, presence: true
  validates :endereco, presence: true
  validates :especialidade, presence: true
end

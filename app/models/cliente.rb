class Cliente < ApplicationRecord
  has_many :veiculos, dependent: :destroy

  validates :nome, presence: true
  validates :endereco, presence: true
  validates :telefone, presence: true
end

class Equipe < ApplicationRecord
  has_many :mecanicos

  validates :nome, presence: true
end

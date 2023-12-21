class Ordem < ApplicationRecord

  validates :veiculo_id, presence: true
  validates :equipe_id, presence: true
end

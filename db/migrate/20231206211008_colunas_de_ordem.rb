class ColunasDeOrdem < ActiveRecord::Migration[7.1]
  def change
    change_table "ordems" do |t|
      t.belongs_to :veiculo
      t.belongs_to :equipe
    end
  end
end

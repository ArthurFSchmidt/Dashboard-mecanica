class AddRelationsToVeiculo < ActiveRecord::Migration[7.1]
  def change
    change_table "veiculos" do |t|
      t.belongs_to :cliente
    end
  end
end

class AddColumnsToVeiculo < ActiveRecord::Migration[7.1]
  def change
    change_table "veiculos" do |t|
      t.string "modelo"
      t.string "marca"
      t.integer "ano"
      t.string "cor"
    end
  end
end

class OrdemString < ActiveRecord::Migration[7.1]
  def change
    change_table :ordems do |t|
      t.string "partes"
      t.string "servicos"
    end
  end
end

class AddPlacaToOrdem < ActiveRecord::Migration[7.1]
  def change
    change_table :ordems do |t|
      t.string :placa
    end
  end
end

class CreateVeiculos < ActiveRecord::Migration[7.1]
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.text :descricao

      t.timestamps
    end
  end
end

class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.text :nome
      t.text :endereco
      t.text :telefone

      t.timestamps
    end
  end
end

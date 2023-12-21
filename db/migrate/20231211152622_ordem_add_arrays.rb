class OrdemAddArrays < ActiveRecord::Migration[7.1]
  def change
    remove_column :ordems, :partes
    remove_column :ordems, :servicos
    change_table :ordems do |t|
      t.bigint "partes", array: true
      t.bigint "servicos", array: true
    end
    add_index :ordems, :partes, using: 'gin'
    add_index :ordems, :servicos, using: 'gin'
  end
end

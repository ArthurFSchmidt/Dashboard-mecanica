class DropColumnOnOrdems < ActiveRecord::Migration[7.1]
  def change
    remove_column :ordems, :partes
    remove_column :ordems, :servicos
  end
end

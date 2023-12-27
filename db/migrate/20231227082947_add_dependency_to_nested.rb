class AddDependencyToNested < ActiveRecord::Migration[7.1]
  def change
    remove_column :ordems_partes, :ordem_id
    remove_column :ordems_partes, :parte_id
    change_table :ordems_partes do |t|
      t.belongs_to :ordem
      t.belongs_to :parte
    end
    remove_column :ordems_servicos, :ordem_id
    remove_column :ordems_servicos, :servico_id
    change_table :ordems_servicos do |t|
      t.belongs_to :ordem
      t.belongs_to :servico
    end
  end
end

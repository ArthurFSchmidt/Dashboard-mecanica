class AddForeignKey < ActiveRecord::Migration[7.1]
  def change
    create_table :ordems_partes do |t|
      t.belongs_to :parte
      t.belongs_to :ordem
    end
    create_table :ordems_servicos do |t|
      t.belongs_to :servico
      t.belongs_to :ordem
    end
  end
end

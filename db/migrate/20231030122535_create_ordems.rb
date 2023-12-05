class CreateOrdems < ActiveRecord::Migration[7.1]
  def change
    create_table :ordems do |t|
      t.date :dataEmissao
      t.date :dataConclusao
      t.float :valor

      t.timestamps
    end
  end
end


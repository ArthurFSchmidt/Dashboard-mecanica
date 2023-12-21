class OrdemStringArrays < ActiveRecord::Migration[7.1]
  def change
    remove_column :ordems, :partes
    remove_column :ordems, :servicos
    change_table "ordems" do |t|
      t.string "partes", array: true
      t.string "servicos", array: true
    end
  end
end

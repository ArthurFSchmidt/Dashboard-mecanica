class AddArraysToOrdems < ActiveRecord::Migration[7.1]
  def change
    change_table "ordems" do |t|
      t.bigint "partes", array: true
      t.bigint "servicos", array: true
    end
  end
end

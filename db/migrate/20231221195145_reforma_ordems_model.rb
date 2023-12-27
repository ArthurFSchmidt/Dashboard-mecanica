class ReformaOrdemsModel < ActiveRecord::Migration[7.1]
  def change
    change_table :ordems do |t|
      t.text :problema
      t.string :status
    end
  end
end

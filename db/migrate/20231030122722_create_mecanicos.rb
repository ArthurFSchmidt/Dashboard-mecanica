class CreateMecanicos < ActiveRecord::Migration[7.1]
  def change
    create_table :mecanicos do |t|
      t.string :nome
      t.text :endereco
      t.string :especialidade

      t.timestamps
    end
  end
end

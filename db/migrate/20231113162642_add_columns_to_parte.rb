class AddColumnsToParte < ActiveRecord::Migration[7.1]
  def change
    change_table "partes" do |t|
      t.string "marca"
      t.string "modelo"
    end
  end
end

class MecanicoAssociation < ActiveRecord::Migration[7.1]
  def change
    change_table "mecanicos" do |t|
      t.belongs_to :equipe
    end
  end
end

class CreateExercicios < ActiveRecord::Migration[5.2]
  def change
    create_table :exercicios do |t|
      t.string :nome
      t.integer :serie
      t.string :rept
      t.string :carga

      t.timestamps
    end
  end
end

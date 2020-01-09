class CreateModalidades < ActiveRecord::Migration[5.2]
  def change
    create_table :modalidades do |t|
      t.string :nome
      t.string :descricao
      t.boolean :receita
      t.boolean :despesa

      t.timestamps
    end
  end
end

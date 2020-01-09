class CreatePlanos < ActiveRecord::Migration[5.2]
  def change
    create_table :planos do |t|
      t.string :nome
      t.string :referente
      t.string :descricao
      t.string :valor

      t.timestamps
    end
  end
end

class CreateSaidas < ActiveRecord::Migration[5.2]
  def change
    create_table :saidas do |t|
      t.references :fornecedor, foreign_key: true
      t.references :modalidade, foreign_key: true
      t.string :descricao
      t.string :valor

      t.timestamps
    end
  end
end

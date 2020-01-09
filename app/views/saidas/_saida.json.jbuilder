json.extract! saida, :id, :fornecedor_id, :modalidade_id, :descricao, :valor, :created_at, :updated_at
json.url saida_url(saida, format: :json)

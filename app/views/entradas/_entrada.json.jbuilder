json.extract! entrada, :id, :cliente_id, :plano_id, :modalidade_id, :descricao, :valor, :desconto, :total, :created_at, :updated_at
json.url entrada_url(entrada, format: :json)

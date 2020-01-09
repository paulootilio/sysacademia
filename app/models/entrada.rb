class Entrada < ApplicationRecord
  belongs_to :cliente
  belongs_to :plano
  belongs_to :modalidade
end

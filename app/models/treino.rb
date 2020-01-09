class Treino < ApplicationRecord
  belongs_to :cliente
  belongs_to :plano

	has_many :exrciciotreinos, inverse_of: :treino, dependent: :destroy
	accepts_nested_attributes_for :exrciciotreinos, reject_if: :all_blank, allow_destroy: true	

end

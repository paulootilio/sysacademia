class CaixaController < ApplicationController
	
	def index
	    @saldo_e = Entrada.select("entradas.total as saldo,(SELECT sum(total) FROM entradas)")
	    @saldo_s = Saida.select("saidas.valor as saldo,(SELECT sum(valor) FROM saidas)")
  	end

end

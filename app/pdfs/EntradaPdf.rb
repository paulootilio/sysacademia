class EntradaPdf < Prawn::Document
  def initialize(entradas, view)
    super(top_margin: 10)
    @entradas = professors    
    @view = view
    print_pdf
   
  end

  def print_pdf

    line_t
    line_entradas_rows


    
  end  

  

  def line_t
    text "Relatorio PDF de Entradas", :size => 16
    move_down 5
    table line_entradas_1_row , :cell_style => { :font =>"Courier", :size => 10}  do
     
    #column(1).height = 100
    end
    
  end

  def line_entradas_rows 
    [["Código ","Data ", "Cliente ", "Plano  ", "Modalidade  ", "Total "]] 
    
  end
   
  def line_entradas_1_row
   [[" #{@entrada.codigo}", " #{@entrada.data}", " #{@entrada.cliente.nome}", " #{@entrada.plano.nome}", " #{@entrada.modalidade.nome}", " #{@entrada.total}" ]]
  
  end
      
  
end



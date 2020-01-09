class EntradasController < ApplicationController
  before_action :set_entrada, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /entradas
  # GET /entradas.json
  def index
    @entradas = Entrada.all
  end

  # GET /entradas/1
  # GET /entradas/1.json
  def show
  end

  # GET /entradas/new
  def new
    @entrada = Entrada.new
  end

    def buscarvalorplano

    @valor = Plano.select("planos.valor as valor").where("planos.id="+params[:idplano])

    respond_to do |format|
        format.json { render json: @valor }
      end

  end

  # GET /entradas/1/edit
  def edit
  end

  def showpdf            

    @entradas = Entrada.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = EntradaPdf.new(@entradas, view_context)
        send_data pdf.render,
          filename: 'Entrada.pdf',
          type: 'application/pdf',
          disposition: 'inline'
      end
  end
  end

  # POST /entradas
  # POST /entradas.json
  def create
    @entrada = Entrada.new(entrada_params)

    respond_to do |format|
      if @entrada.save
        format.html { redirect_to @entrada, notice: 'Entrada was successfully created.' }
        format.json { render :show, status: :created, location: @entrada }
      else
        format.html { render :new }
        format.json { render json: @entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entradas/1
  # PATCH/PUT /entradas/1.json
  def update
    respond_to do |format|
      if @entrada.update(entrada_params)
        format.html { redirect_to @entrada, notice: 'Entrada was successfully updated.' }
        format.json { render :show, status: :ok, location: @entrada }
      else
        format.html { render :edit }
        format.json { render json: @entrada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entradas/1
  # DELETE /entradas/1.json
  def destroy
    @entrada.destroy
    respond_to do |format|
      format.html { redirect_to entradas_url, notice: 'Entrada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrada
      @entrada = Entrada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entrada_params
      params.require(:entrada).permit(:cliente_id, :plano_id, :modalidade_id, :descricao, :valor, :desconto, :total)
    end
end

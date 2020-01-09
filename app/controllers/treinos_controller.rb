class TreinosController < ApplicationController
  before_action :set_treino, only: [:show, :edit, :update, :destroy]

  # GET /treinos
  # GET /treinos.json
  def index
    @treinos = Treino.all
  end

  def exercicio
    @exercicio = Exercicio.select("exercicios.id, exercicios.nome, exercicios.serie, exercicios.rept, exercicios.carga").where("exercicios.id="+params[:idexe])
    @tamanho = params[:tam].to_i
    @tamanho= @tamanho+1
    @nameExercicio = "treino[exrciciotreinos_attributes][#{@tamanho}][exercicio_id]"
  end

  # GET /treinos/1
  # GET /treinos/1.json
  def show
  end

  # GET /treinos/new
  def new
    @treino = Treino.new
  end

  # GET /treinos/1/edit
  def edit
  end

  # POST /treinos
  # POST /treinos.json
  def create
    @treino = Treino.new(treino_params)

    respond_to do |format|
      if @treino.save
        format.html { redirect_to @treino, notice: 'Treino was successfully created.' }
        format.json { render :show, status: :created, location: @treino }
      else
        format.html { render :new }
        format.json { render json: @treino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treinos/1
  # PATCH/PUT /treinos/1.json
  def update
    respond_to do |format|
      if @treino.update(treino_params)
        format.html { redirect_to @treino, notice: 'Treino was successfully updated.' }
        format.json { render :show, status: :ok, location: @treino }
      else
        format.html { render :edit }
        format.json { render json: @treino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treinos/1
  # DELETE /treinos/1.json
  def destroy
    @treino.destroy
    respond_to do |format|
      format.html { redirect_to treinos_url, notice: 'Treino was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treino
      @treino = Treino.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def treino_params
      params.require(:treino).permit(:cliente_id, :plano_id, exrciciotreinos_attributes: [:id, :exercicio_id, :_destroy])
    end
end

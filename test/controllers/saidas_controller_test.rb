require 'test_helper'

class SaidasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saida = saidas(:one)
  end

  test "should get index" do
    get saidas_url
    assert_response :success
  end

  test "should get new" do
    get new_saida_url
    assert_response :success
  end

  test "should create saida" do
    assert_difference('Saida.count') do
      post saidas_url, params: { saida: { descricao: @saida.descricao, fornecedor_id: @saida.fornecedor_id, modalidade_id: @saida.modalidade_id, valor: @saida.valor } }
    end

    assert_redirected_to saida_url(Saida.last)
  end

  test "should show saida" do
    get saida_url(@saida)
    assert_response :success
  end

  test "should get edit" do
    get edit_saida_url(@saida)
    assert_response :success
  end

  test "should update saida" do
    patch saida_url(@saida), params: { saida: { descricao: @saida.descricao, fornecedor_id: @saida.fornecedor_id, modalidade_id: @saida.modalidade_id, valor: @saida.valor } }
    assert_redirected_to saida_url(@saida)
  end

  test "should destroy saida" do
    assert_difference('Saida.count', -1) do
      delete saida_url(@saida)
    end

    assert_redirected_to saidas_url
  end
end

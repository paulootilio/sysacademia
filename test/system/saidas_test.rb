require "application_system_test_case"

class SaidasTest < ApplicationSystemTestCase
  setup do
    @saida = saidas(:one)
  end

  test "visiting the index" do
    visit saidas_url
    assert_selector "h1", text: "Saidas"
  end

  test "creating a Saida" do
    visit saidas_url
    click_on "New Saida"

    fill_in "Descricao", with: @saida.descricao
    fill_in "Fornecedor", with: @saida.fornecedor_id
    fill_in "Modalidade", with: @saida.modalidade_id
    fill_in "Valor", with: @saida.valor
    click_on "Create Saida"

    assert_text "Saida was successfully created"
    click_on "Back"
  end

  test "updating a Saida" do
    visit saidas_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @saida.descricao
    fill_in "Fornecedor", with: @saida.fornecedor_id
    fill_in "Modalidade", with: @saida.modalidade_id
    fill_in "Valor", with: @saida.valor
    click_on "Update Saida"

    assert_text "Saida was successfully updated"
    click_on "Back"
  end

  test "destroying a Saida" do
    visit saidas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saida was successfully destroyed"
  end
end

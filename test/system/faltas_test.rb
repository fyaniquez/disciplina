require "application_system_test_case"

class FaltasTest < ApplicationSystemTestCase
  setup do
    @falta = faltas(:one)
  end

  test "visiting the index" do
    visit faltas_url
    assert_selector "h1", text: "Faltas"
  end

  test "creating a Falta" do
    visit faltas_url
    click_on "New Falta"

    fill_in "Descripcion", with: @falta.descripcion
    fill_in "Nombre", with: @falta.nombre
    fill_in "Norma", with: @falta.norma
    fill_in "Posicion", with: @falta.posicion
    fill_in "Sanciones", with: @falta.sanciones
    fill_in "Tipo", with: @falta.tipo
    click_on "Create Falta"

    assert_text "Falta was successfully created"
    click_on "Back"
  end

  test "updating a Falta" do
    visit faltas_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @falta.descripcion
    fill_in "Nombre", with: @falta.nombre
    fill_in "Norma", with: @falta.norma
    fill_in "Posicion", with: @falta.posicion
    fill_in "Sanciones", with: @falta.sanciones
    fill_in "Tipo", with: @falta.tipo
    click_on "Update Falta"

    assert_text "Falta was successfully updated"
    click_on "Back"
  end

  test "destroying a Falta" do
    visit faltas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Falta was successfully destroyed"
  end
end

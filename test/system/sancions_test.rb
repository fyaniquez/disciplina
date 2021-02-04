require "application_system_test_case"

class SancionsTest < ApplicationSystemTestCase
  setup do
    @sancion = sancions(:one)
  end

  test "visiting the index" do
    visit sancions_url
    assert_selector "h1", text: "Sancions"
  end

  test "creating a Sancion" do
    visit sancions_url
    click_on "New Sancion"

    fill_in "Descripcion", with: @sancion.descripcion
    fill_in "Estado", with: @sancion.estado
    fill_in "Nombre", with: @sancion.nombre
    fill_in "Norma", with: @sancion.norma
    fill_in "Posicion", with: @sancion.posicion
    click_on "Create Sancion"

    assert_text "Sancion was successfully created"
    click_on "Back"
  end

  test "updating a Sancion" do
    visit sancions_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @sancion.descripcion
    fill_in "Estado", with: @sancion.estado
    fill_in "Nombre", with: @sancion.nombre
    fill_in "Norma", with: @sancion.norma
    fill_in "Posicion", with: @sancion.posicion
    click_on "Update Sancion"

    assert_text "Sancion was successfully updated"
    click_on "Back"
  end

  test "destroying a Sancion" do
    visit sancions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sancion was successfully destroyed"
  end
end

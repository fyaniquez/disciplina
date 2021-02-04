require "application_system_test_case"

class CasosTest < ApplicationSystemTestCase
  setup do
    @caso = casos(:one)
  end

  test "visiting the index" do
    visit casos_url
    assert_selector "h1", text: "Casos"
  end

  test "creating a Caso" do
    visit casos_url
    click_on "New Caso"

    fill_in "Denunciante", with: @caso.denunciante
    fill_in "Descripcion", with: @caso.descripcion
    fill_in "Estado", with: @caso.estado
    fill_in "Fecha", with: @caso.fecha
    fill_in "Responsable", with: @caso.responsable
    click_on "Create Caso"

    assert_text "Caso was successfully created"
    click_on "Back"
  end

  test "updating a Caso" do
    visit casos_url
    click_on "Edit", match: :first

    fill_in "Denunciante", with: @caso.denunciante
    fill_in "Descripcion", with: @caso.descripcion
    fill_in "Estado", with: @caso.estado
    fill_in "Fecha", with: @caso.fecha
    fill_in "Responsable", with: @caso.responsable
    click_on "Update Caso"

    assert_text "Caso was successfully updated"
    click_on "Back"
  end

  test "destroying a Caso" do
    visit casos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Caso was successfully destroyed"
  end
end

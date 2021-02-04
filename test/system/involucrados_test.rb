require "application_system_test_case"

class InvolucradosTest < ApplicationSystemTestCase
  setup do
    @involucrado = involucrados(:one)
  end

  test "visiting the index" do
    visit involucrados_url
    assert_selector "h1", text: "Involucrados"
  end

  test "creating a Involucrado" do
    visit involucrados_url
    click_on "New Involucrado"

    fill_in "Alumno", with: @involucrado.alumno_id
    fill_in "Caso", with: @involucrado.caso_id
    fill_in "Estado", with: @involucrado.estado
    fill_in "Fecha", with: @involucrado.fecha
    fill_in "Participacion", with: @involucrado.participacion
    click_on "Create Involucrado"

    assert_text "Involucrado was successfully created"
    click_on "Back"
  end

  test "updating a Involucrado" do
    visit involucrados_url
    click_on "Edit", match: :first

    fill_in "Alumno", with: @involucrado.alumno_id
    fill_in "Caso", with: @involucrado.caso_id
    fill_in "Estado", with: @involucrado.estado
    fill_in "Fecha", with: @involucrado.fecha
    fill_in "Participacion", with: @involucrado.participacion
    click_on "Update Involucrado"

    assert_text "Involucrado was successfully updated"
    click_on "Back"
  end

  test "destroying a Involucrado" do
    visit involucrados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Involucrado was successfully destroyed"
  end
end

require "application_system_test_case"

class ContravencionsTest < ApplicationSystemTestCase
  setup do
    @contravencion = contravencions(:one)
  end

  test "visiting the index" do
    visit contravencions_url
    assert_selector "h1", text: "Contravencions"
  end

  test "creating a Contravencion" do
    visit contravencions_url
    click_on "New Contravencion"

    fill_in "Alumno", with: @contravencion.alumno_id
    fill_in "Caso", with: @contravencion.caso_id
    fill_in "Descripcion", with: @contravencion.descripcion
    fill_in "Estado", with: @contravencion.estado
    fill_in "Falta", with: @contravencion.falta_id
    fill_in "Fecha", with: @contravencion.fecha
    click_on "Create Contravencion"

    assert_text "Contravencion was successfully created"
    click_on "Back"
  end

  test "updating a Contravencion" do
    visit contravencions_url
    click_on "Edit", match: :first

    fill_in "Alumno", with: @contravencion.alumno_id
    fill_in "Caso", with: @contravencion.caso_id
    fill_in "Descripcion", with: @contravencion.descripcion
    fill_in "Estado", with: @contravencion.estado
    fill_in "Falta", with: @contravencion.falta_id
    fill_in "Fecha", with: @contravencion.fecha
    click_on "Update Contravencion"

    assert_text "Contravencion was successfully updated"
    click_on "Back"
  end

  test "destroying a Contravencion" do
    visit contravencions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contravencion was successfully destroyed"
  end
end

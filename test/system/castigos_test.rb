require "application_system_test_case"

class CastigosTest < ApplicationSystemTestCase
  setup do
    @castigo = castigos(:one)
  end

  test "visiting the index" do
    visit castigos_url
    assert_selector "h1", text: "Castigos"
  end

  test "creating a Castigo" do
    visit castigos_url
    click_on "New Castigo"

    fill_in "Alumno", with: @castigo.alumno_id
    fill_in "Caso", with: @castigo.caso_id
    fill_in "Descripcion", with: @castigo.descripcion
    fill_in "Estado", with: @castigo.estado
    fill_in "Fecha", with: @castigo.fecha
    fill_in "Sancion", with: @castigo.sancion_id
    click_on "Create Castigo"

    assert_text "Castigo was successfully created"
    click_on "Back"
  end

  test "updating a Castigo" do
    visit castigos_url
    click_on "Edit", match: :first

    fill_in "Alumno", with: @castigo.alumno_id
    fill_in "Caso", with: @castigo.caso_id
    fill_in "Descripcion", with: @castigo.descripcion
    fill_in "Estado", with: @castigo.estado
    fill_in "Fecha", with: @castigo.fecha
    fill_in "Sancion", with: @castigo.sancion_id
    click_on "Update Castigo"

    assert_text "Castigo was successfully updated"
    click_on "Back"
  end

  test "destroying a Castigo" do
    visit castigos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Castigo was successfully destroyed"
  end
end

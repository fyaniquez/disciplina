require "test_helper"

class CastigosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @castigo = castigos(:one)
  end

  test "should get index" do
    get castigos_url
    assert_response :success
  end

  test "should get new" do
    get new_castigo_url
    assert_response :success
  end

  test "should create castigo" do
    assert_difference('Castigo.count') do
      post castigos_url, params: { castigo: { alumno_id: @castigo.alumno_id, caso_id: @castigo.caso_id, descripcion: @castigo.descripcion, estado: @castigo.estado, fecha: @castigo.fecha, sancion_id: @castigo.sancion_id } }
    end

    assert_redirected_to castigo_url(Castigo.last)
  end

  test "should show castigo" do
    get castigo_url(@castigo)
    assert_response :success
  end

  test "should get edit" do
    get edit_castigo_url(@castigo)
    assert_response :success
  end

  test "should update castigo" do
    patch castigo_url(@castigo), params: { castigo: { alumno_id: @castigo.alumno_id, caso_id: @castigo.caso_id, descripcion: @castigo.descripcion, estado: @castigo.estado, fecha: @castigo.fecha, sancion_id: @castigo.sancion_id } }
    assert_redirected_to castigo_url(@castigo)
  end

  test "should destroy castigo" do
    assert_difference('Castigo.count', -1) do
      delete castigo_url(@castigo)
    end

    assert_redirected_to castigos_url
  end
end

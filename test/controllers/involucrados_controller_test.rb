require "test_helper"

class InvolucradosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @involucrado = involucrados(:one)
  end

  test "should get index" do
    get involucrados_url
    assert_response :success
  end

  test "should get new" do
    get new_involucrado_url
    assert_response :success
  end

  test "should create involucrado" do
    assert_difference('Involucrado.count') do
      post involucrados_url, params: { involucrado: { alumno_id: @involucrado.alumno_id, caso_id: @involucrado.caso_id, estado: @involucrado.estado, fecha: @involucrado.fecha, participacion: @involucrado.participacion } }
    end

    assert_redirected_to involucrado_url(Involucrado.last)
  end

  test "should show involucrado" do
    get involucrado_url(@involucrado)
    assert_response :success
  end

  test "should get edit" do
    get edit_involucrado_url(@involucrado)
    assert_response :success
  end

  test "should update involucrado" do
    patch involucrado_url(@involucrado), params: { involucrado: { alumno_id: @involucrado.alumno_id, caso_id: @involucrado.caso_id, estado: @involucrado.estado, fecha: @involucrado.fecha, participacion: @involucrado.participacion } }
    assert_redirected_to involucrado_url(@involucrado)
  end

  test "should destroy involucrado" do
    assert_difference('Involucrado.count', -1) do
      delete involucrado_url(@involucrado)
    end

    assert_redirected_to involucrados_url
  end
end

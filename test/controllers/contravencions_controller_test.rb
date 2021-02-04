require "test_helper"

class ContravencionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contravencion = contravencions(:one)
  end

  test "should get index" do
    get contravencions_url
    assert_response :success
  end

  test "should get new" do
    get new_contravencion_url
    assert_response :success
  end

  test "should create contravencion" do
    assert_difference('Contravencion.count') do
      post contravencions_url, params: { contravencion: { alumno_id: @contravencion.alumno_id, caso_id: @contravencion.caso_id, descripcion: @contravencion.descripcion, estado: @contravencion.estado, falta_id: @contravencion.falta_id, fecha: @contravencion.fecha } }
    end

    assert_redirected_to contravencion_url(Contravencion.last)
  end

  test "should show contravencion" do
    get contravencion_url(@contravencion)
    assert_response :success
  end

  test "should get edit" do
    get edit_contravencion_url(@contravencion)
    assert_response :success
  end

  test "should update contravencion" do
    patch contravencion_url(@contravencion), params: { contravencion: { alumno_id: @contravencion.alumno_id, caso_id: @contravencion.caso_id, descripcion: @contravencion.descripcion, estado: @contravencion.estado, falta_id: @contravencion.falta_id, fecha: @contravencion.fecha } }
    assert_redirected_to contravencion_url(@contravencion)
  end

  test "should destroy contravencion" do
    assert_difference('Contravencion.count', -1) do
      delete contravencion_url(@contravencion)
    end

    assert_redirected_to contravencions_url
  end
end

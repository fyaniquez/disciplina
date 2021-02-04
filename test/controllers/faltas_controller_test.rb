require "test_helper"

class FaltasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @falta = faltas(:one)
  end

  test "should get index" do
    get faltas_url
    assert_response :success
  end

  test "should get new" do
    get new_falta_url
    assert_response :success
  end

  test "should create falta" do
    assert_difference('Falta.count') do
      post faltas_url, params: { falta: { descripcion: @falta.descripcion, nombre: @falta.nombre, norma: @falta.norma, posicion: @falta.posicion, sanciones: @falta.sanciones, tipo: @falta.tipo } }
    end

    assert_redirected_to falta_url(Falta.last)
  end

  test "should show falta" do
    get falta_url(@falta)
    assert_response :success
  end

  test "should get edit" do
    get edit_falta_url(@falta)
    assert_response :success
  end

  test "should update falta" do
    patch falta_url(@falta), params: { falta: { descripcion: @falta.descripcion, nombre: @falta.nombre, norma: @falta.norma, posicion: @falta.posicion, sanciones: @falta.sanciones, tipo: @falta.tipo } }
    assert_redirected_to falta_url(@falta)
  end

  test "should destroy falta" do
    assert_difference('Falta.count', -1) do
      delete falta_url(@falta)
    end

    assert_redirected_to faltas_url
  end
end

require "test_helper"

class SancionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sancion = sancions(:one)
  end

  test "should get index" do
    get sancions_url
    assert_response :success
  end

  test "should get new" do
    get new_sancion_url
    assert_response :success
  end

  test "should create sancion" do
    assert_difference('Sancion.count') do
      post sancions_url, params: { sancion: { descripcion: @sancion.descripcion, estado: @sancion.estado, nombre: @sancion.nombre, norma: @sancion.norma, posicion: @sancion.posicion } }
    end

    assert_redirected_to sancion_url(Sancion.last)
  end

  test "should show sancion" do
    get sancion_url(@sancion)
    assert_response :success
  end

  test "should get edit" do
    get edit_sancion_url(@sancion)
    assert_response :success
  end

  test "should update sancion" do
    patch sancion_url(@sancion), params: { sancion: { descripcion: @sancion.descripcion, estado: @sancion.estado, nombre: @sancion.nombre, norma: @sancion.norma, posicion: @sancion.posicion } }
    assert_redirected_to sancion_url(@sancion)
  end

  test "should destroy sancion" do
    assert_difference('Sancion.count', -1) do
      delete sancion_url(@sancion)
    end

    assert_redirected_to sancions_url
  end
end

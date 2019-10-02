require 'test_helper'

class CiphersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cipher = ciphers(:one)
  end

  test "should get index" do
    get ciphers_url
    assert_response :success
  end

  test "should get new" do
    get new_cipher_url
    assert_response :success
  end

  test "should create cipher" do
    assert_difference('Cipher.count') do
      post ciphers_url, params: { cipher: { body: @cipher.body, offset: @cipher.offset } }
    end

    assert_redirected_to cipher_url(Cipher.last)
  end

  test "should show cipher" do
    get cipher_url(@cipher)
    assert_response :success
  end

  test "should get edit" do
    get edit_cipher_url(@cipher)
    assert_response :success
  end

  test "should update cipher" do
    patch cipher_url(@cipher), params: { cipher: { body: @cipher.body, offset: @cipher.offset } }
    assert_redirected_to cipher_url(@cipher)
  end

  test "should destroy cipher" do
    assert_difference('Cipher.count', -1) do
      delete cipher_url(@cipher)
    end

    assert_redirected_to ciphers_url
  end
end

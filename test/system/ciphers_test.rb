require "application_system_test_case"

class CiphersTest < ApplicationSystemTestCase
  setup do
    @cipher = ciphers(:one)
  end

  test "visiting the index" do
    visit ciphers_url
    assert_selector "h1", text: "Ciphers"
  end

  test "creating a Cipher" do
    visit ciphers_url
    click_on "New Cipher"

    fill_in "Body", with: @cipher.body
    fill_in "Offset", with: @cipher.offset
    click_on "Create Cipher"

    assert_text "Cipher was successfully created"
    click_on "Back"
  end

  test "updating a Cipher" do
    visit ciphers_url
    click_on "Edit", match: :first

    fill_in "Body", with: @cipher.body
    fill_in "Offset", with: @cipher.offset
    click_on "Update Cipher"

    assert_text "Cipher was successfully updated"
    click_on "Back"
  end

  test "destroying a Cipher" do
    visit ciphers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cipher was successfully destroyed"
  end
end

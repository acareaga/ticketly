require_relative '../test_helper'

class TestVistorIsPromptedToLogInTest < ActionDispatch::IntegrationTest
  test "that a guest is prompted to log in when they are attempthing to purchase" do
    category = Category.create!(name:"Pokemon")

    ticket = Ticket.create!(name:"Pokemon League", price:20, section:"A", row:"B",seat:"D", category_id:category.id)


    visit "/"

    click_link "Tickets"


    click_link "Details"

    click_link "Ticket Trip"

    fill_in "travellers", with: "1"
    click_button "Place Order"

    assert tickets_path, current_path

    click_link "Trips"

    click_button "Checkout"
    assert login_path, current_path
  end



#   As a guest visitor,
# I can add tickets to my cart,
# but when I attempt to checkout,
# I am prompted to sign in or sign up,
# and when I sign in, I can resume shopping.
end

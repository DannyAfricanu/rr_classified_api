require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get "/items", as: :json
    assert_response :success
  end


  test "index should get cars category" do
    get "/items", as: :json
    assert_response :success
    car_payload(JSON.parse(response.body)[0])
  end

  test "index should get clothing category" do
    get "/items", as: :json
    assert_response :success
    clothing_payload(JSON.parse(response.body)[1])
  end

  test "index should get other category" do
    get "/items", as: :json
    assert_response :success
    other_payload(JSON.parse(response.body)[2])
  end

  test "index should hide seller's name and published date for banned items" do
    get "/items", as: :json
    assert_response :success
    banned_payload(JSON.parse(response.body)[3])
  end

  test "should show sold items for seller" do
    get "/items/for_seller/jim/for_status/2", as: :json
    assert_response :success
    payload = JSON.parse(response.body)
    assert_equal nil, payload[1]
    clothing_payload(payload[0])
  end

  test "categories should hide seller's name and published date for banned items" do
    get "/items/for_category/2", as: :json
    assert_response :success
    banned_payload(JSON.parse(response.body)[1])
  end

  test "specific item should hide seller's name and published date for banned items" do
    get "/items/4", as: :json
    assert_response :success
    banned_payload(JSON.parse(response.body))
  end

  def banned_payload(payload)
    assert_equal "rifle", payload["title"]
    assert_equal "this is banned", payload["description"]
    assert_equal "others", payload["category"]
    assert_equal "150.0", payload["price"]
    assert_equal nil, payload["seller_name"]
    assert_equal "0.0", payload["seller_latitude"]
    assert_equal "0.0", payload["seller_longitude"]
    assert_equal "banned", payload["status"]
    assert_equal nil, payload["published_date"]
  end

  def clothing_payload(payload)
    assert_equal "tshirt", payload["title"]
    assert_equal "this is clothing", payload["description"]
    assert_equal "clothing", payload["category"]
    assert_equal "9.99", payload["price"]
    assert_equal "jim", payload["seller_name"]
    assert_equal "0.0", payload["seller_latitude"]
    assert_equal "0.0", payload["seller_longitude"]
    assert_equal "sold", payload["status"]
    assert_equal "2016-08-20", payload["published_date"]
  end

  def other_payload(payload)
    assert_equal "fish tank", payload["title"]
    assert_equal "this is something else", payload["description"]
    assert_equal "others", payload["category"]
    assert_equal "501.0", payload["price"]
    assert_equal "jim", payload["seller_name"]
    assert_equal "0.0", payload["seller_latitude"]
    assert_equal "0.0", payload["seller_longitude"]
    assert_equal "available", payload["status"]
    assert_equal "2016-08-20", payload["published_date"]
  end

  def car_payload(payload)
    assert_equal "mustang", payload["title"]
    assert_equal "this is a car", payload["description"]
    assert_equal "car", payload["category"]
    assert_equal "20000.0", payload["price"]
    assert_equal "jim", payload["seller_name"]
    assert_equal "0.0", payload["seller_latitude"]
    assert_equal "0.0", payload["seller_longitude"]
    assert_equal "available", payload["status"]
    assert_equal "2016-08-20", payload["published_date"]
  end

end

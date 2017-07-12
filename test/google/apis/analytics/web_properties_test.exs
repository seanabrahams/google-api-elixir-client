defmodule Google.Apis.Analytics.WebPropertiesTest do
  use Google.ApiCase
  doctest Google.Apis.Analytics.WebProperties
  alias Google.Apis.Analytics.WebProperties

  @token "abc123"
  @resource %{websiteUrl: "http://www.examplepetstore.com", name: "Example Store"}
  @account_id "12345678"
  @web_property_id "UA-12345678-6"
  @response ""

  test "#get 401 response" do
    use_cassette "analytics_web_properties_get_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = WebProperties.get(@token, @account_id, @web_property_id)
    end
  end

  test "#get 200 response" do
    use_cassette "analytics_web_properties_get_response" do
      assert {:ok, %{"id" => _id}} = WebProperties.get(@token, @account_id, @web_property_id)
    end
  end

  test "#insert 401 response" do
    use_cassette "analytics_web_properties_insert_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = WebProperties.insert(@token, @account_id, @resource)
    end
  end

  test "#insert 200 response" do
    use_cassette "analytics_web_properties_insert_response" do
      assert {:ok, %{"id" => _id}} = WebProperties.insert(@token, @account_id, @response)
    end
  end

  test "#list 401 response" do
    use_cassette "analytics_web_properties_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = WebProperties.list(@token, @account_id)
    end
  end

  test "#list 200 response" do
    use_cassette "analytics_web_properties_response" do
      assert {:ok, %{"items" => _items}} = WebProperties.list(@token, @account_id)
    end
  end

  test "#patch 401 response" do
    use_cassette "analytics_web_properties_patch_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = WebProperties.patch(@token, @account_id, @web_property_id, @resource)
    end
  end

  test "#patch 200 response" do
    use_cassette "analytics_web_properties_patch_response" do
      assert {:ok, %{"id" => _id}} = WebProperties.patch(@token, @account_id, @web_property_id, @response)
    end
  end

  test "#update 401 response" do
    use_cassette "analytics_web_properties_update_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = WebProperties.update(@token, @account_id, @web_property_id, @resource)
    end
  end

  test "#update 200 response" do
    use_cassette "analytics_web_properties_update_response" do
      assert {:ok, %{"id" => _id}} = WebProperties.update(@token, @account_id, @web_property_id, @response)
    end
  end
end

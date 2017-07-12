defmodule Google.Apis.Analytics.ViewsTest do
  use Google.ApiCase
  doctest Google.Apis.Analytics.Views
  alias Google.Apis.Analytics.Views

  @token "abc123"
  @resource %{websiteUrl: "http://www.examplepetstore.com", name: "Example Store"}
  @account_id "12345678"
  @web_property_id "UA-12345678-6"
  @profile_id "A1"
  @response ""

  test "#get 401 response" do
    use_cassette "analytics_views_get_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = Views.get(@token, @account_id, @web_property_id, @profile_id)
    end
  end

  test "#get 200 response" do
    use_cassette "analytics_views_get_response" do
      assert {:ok, %{"id" => _id}} = Views.get(@token, @account_id, @web_property_id, @profile_id)
    end
  end

  test "#insert 401 response" do
    use_cassette "analytics_views_insert_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = Views.insert(@token, @account_id, @web_property_id, @resource)
    end
  end

  test "#insert 200 response" do
    use_cassette "analytics_views_insert_response" do
      assert {:ok, %{"id" => _id}} = Views.insert(@token, @account_id, @web_property_id, @response)
    end
  end

  test "#list 401 response" do
    use_cassette "analytics_views_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = Views.list(@token, @account_id, @web_property_id)
    end
  end

  test "#list 200 response" do
    use_cassette "analytics_views_response" do
      assert {:ok, %{"items" => _items}} = Views.list(@token, @account_id, @web_property_id)
    end
  end

  test "#patch 401 response" do
    use_cassette "analytics_views_patch_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = Views.patch(@token, @account_id, @web_property_id, @profile_id, @resource)
    end
  end

  test "#patch 200 response" do
    use_cassette "analytics_views_patch_response" do
      assert {:ok, %{"id" => _id}} = Views.patch(@token, @account_id, @web_property_id, @profile_id, @response)
    end
  end

  test "#update 401 response" do
    use_cassette "analytics_views_update_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = Views.update(@token, @account_id, @web_property_id, @profile_id, @resource)
    end
  end

  test "#update 200 response" do
    use_cassette "analytics_views_update_response" do
      assert {:ok, %{"id" => _id}} = Views.update(@token, @account_id, @web_property_id, @profile_id, @response)
    end
  end
end

defmodule Google.Apis.Analytics.AccountsTest do
  use Google.ApiCase
  doctest Google.Apis.Analytics.Accounts
  alias Google.Apis.Analytics.Accounts

  @token "abc123"

  test "#list 401 response" do
    use_cassette "analytics_accounts_error_response" do
      assert {:error, %HTTPoison.Response{status_code: 401}} = Accounts.list(@token)
    end
  end

  test "#list 200 response" do
    use_cassette "analytics_accounts_response" do
      assert {:ok, %{"items" => _items}} = Accounts.list(@token)
    end
  end
end

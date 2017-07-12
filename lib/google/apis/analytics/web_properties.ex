defmodule Google.Apis.Analytics.WebProperties do
  use Google.Apis.Base, endpoint: "https://www.googleapis.com/analytics/v3/management/accounts/", oauth_only: true

  @moduledoc """
    Google Analytics, Web Properties Management: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/webproperties
  """

  @doc """
  Usage:
  Google.Apis.Analytics.WebProperties.get(token, account_id, web_property_id)

  See https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/webproperties/get
  """
  def get(token, account_id, web_property_id) do
    headers = build_auth_headers(token)
    get!("#{account_id}/webproperties/#{web_property_id}", headers)
    |> build_api_response()
  end

  @doc """
  Usage:
  Google.Apis.Analytics.WebProperties.insert(token, account_id, resource)

  Resource is a management web properties resource: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/webproperties#resource

  See https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/webproperties/insert
  """
  def insert(token, account_id, resource) do
    headers = build_auth_headers(token)
    body = resource |> Poison.encode!
    post!("#{account_id}/webproperties", body, headers)
    |> build_api_response()
  end

  @doc """
  Usage:
  Google.Apis.Analytics.WebProperties.list(token, account_id)

  See: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/webproperties/list
  """
  def list(token, account_id) do
    headers = build_auth_headers(token)
    get!("#{account_id}/webproperties", headers)
    |> build_api_response()
  end

  @doc """
  Usage:
  Google.Apis.Analytics.WebProperties.patch(token, account_id, web_property_id, resource)

  Resource is a management web properties resource: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/webproperties#resource

  See https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/webproperties/patch
  """
  def patch(token, account_id, web_property_id, resource) do
    headers = build_auth_headers(token)
    body = resource |> Poison.encode!
    patch!("#{account_id}/webproperties/#{web_property_id}", body, headers)
    |> build_api_response()
  end


  @doc """
  Usage:
  Google.Apis.Analytics.WebProperties.update(token, account_id, web_property_id, resource)

  Resource is a management web properties resource: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/webproperties#resource

  See https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/webproperties/update
  """
  def update(token, account_id, web_property_id, resource) do
    headers = build_auth_headers(token)
    body = resource |> Poison.encode!
    put!("#{account_id}/webproperties/#{web_property_id}", body, headers)
    |> build_api_response()
  end
end

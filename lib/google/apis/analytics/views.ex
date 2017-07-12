defmodule Google.Apis.Analytics.Views do
  use Google.Apis.Base, endpoint: "https://www.googleapis.com/analytics/v3/management/accounts/", oauth_only: true

  @moduledoc """
    Google Analytics, Views Management: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles
  """

  @doc """
  Usage:
  Google.Apis.Analytics.Views.delete(token, account_id, web_property_id, profile_id)

  See https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles/delete
  """
  def update(token, account_id, web_property_id, profile_id) do
    headers = build_auth_headers(token)
    delete!("#{account_id}/webproperties/#{web_property_id}/profiles/#{profile_id}", "", headers)
    |> build_api_response()
  end

  @doc """
  Usage:
  Google.Apis.Analytics.Views.get(token, account_id, web_property_id, profile_id)

  See https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles/get
  """
  def get(token, account_id, web_property_id, profile_id) do
    headers = build_auth_headers(token)
    get!("#{account_id}/webproperties/#{web_property_id}/profiles/#{profile_id}", headers)
    |> build_api_response()
  end

  @doc """
  Usage:
  Google.Apis.Analytics.Views.insert(token, account_id, web_property_id, resource)

  Resource is a management profiles resource: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles#resource

  See https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles/insert
  """
  def insert(token, account_id, web_property_id, resource) do
    headers = build_auth_headers(token)
    body = resource |> Poison.encode!
    post!("#{account_id}/webproperties/#{web_property_id}/profiles", body, headers)
    |> build_api_response()
  end

  @doc """
  Usage:
  Google.Apis.Analytics.Views.list(token, account_id, web_property_id)

  See: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles/list
  """
  def list(token, account_id, web_property_id) do
    headers = build_auth_headers(token)
    get!("#{account_id}/webproperties/#{web_property_id}/profiles", headers)
    |> build_api_response()
  end

  @doc """
  Usage:
  Google.Apis.Analytics.Views.patch(token, account_id, web_property_id, profile_id, resource)

  Resource is a management profiles resource: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles#resource

  See https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles/patch
  """
  def patch(token, account_id, web_property_id, profile_id, resource) do
    headers = build_auth_headers(token)
    body = resource |> Poison.encode!
    patch!("#{account_id}/webproperties/#{web_property_id}/profiles/#{profile_id}", body, headers)
    |> build_api_response()
  end

  @doc """
  Usage:
  Google.Apis.Analytics.Views.update(token, account_id, web_property_id, profile_id, resource)

  Resource is a management profiles resource: https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles#resource

  See https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/profiles/update
  """
  def update(token, account_id, web_property_id, profile_id, resource) do
    headers = build_auth_headers(token)
    body = resource |> Poison.encode!
    put!("#{account_id}/webproperties/#{web_property_id}/profiles/#{profile_id}", body, headers)
    |> build_api_response()
  end
end

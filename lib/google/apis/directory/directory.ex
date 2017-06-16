defmodule Google.Apis.Directory do
  use Google.Apis.Base, endpoint: "https://www.googleapis.com/admin/directory/v1/users?"

  @doc """
  Search Google's Directory: https://developers.google.com/admin-sdk/directory/

  Usage:

  Google.Apis.Directory.get_users()  -- gets 100 users for current domain
  Google.Apis.Directory.get_users(maxResults: 1000)

  Available options:
  domain: "", showDeleted: (true|false), maxResults: ""

  See https://developers.google.com/knowledge-graph/reference/rest/v1/
  """
  def get_users(params \\ [maxResults: 100]) do
    params = [] ++ params
    get!(URI.encode_query(params)).body
  end
end

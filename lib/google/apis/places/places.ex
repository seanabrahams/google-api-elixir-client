defmodule Google.Apis.Places do
  use Google.Apis.Base, endpoint: "https://maps.googleapis.com/maps/api/place/autocomplete/json?"

  @doc """
  Search Google's Place Autocomplete: https://developers.google.com/places/web-service/autocomplete

  Usage:
  Google.Apis.KnowledgeGraph.search("elixir")
  Google.Apis.KnowledgeGraph.search("elixir", limit: 20)

  Available options:
  ids: "", languages: "", types: "", indent: false,  prefix: false, limit: 10

  See https://developers.google.com/knowledge-graph/reference/rest/v1/
  """
  def autocomplete(input, params \\ []) do
    params = [input: input] ++ params
    get!(URI.encode_query(params)).body
  end
end

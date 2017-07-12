defmodule Google.Apis.KnowledgeGraph do
  use Google.Apis.Base, endpoint: "https://kgsearch.googleapis.com/v1/entities:search?"

  @doc """
  Search Google's Knowledge Graph: https://developers.google.com/knowledge-graph

  Usage:
  Google.Apis.KnowledgeGraph.search("elixir")
  Google.Apis.KnowledgeGraph.search("elixir", limit: 20)

  Available options:
  ids: "", languages: "", types: "", indent: false,  prefix: false, limit: 10

  See https://developers.google.com/knowledge-graph/reference/rest/v1/
  """
  def search(query, params \\ [indent: false,  prefix: false, limit: 10]) do
    params = [query: query] ++ params
    get!(URI.encode_query(params))
    |> build_api_response()
  end
end

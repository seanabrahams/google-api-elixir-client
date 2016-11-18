defmodule Google.Apis.KnowledgeGraph do
  use Google.Apis.Base, endpoint: "https://kgsearch.googleapis.com/v1/entities:search"

  def search(query) do
    get!("?query=#{query}").body
  end
end

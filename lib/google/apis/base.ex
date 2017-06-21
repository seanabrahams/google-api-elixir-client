defmodule Google.Apis.Base do
  defmacro __using__(opts) do
    quote bind_quoted: [endpoint: opts[:endpoint], oauth_only: opts[:oauth_only]] do
      use HTTPoison.Base

      defp process_response_body(body) do
        body
        |> Poison.decode!
      end

      defp process_url(url) do
        url = "#{unquote(endpoint)}#{url}"
        case unquote(oauth_only) do
          true -> url
          _ ->
            api_key = Application.fetch_env!(:google_api_client, :api_key)
            uri = URI.parse(url)
            query = URI.decode_query(uri.query || "")
                    |> Map.merge(%{"key" => api_key})
            uri
            |> Map.put(:query, URI.encode_query(query))
            |> URI.to_string
        end
      end
    end
  end
end

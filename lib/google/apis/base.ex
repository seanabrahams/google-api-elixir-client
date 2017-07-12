defmodule Google.Apis.Base do
  defmacro __using__(opts) do
    quote bind_quoted: [endpoint: opts[:endpoint], oauth_only: opts[:oauth_only]] do
      use HTTPoison.Base

      defp process_response_body(body) do
        body
        |> Poison.decode!
      end

      defp process_url(url) do
        full_url = "#{unquote(endpoint)}#{url}"
        case unquote(oauth_only) do
          true -> full_url
          _ ->
            api_key = Application.fetch_env!(:google_api_client, :api_key)
            uri = URI.parse(full_url)
            query = URI.decode_query(uri.query || "")
                    |> Map.merge(%{"key" => api_key})
            uri
            |> Map.put(:query, URI.encode_query(query))
            |> URI.to_string
        end
      end

      defp build_auth_headers(token) do
        ["Authorization": "Bearer #{token}", "Content-Type": "application/json"]
      end

      defp build_api_response(%HTTPoison.Response{body: body, status_code: status_code}) when status_code > 199 and status_code < 300 do
        {:ok, body}
      end

      defp build_api_response(%HTTPoison.Response{} = response), do: {:error, response}
    end
  end
end

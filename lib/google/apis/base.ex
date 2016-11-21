defmodule Google.Apis.Base do
  defmacro __using__(opts) do
    quote bind_quoted: [endpoint: opts[:endpoint]] do
      use HTTPoison.Base

      defp process_response_body(body) do
        body
        |> Poison.decode!
      end

      defp process_url(url) do
        api_key = Application.fetch_env!(:google_api_client, :api_key)
        "#{unquote(endpoint)}" <> url <> "&key=#{api_key}"
      end
    end
  end
end

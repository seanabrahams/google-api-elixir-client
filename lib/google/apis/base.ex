defmodule Google.Apis.Base do
  defmacro __using__(_) do
    quote do
      use HTTPoison.Base

      defp process_response_body(body) do
        body
        |> Poison.decode!
      end

      defp process_url(url) do
        api_key = Application.fetch_env!(:google_api_client, :api_key)
        "https://kgsearch.googleapis.com/v1/entities:search" <> url <> "&api_key=#{api_key}"
      end
    end
  end
end

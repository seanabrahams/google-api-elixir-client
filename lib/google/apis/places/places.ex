defmodule Google.Apis.Places do
  use Google.Apis.Base, endpoint: "https://maps.googleapis.com/maps/api/place/autocomplete/json?"

  @doc """
  Search Google's Place Autocomplete: https://developers.google.com/places/web-service/autocomplete

  Usage:
  Google.Apis.Places.autocomplete("ne")
  Google.Apis.Places.autocomplete("ne", language: "en")

  Available options:
  https://developers.google.com/places/web-service/autocomplete

  """

  def autocomplete(input, params \\ []) do
    params = [input: input] ++ params
    get!(URI.encode_query(params))
    |> build_api_response()
  end
end

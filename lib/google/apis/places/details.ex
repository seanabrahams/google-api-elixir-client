defmodule Google.Apis.Places.Details do
  use Google.Apis.Base, endpoint: "https://maps.googleapis.com/maps/api/place/details/json?"

  @doc """
  Get details for a specific place: https://developers.google.com/places/web-service/details

  Usage:
  Accepts one argument which is a place reference (returned as the result of a previous place search)

  Google.Apis.Places.nearby.get(ChIJN1t_tDeuEmsRUsoyG83fr)
  """

  def get(ref) do
    params = [reference: ref]
    IO.inspect URI.encode_query(params)
    get!(URI.encode_query(params)).body
  end
end
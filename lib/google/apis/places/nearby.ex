defmodule Google.Apis.Places.Nearby do
  use Google.Apis.Base, endpoint: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"

  @doc """
  Search for nearby places: https://developers.google.com/places/web-service/search#PlaceSearchRequests

  Usage:
  Google.Apis.Places.Nearby.get({-33.86,151.20}, radius: 50)
  Google.Apis.Places.Nearby.get({-33.86,151.20}, keyword: "food", rankby: "distance")

  Available options:
  https://developers.google.com/places/web-service/search#PlaceSearchRequests

  """

  def get(location, params \\ []) do
    params = Keyword.put_new(params, :location, Enum.join(Tuple.to_list(location), ","))
    get!(URI.encode_query(params))
    |> build_api_response()
  end
end

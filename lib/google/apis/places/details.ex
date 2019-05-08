defmodule Google.Apis.Places.Details do
  use Google.Apis.Base, endpoint: "https://maps.googleapis.com/maps/api/place/details/json?"

  @doc """
  Show details of place: https://developers.google.com/places/web-service/details#PlaceDetailsRequests

  Usage:
  Google.Apis.Places.Details.get("ChIJ-SskKr45jkcRPqmGB-ZGsRE")
  Google.Apis.Places.Details.get("ChIJ-SskKr45jkcRPqmGB-ZGsRE", fields: "opening_hours,geometry")

  Available options:
  https://developers.google.com/places/web-service/details#PlaceDetailsRequests

  """

  def get(placeid, params \\ []) do
    params = Keyword.put_new(params, :placeid, placeid)

    get!(URI.encode_query(params))
    |> build_api_response()
  end
end

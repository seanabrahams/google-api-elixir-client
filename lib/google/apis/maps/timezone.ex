defmodule Google.Apis.Maps.TimeZone do
  use Google.Apis.Base, endpoint: "https://maps.googleapis.com/maps/api/timezone/json?"

  @doc """
  Get a locations time zone.

  Usage:
  Google.Apis.Maps.TimeZone.get(location: {-33.86,151.20})

  Available options:
  location: {}, timestamp: 0

  location: a comma-separated lat,lng tuple (eg. location=-33.86,151.20),
  representing the location to look up.

  timestamp: specifies the desired time as seconds since midnight,
  January 1, 1970 UTC. The Google Maps Time Zone API uses the timestamp to
  determine whether or not Daylight Savings should be applied. Times before
  1970 can be expressed as negative values.

  See https://developers.google.com/maps/documentation/timezone
  """
  def get(params \\ [location: {}, timestamp: DateTime.to_unix(DateTime.utc_now)]) do
    params = Keyword.update!(params, :location, fn(l) -> Enum.join(Tuple.to_list(l), ",") end)
    params = Keyword.put_new(params, :timestamp, DateTime.to_unix(DateTime.utc_now))
    get!(URI.encode_query(params))
    |> build_api_response()
  end
end

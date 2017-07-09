# Google API Client for Elixir

Elixir library for accessing Google APIs.

Only the following APIs are supported:

* Knowledge Graph Search API
* Maps Time Zone API
* Places Autocomplete
* Nearby Places Search

PRs are welcome for more APIs.

## Installation

1. Add google_api_client to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:google_api_client, git: "https://github.com/seanabrahams/google-api-elixir-client.git"}]
  end
```

You will need a Google Developers Console project.

1. Go to the [Google Developers Console](https://console.developers.google.com/project).
2. Click Create Project, enter a name, and click Create.
3. Once inside your project, enable access to the Google APIs you want this project to have access to (Library -> Search -> Enable).
4. Create Credentials (API Key)
5. Add the following to your Elixir app's configuration:

```elixir
  config :google_api_client,
    api_key: "Your API key"
```

## Usage

```elixir
results = Google.Apis.KnowledgeGraph.search("elixir")
results["itemListElement"] # List of results

# See https://developers.google.com/knowledge-graph/reference/rest/v1/ for a
# full description of what's contained in results

Google.Apis.Maps.TimeZone.get(location: {-33.86,151.20})
# => %{"dstOffset" => 3600, "rawOffset" => 36000, "status" => "OK", "timeZoneId" => "Australia/Sydney", "timeZoneName" => "Australian Eastern Daylight Time"}
Google.Apis.Places.autocomplete("poz", language: "pl")
Google.Apis.Places.Nearby.get({-33.86,151.20}, radius: 50)

Google.Apis.??? # Submit a PR
```

# Google API Client for Elixir

Elixir library for accessing Google APIs.

Only the following APIs are supported:

* Analytics (partial)
* Knowledge Graph Search API
* Maps Time Zone API
* Places Autocomplete

PRs are welcome for more APIs.

## Installation

1. Add google_api_client to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:google_api_client, "~> 1.0"}]
  end
```

You will need a Google Developers Console project.

1. Go to the [Google Developers Console](https://console.developers.google.com/project).
2. Click Create Project, enter a name, and click Create.
3. Once inside your project, enable access to the Google APIs you want this project to have access to (Library -> Search -> Enable).

For key based requests:
1. Create Credentials (API Key)
2. Add the following to your Elixir app's configuration:

```elixir
  config :google_api_client,
    api_key: "Your API key"
```

For Ouath based requests:
1. Implement oauth to obtain a user's token (see:
   https://developers.google.com/identity/protocols/OAuth2WebServer)
2. Pass the access token to methods which require oauth

## Usage

```elixir
results = Google.Apis.KnowledgeGraph.search("elixir")
results["itemListElement"] # List of results

# See https://developers.google.com/knowledge-graph/reference/rest/v1/ for a
# full description of what's contained in results

Google.Apis.Maps.TimeZone.get(location: {-33.86,151.20})
# => %{"dstOffset" => 3600, "rawOffset" => 36000, "status" => "OK", "timeZoneId" => "Australia/Sydney", "timeZoneName" => "Australian Eastern Daylight Time"}
Google.Apis.Places.autocomplete("poz", language: "pl")

alias Google.Apis.Analytics.Accounts
Accounts.list("a_valid_oauth_token")

alias Google.Apis.Analytics.WebProperties
WebProperties.get("a_valid_oauth_token", account_id, web_property_id)
WebProperties.insert("a_valid_oauth_token", account_id, resource)
WebProperties.list("a_valid_oauth_token", account_id)
WebProperties.patch("a_valid_oauth_token", account_id, web_property_id, resource)
WebProperties.update("a_valid_oauth_token", account_id, web_property_id, resource)

alias Google.Apis.Analytics.Views
Views.delete("a_valid_oauth_token", account_id, web_property_id, profile_id)
Views.get("a_valid_oauth_token", account_id, web_property_id, profile_id)
Views.insert("a_valid_oauth_token", account_id, web_property_id, resource)
Views.list("a_valid_oauth_token", account_id, web_property_id)
Views.patch("a_valid_oauth_token", account_id, web_property_id, profile_id, resource)
Views.update("a_valid_oauth_token", account_id, web_property_id, profile_id, resource)

Google.Apis.??? # Submit a PR
```

# Special Thanks / Contributors

* Daniel Upton @elkelk

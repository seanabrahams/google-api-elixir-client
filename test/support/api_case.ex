defmodule Google.ApiCase do
  @moduledoc """
  This module defines the test case to be used by
  api tests.

  You may define functions here to be used as helpers in
  your api tests.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use ExUnit.Case
      use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
    end
  end

  setup do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    # replace emails
    ExVCR.Config.filter_sensitive_data("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}", "daniel@testco.com")
    # replace ids
    ExVCR.Config.filter_sensitive_data("[0-9]{6,20}", "12345678")
    ExVCR.Config.filter_request_headers("Authorization")
    :ok
  end
end

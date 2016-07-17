defmodule Hubspot.Request do
  defstruct [:method, :endpoint, :query, :json]
end

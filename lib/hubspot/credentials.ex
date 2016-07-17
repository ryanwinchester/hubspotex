defmodule Hubspot.Credentials do
  @moduledoc """
  A struct containing Hubspot API credentials
  """

  @enforce_keys [:token]

  defstruct token: "", oath: false
end

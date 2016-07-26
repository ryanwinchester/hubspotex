defmodule Hubspot.HTTP do
  use HTTPoison.Base

  @url Application.get_env(:hubspotex, :base_url)

  defp process_url("http" <> endpoint), do: "http" <> endpoint
  defp process_url(endpoint), do: @url <> endpoint
end

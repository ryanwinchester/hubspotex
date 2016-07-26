defmodule Hubspot.HTTP do
  @url Application.get_env(:hubspotex, :base_url)

  def request(%Hubspot.Request{} = request) do
    process_url(request.endpoint)
  end

  defp process_url("http" <> endpoint), do: "http" <> endpoint
  defp process_url(endpoint), do: @url <> endpoint
end

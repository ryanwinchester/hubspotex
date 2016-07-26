defmodule Hubspot do
  alias Hubspot.HTTP

  @url Application.get_env(:hubspotex, :base_url)

  @auth {Application.get_env(:hubspotex, :auth_method),
         Application.get_env(:hubspotex, :auth_key)}

  def request(%Hubspot.Request{} = request) do
    url = request.endpoint |> process_url
    params = request.query |> add_auth
    HTTP.request(request.method, url, request.body, [], params)
  end

  defp process_url("http" <> endpoint), do: "http" <> endpoint
  defp process_url(endpoint), do: @url <> endpoint

  defp add_auth(query), do: [@auth | query]
end

defmodule Hubspot.Request do
  defstruct method: :get, endpoint: "", query: [], body: ""

  alias Hubspot.HTTP

  @auth {Application.get_env(:hubspotex, :auth_method),
         Application.get_env(:hubspotex, :auth_key)}

  def send(%Hubspot.Request{} = request) do
    params = request.query |> map_query |> add_auth
    HTTP.request(request.method, request.endpoint, request.body, [], params)
  end

  defp map_query([]), do: []
  defp map_query(query) do
    [params: query]
  end

  defp add_auth([]), do: [params: [@auth]]
  defp add_auth(query) do
    query |> Keyword.update(:params, query[:params], &([@auth | &1]))
  end
end

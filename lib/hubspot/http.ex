defmodule Hubspot.HTTP do
  use HTTPoison.Base

  def request(method, url, headers, body, params) do
    options = params |> map_query
    super(method, url, headers, body, options)
  end

  defp map_query([]), do: []
  defp map_query(query) do
    [params: query]
  end

  defp process_request_body(body) do
    body |> Poison.Encoder.encode("")
  end

  defp process_response_body(body) do
    body |> Poison.decode
  end
end

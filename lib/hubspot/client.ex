defmodule Hubspot.Client do
  import Poison.Encoder, only: [encode: 2]

  def request(%Hubspot.Request{} = req) do
    send {req.method, req.endpoint, encode(req.json, []), [params: req.query]}
  end

  defp send({method, endpoint, body, options}) do
    HTTPoison.request(method, endpoint, body, [], options)
  end
end

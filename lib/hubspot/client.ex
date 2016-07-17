defmodule Hubspot.Client do
  def request(%Hubspot.Request{} = request) do
    send(request)
  end

  defp send(request) do
    request
  end
end

defmodule Hubspot.HTTP.Client do
  use HTTPoison.Base

  @doc """
  Issues an HTTP request with the given method to the given url.

  Args:
    * `method` - HTTP method as an atom (`:get`, `:head`, `:post`, `:put`,
      `:delete`, etc.)
    * `url` - target url as a binary string or char list
    * `body` - request body. See more below
    * `headers` - HTTP headers as an orddict (e.g., `[{"Accept", "application/json"}]`)
    * `options` - Keyword list of options

  Body:
    * binary, char list or an iolist
    * `{:form, [{K, V}, ...]}` - send a form url encoded
    * `{:file, "/path/to/file"}` - send a file

  ## Examples
          request(:post, "https://my.website.com", "{\"foo\": 3}", [{"Accept", "application/json"}])
  """
  def request(method, url, headers, body, params) do
    options = params |> process_request_options
    super(method, url, headers, body, options)
  end

  defp process_request_options([]), do: []
  defp process_request_options(params) do
    [params: params]
  end

  defp process_request_body(body) do
    body |> Poison.Encoder.encode("")
  end

  defp process_response_body(body) do
    body |> Poison.decode
  end
end

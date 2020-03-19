# Hubspot API wrapper in Elixir

[![Hex.pm](https://img.shields.io/hexpm/v/hubspotex.svg?maxAge=2592000)](https://hex.pm/packages/hubspotex)
 [![Hex.pm](https://img.shields.io/hexpm/l/hubspotex.svg?maxAge=2592000)](https://hex.pm/packages/hubspotex)
 [![Hex.pm](https://img.shields.io/hexpm/dt/hubspotex.svg?maxAge=2592000)](https://hex.pm/packages/hubspotex)
 [![Build Status](https://travis-ci.org/ryanwinchester/hubspotex.svg?branch=master)](https://travis-ci.org/ryanwinchester/hubspotex)


[[Hex]](https://hex.pm/packages/hubspotex) [[Docs]](https://hexdocs.pm/hubspotex/api-reference.html)

## Examples

```elixir

Hubspot.Contacts.all
#=> %Hubspot.HTTP.Request{endpoint: "/contacts/v1/lists/all/contacts/all",
#     method: :get, query: [], body: ""}

Hubspot.Contacts.all |> Hubspot.request
#=> {:ok, response}

Hubspot.Contacts.all([count: 10, vidOffset: 100]) |> Hubspot.request
#=> {:ok, response}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add hubspotex to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:hubspotex, "~> 0.0.7"}]
  end
  ```

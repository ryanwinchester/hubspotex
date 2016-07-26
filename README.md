# Hubspot API wrapper in Elixir

## Examples

```elixir

Hubspot.Contacts.all
#=> %Hubspot.Request{body: "", endpoint: "/contacts/v1/lists/all/contacts/all", method: :get, query: []}

Hubspot.Contacts.all |> Hubspot.request
#=> {:ok, response}

Hubspot.Contacts.all(["count": 10, "vidOffset": 100]) |> Hubspot.request
#=> {:ok, response}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add hubspotex to your list of dependencies in `mix.exs`:
  
  ```elixir
  def deps do
    [{:hubspotex, "~> 0.0.1"}]
  end
  ```

# Hubspot API wrapper in Elixir

## Examples

```elixir
Hubspot.Contacts.all |> Hubspot.Request.send
#=> {:ok, response}

Hubspot.Contacts.all(["count": 10, "vidOffset": 100]) |> Hubspot.Request.send
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

  2. Ensure hubspotex is started before your application:
  ``` elixir
  def application do
    [applications: [:hubspotex]]
  end
  ```

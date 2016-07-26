# Hubspot

**TODO: Add description**

## Examples

    iex> Hubspot.Contacts.all |> Hubspot.HTTP.request
    #=> {:ok, response}

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add hubspotex to your list of dependencies in `mix.exs`:

        def deps do
          [{:hubspotex, "~> 0.0.1"}]
        end

  2. Ensure hubspotex is started before your application:

        def application do
          [applications: [:hubspotex]]
        end

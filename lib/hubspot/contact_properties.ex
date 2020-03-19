defmodule Hubspot.ContactProperties do
  @doc """
  Get all Contact properties.

  Properties in HubSpot are fields that have been created, in this case for deals in a given portal.
  This endpoint will return all of the contacts properties, including their definition, for a given portal.

  see: http://developers.hubspot.com/docs/methods/contacts/v2/get_contacts_properties

  ## Example

      iex> Hubspot.ContactProperties.all
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/properties",
        method: :get, query: [], body: ""}
  """
  @spec all() :: %Hubspot.HTTP.Request{}
  def all() do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v2/properties",
      method: :get}
  end

  @doc """
  Get a Contact Property.

  Returns a JSON object representing the definition for a given contact property.

  see: http://developers.hubspot.com/docs/methods/companies/get_contact_property

  ## Example

      iex> Hubspot.ContactProperties.get("test")
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/properties/named/test",
        method: :get, query: [], body: ""}
  """
  @spec get(String.t) :: %Hubspot.HTTP.Request{}
  def get(name) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v2/properties/named/#{name}",
      method: :get}
  end

  @doc """
  Create a contact property.

  Create a property on every contact object to store a specific piece of data. In the example below,
  we want to store an invoice number on a separate field on deals.

  see: http://developers.hubspot.com/docs/methods/contacts/v2/create_contacts_property

  ## Example

      iex> Hubspot.ContactProperties.create([name: "test", label: "New test", type: "string"])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/properties",
        method: :post, query: [], body: [name: "test", label: "New test", type: "string"]}
  """
  @spec create(list) :: %Hubspot.HTTP.Request{}
  def create(property) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v2/properties",
      method: :post,
      body: property}
  end

  @doc """
  Update a contact property.

  Update a specified contact property.

  see: http://developers.hubspot.com/docs/methods/contacts/v2/update_contact_property

  ## Example

      iex> Hubspot.ContactProperties.update([name: "test", description: "Cool"])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/properties/named/test",
        method: :put, query: [], body: [name: "test", description: "Cool"]}
  """
  @spec update(list) :: %Hubspot.HTTP.Request{}
  def update(property) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v2/properties/named/#{property[:name]}",
      method: :put,
      body: property}
  end

  @doc """
  Delete a contact property.

  For a portal, delete an existing contact property.

  see: http://developers.hubspot.com/docs/methods/contacts/v2/delete_contact_property

  ## Example

      iex> Hubspot.ContactProperties.delete("some_property")
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/properties/named/some_property",
        method: :delete, query: [], body: ""}
  """
  @spec delete(String.t) :: %Hubspot.HTTP.Request{}
  def delete(name) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v2/properties/named/#{name}",
      method: :delete}
  end

  @doc """
  Get contact property groups.

  Returns all of the contact property groups for a given portal.

  see: http://developers.hubspot.com/docs/methods/contacts/v2/get_contact_property_groups

  ## Example

      iex> Hubspot.ContactProperties.get_groups
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/groups",
        method: :get, query: [includeProperties: false], body: ""}

      iex> Hubspot.ContactProperties.get_groups([includeProperties: true])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/groups",
        method: :get, query: [includeProperties: true], body: ""}
  """
  @spec get_groups(list) :: %Hubspot.HTTP.Request{}
  def get_groups(include_properties \\ [includeProperties: false]) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v2/groups",
      method: :get,
      query: include_properties}
  end

  @doc """
  Create a contact property group.

  Create a new contact property group to gather like contact-level data. Property groups allow you to more
  easily manage properties in a given portal and make contact records easier to parse for the user.

  see: http://developers.hubspot.com/docs/methods/contacts/v2/create_contacts_property_group

  ## Example

      iex> Hubspot.ContactProperties.create_group([name: "some_group"])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/groups",
        method: :post, query: [], body: [name: "some_group"]}
  """
  @spec create_group(list) :: %Hubspot.HTTP.Request{}
  def create_group(group) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v2/groups",
      method: :post,
      body: group}
  end

  @doc """
  Update a property group.

  Update a previously created contact property group.

  see: http://developers.hubspot.com/docs/methods/contacts/v2/update_contact_property_group

  ## Example

      iex> Hubspot.ContactProperties.update_group([name: "some_group", properties: [type: "string"]])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/groups/named/some_group",
        method: :put, query: [], body: [name: "some_group", properties: [type: "string"]]}
  """
  @spec update_group(list) :: %Hubspot.HTTP.Request{}
  def update_group(group) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v2/groups/named/#{group[:name]}",
      method: :put,
      body: group}
  end

  @doc """
  Delete a property group.

  Delete an existing contact property group.

  see: http://developers.hubspot.com/docs/methods/contacts/v2/delete_contact_property_group

  ## Example

      iex> Hubspot.ContactProperties.delete_group("test_group")
      %Hubspot.HTTP.Request{endpoint: "/contacts/v2/groups/named/test_group",
        method: :delete, query: [], body: ""}
  """
  @spec delete_group(String.t) :: %Hubspot.HTTP.Request{}
  def delete_group(name) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v2/groups/named/#{name}",
      method: :delete}
  end
end

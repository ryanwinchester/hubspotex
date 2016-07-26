defmodule Hubspot.Contacts do
  alias Hubspot.Request

  @doc """
  Returns a struct that is used in `Hubspot.Client` for
  getting all contacts from Hubspot.

  ## Examples
      iex> Hubspot.Contacts.all()
      %Hubspot.Request{endpoint: "/contacts/v1/lists/all/contacts/all",
        method: :get, query: nil, json: nil}

      iex> Hubspot.Contacts.all([{:count, 10}, {:vidOffset, 100}])
      %Hubspot.Request{endpoint: "/contacts/v1/lists/all/contacts/all",
        method: :get, query: [{:count, 10}, {:vidOffset, 100}], json: nil}
  """
  @spec all(list) :: %Hubspot.Request{}
  def all(params \\ nil) do
    %Request{
      endpoint: "/contacts/v1/lists/all/contacts/all",
      method: :get,
      query: params}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.get_by_email("test@hubspot.com")
      %Hubspot.Request{endpoint: "/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: nil, json: nil}
  """
  @spec get_by_email(String.t) :: %Hubspot.Request{}
  def get_by_email(email) do
    %Request{
      endpoint: "/contacts/v1/contact/email/#{email}/profile",
      method: :get}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.create([properties: [name: "test", value: "test"]])
      %Hubspot.Request{endpoint: "/contacts/v1/contact",
        method: :post, query: nil, json: [properties: [name: "test", value: "test"]]}
  """
  @spec create(list) :: %Hubspot.Request{}
  def create(properties) do
    %Request{
      endpoint: "/contacts/v1/contact",
      method: :post,
      json: properties}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.update(1234, [properties: [name: "first_name", value: "Fred"]])
      %Hubspot.Request{endpoint: "/contacts/v1/contact/vid/1234/profile",
        method: :post, query: nil, json: [properties: [name: "first_name", value: "Fred"]]}
  """
  @spec update(integer, list) :: %Hubspot.Request{}
  def update(id, properties) do
    %Request{
      endpoint: "/contacts/v1/contact/vid/#{id}/profile",
      method: :post,
      json: properties}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.create_or_update("test@hubspot.com", [properties: [name: "first_name", value: "Fred"]])
      %Hubspot.Request{endpoint: "/contacts/v1/contact/createOrUpdate/email/test@hubspot.com",
        method: :post, query: nil, json: [properties: [name: "first_name", value: "Fred"]]}
  """
  @spec create_or_update(String.t, list) :: %Hubspot.Request{}
  def create_or_update(email, properties \\ nil) do
    %Request{
      endpoint: "/contacts/v1/contact/createOrUpdate/email/#{email}",
      method: :post,
      json: properties}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.create_or_update_batch([vid: [1234, 1235]])
      %Hubspot.Request{endpoint: "/contacts/v1/contact/batch",
        method: :post, query: nil, json: [vid: [1234, 1235]]}
  """
  @spec create_or_update_batch(list) :: %Hubspot.Request{}
  def create_or_update_batch(contacts) do
    %Request{
      endpoint: "/contacts/v1/contact/batch",
      method: :post,
      json: contacts}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.delete(1234)
      %Hubspot.Request{endpoint: "/contacts/v1/contact/vid/1234",
        method: :delete, query: nil, json: nil}
  """
  @spec delete(integer) :: %Hubspot.Request{}
  def delete(id) do
    %Request{
      endpoint: "/contacts/v1/contact/vid/#{id}",
      method: :delete}
  end

  @doc """
  For a given portal, return all contacts that have been recently updated or created.
  A paginated list of contacts will be returned to you, with a maximum of 100 contacts per page, as specified by
  the "count" parameter. The endpoint only scrolls back in time 30 days.

  ## Example
      iex> Hubspot.Contacts.recent()
      %Hubspot.Request{endpoint: "/contacts/v1/lists/recently_updated/contacts/recent",
        method: :get, query: nil, json: nil}
  """
  @spec recent(list) :: %Hubspot.Request{}
  def recent(params \\ nil) do
    %Request{
      endpoint: "/contacts/v1/lists/recently_updated/contacts/recent",
      method: :get,
      query: params}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.get_by_id(1234)
      %Hubspot.Request{endpoint: "/contacts/v1/contact/vid/1234/profile",
        method: :get, query: nil, json: nil}
  """
  @spec get_by_id(integer) :: %Hubspot.Request{}
  def get_by_id(id) do
    %Request{
      endpoint: "/contacts/v1/contact/vid/#{id}/profile",
      method: :get}
  end

  @doc """
  For a given portal, return information about a group of contacts by their unique ID's. A contact's unique ID's
  is stored in a field called 'vid' which stands for 'visitor ID'.

  This method will also return you much of the HubSpot lead "intelligence" for each requested contact record. The
  endpoint accepts many query parameters that allow for customization based on a variety of integration use cases.

  ## Example
      iex> Hubspot.Contacts.get_batch_by_ids([{:vid, 1234},{:vid, 4321}])
      %Hubspot.Request{endpoint: "/contacts/v1/contact/vids/batch",
        method: :get, query: [{:vid, 1234},{:vid, 4321}], json: nil}
  """
  @spec get_batch_by_ids(list) :: %Hubspot.Request{}
  def get_batch_by_ids(params) do
    %Request{
      endpoint: "/contacts/v1/contact/vids/batch",
      method: :get,
      query: params}
  end

  @doc """
  For a given portal, return information about a group of contacts by their email addresses.

  This method will also return you much of the HubSpot lead "intelligence" for each requested contact record. The
  endpoint accepts many query parameters that allow for customization based on a variety of integration use cases.

  ## Example
      iex> Hubspot.Contacts.get_batch_by_emails([{:email, "test@hubspot.com"},{:email, "test2@hubspot.com"}])
      %Hubspot.Request{endpoint: "/contacts/v1/contact/emails/batch",
        method: :get, query: [{:email, "test@hubspot.com"},{:email, "test2@hubspot.com"}], json: nil}
  """
  @spec get_batch_by_emails(list) :: %Hubspot.Request{}
  def get_batch_by_emails(params) do
    %Request{
      endpoint: "/contacts/v1/contact/emails/batch",
      method: :get,
      query: params}
  end

  @doc """
  Get a contact matching the token.

  ## Example
      iex> Hubspot.Contacts.get_by_token("1234")
      %Hubspot.Request{endpoint: "/contacts/v1/contact/utk/1234/profile",
        method: :get, query: nil, json: nil}
  """
  @spec get_by_token(String.t) :: %Hubspot.Request{}
  def get_by_token(utk) do
    %Request{
      endpoint: "/contacts/v1/contact/utk/#{utk}/profile",
      method: :get}
  end

  @doc """
  For a given portal, return information about a group of contacts by their user tokens (hubspotutk).

  This method will also return you much of the HubSpot lead "intelligence" for each requested contact
  record. The endpoint accepts many query parameters that allow for customization based on a variety of
  integration use cases.

  The endpoint does not allow for CORS, so if you are looking up contacts from their user token on the client,
  you'll need to spin up a proxy server to interact with the API.

  ## Example
      iex> Hubspot.Contacts.get_batch_by_tokens([{:utk, 1234}, {:utk, 4523}])
      %Hubspot.Request{endpoint: "/contacts/v1/contact/utks/batch",
        method: :get, query: [{:utk, 1234}, {:utk, 4523}], json: nil}
  """
  @spec get_batch_by_tokens(list) :: %Hubspot.Request{}
  def get_batch_by_tokens(params) do
    %Request{
      endpoint: "/contacts/v1/contact/utks/batch",
      method: :get,
      query: params}
  end

  @doc """
  For a given portal, return contacts and some data associated with
  those contacts by the contact's email address or name.

  Please note that you should expect this method to only return a small
  subset of data about the contact. One piece of data that the method will
  return is the contact ID (vid) that you can then use to look up much
  more data about that particular contact by its ID.

  ## Example
      iex> Hubspot.Contacts.search({:q, "test@hubapi.com"})
      %Hubspot.Request{endpoint: "/contacts/v1/search/query",
        method: :get, query: {:q, "test@hubapi.com"}, json: nil}
  """
  @spec search(list) :: %Hubspot.Request{}
  def search(query) do
    %Request{
      endpoint: "/contacts/v1/search/query",
      method: :get,
      query: query}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.statistics()
      %Hubspot.Request{endpoint: "/contacts/v1/contacts/statistics",
        method: :get, query: nil, json: nil}
  """
  @spec statistics() :: %Hubspot.Request{}
  def statistics() do
    %Request{
      endpoint: "/contacts/v1/contacts/statistics",
      method: :get}
  end
end

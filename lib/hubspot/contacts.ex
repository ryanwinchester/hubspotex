defmodule Hubspot.Contacts do
  @doc """
  Returns a struct that is used in `Hubspot.Client` for
  getting all contacts from Hubspot.

  ## Examples
      iex> Hubspot.Contacts.all()
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/lists/all/contacts/all",
        method: :get, query: [], body: ""}

      iex> Hubspot.Contacts.all([count: 10, vidOffset: 100])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/lists/all/contacts/all",
        method: :get, query: [count: 10, vidOffset: 100], body: ""}
  """
  @spec all(list) :: %Hubspot.HTTP.Request{}
  def all(params \\ []) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/lists/all/contacts/all",
      method: :get,
      query: params}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.get_by_email("test@hubspot.com")
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/email/test@hubspot.com/profile",
        method: :get, query: [], body: ""}
  """
  @spec get_by_email(String.t) :: %Hubspot.HTTP.Request{}
  def get_by_email(email) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/contact/email/#{email}/profile",
      method: :get}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.create([properties: [name: "test", value: "test"]])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact",
        method: :post, query: [], body: [properties: [name: "test", value: "test"]]}
  """
  @spec create(list) :: %Hubspot.HTTP.Request{}
  def create(properties) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/contact",
      method: :post,
      body: properties}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.update(1234, [properties: [name: "first_name", value: "Fred"]])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/vid/1234/profile",
        method: :post, query: [], body: [properties: [name: "first_name", value: "Fred"]]}
  """
  @spec update(integer, list) :: %Hubspot.HTTP.Request{}
  def update(id, properties) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/contact/vid/#{id}/profile",
      method: :post,
      body: properties}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.create_or_update("test@hubspot.com", [properties: [name: "first_name", value: "Fred"]])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/createOrUpdate/email/test@hubspot.com",
        method: :post, query: [], body: [properties: [name: "first_name", value: "Fred"]]}
  """
  @spec create_or_update(String.t, list) :: %Hubspot.HTTP.Request{}
  def create_or_update(email, properties \\ "") do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/contact/createOrUpdate/email/#{email}",
      method: :post,
      body: properties}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.create_or_update_batch([vid: [1234, 1235]])
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/batch",
        method: :post, query: [], body: [vid: [1234, 1235]]}
  """
  @spec create_or_update_batch(list) :: %Hubspot.HTTP.Request{}
  def create_or_update_batch(contacts) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/contact/batch",
      method: :post,
      body: contacts}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.delete(1234)
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/vid/1234",
        method: :delete, query: [], body: ""}
  """
  @spec delete(integer) :: %Hubspot.HTTP.Request{}
  def delete(id) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/contact/vid/#{id}",
      method: :delete}
  end

  @doc """
  For a given portal, return all contacts that have been recently updated or created.
  A paginated list of contacts will be returned to you, with a maximum of 100 contacts per page, as specified by
  the "count" parameter. The endpoint only scrolls back in time 30 days.

  ## Example
      iex> Hubspot.Contacts.recent()
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/lists/recently_updated/contacts/recent",
        method: :get, query: [], body: ""}
  """
  @spec recent(list) :: %Hubspot.HTTP.Request{}
  def recent(params \\ []) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/lists/recently_updated/contacts/recent",
      method: :get,
      query: params}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.get_by_id(1234)
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/vid/1234/profile",
        method: :get, query: [], body: ""}
  """
  @spec get_by_id(integer) :: %Hubspot.HTTP.Request{}
  def get_by_id(id) do
    %Hubspot.HTTP.Request{
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
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/vids/batch",
        method: :get, query: [{:vid, 1234},{:vid, 4321}], body: ""}
  """
  @spec get_batch_by_ids(list) :: %Hubspot.HTTP.Request{}
  def get_batch_by_ids(params) do
    %Hubspot.HTTP.Request{
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
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/emails/batch",
        method: :get, query: [{:email, "test@hubspot.com"},{:email, "test2@hubspot.com"}], body: ""}
  """
  @spec get_batch_by_emails(list) :: %Hubspot.HTTP.Request{}
  def get_batch_by_emails(params) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/contact/emails/batch",
      method: :get,
      query: params}
  end

  @doc """
  Get a contact matching the token.

  ## Example
      iex> Hubspot.Contacts.get_by_token("1234")
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/utk/1234/profile",
        method: :get, query: [], body: ""}
  """
  @spec get_by_token(String.t) :: %Hubspot.HTTP.Request{}
  def get_by_token(utk) do
    %Hubspot.HTTP.Request{
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
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contact/utks/batch",
        method: :get, query: [{:utk, 1234}, {:utk, 4523}], body: ""}
  """
  @spec get_batch_by_tokens(list) :: %Hubspot.HTTP.Request{}
  def get_batch_by_tokens(params) do
    %Hubspot.HTTP.Request{
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
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/search/query",
        method: :get, query: {:q, "test@hubapi.com"}, body: ""}
  """
  @spec search(list) :: %Hubspot.HTTP.Request{}
  def search(query) do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/search/query",
      method: :get,
      query: query}
  end

  @doc """
  Get a contact matching the email.

  ## Example
      iex> Hubspot.Contacts.statistics()
      %Hubspot.HTTP.Request{endpoint: "/contacts/v1/contacts/statistics",
        method: :get, query: [], body: ""}
  """
  @spec statistics() :: %Hubspot.HTTP.Request{}
  def statistics() do
    %Hubspot.HTTP.Request{
      endpoint: "/contacts/v1/contacts/statistics",
      method: :get}
  end
end

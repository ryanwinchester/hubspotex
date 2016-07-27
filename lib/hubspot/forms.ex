defmodule Hubspot.Forms do
  @doc """
  Submit data to a form.

  see: http://developers.hubspot.com/docs/methods/forms/submit_form

  Send form submission data to HubSpot. Form submissions from external sources can be made to any registered
  HubSpot form. You can see a list of forms on your portal by going to the Contacts > Forms page

  ## Example

      iex> Hubspot.Forms.submit(1234, "1234-abcd", [])
      %Hubspot.HTTP.Request{endpoint: "https://forms.hubspot.com/uploads/form/v2/1234/1234-abcd",
        method: :post, body: [], query: []}
  """
  def submit(portal_id, form_guid, form) do
    %Hubspot.HTTP.Request{
      endpoint: "https://forms.hubspot.com/uploads/form/v2/#{portal_id}/#{form_guid}",
      method: :post,
      body: form}
  end

  @doc """
  Return all forms that have been created in the portal.

  see: http://developers.hubspot.com/docs/methods/forms/v2/get_forms

  ## Example

      iex> Hubspot.Forms.all()
      %Hubspot.HTTP.Request{endpoint: "/forms/v2/forms",
        method: :get, body: "", query: []}
  """
  def all() do
    %Hubspot.HTTP.Request{
      endpoint: "/forms/v2/forms",
      method: :get}
  end

  @doc """
  Return a single form based on the unique ID of that form.

  see: http://developers.hubspot.com/docs/methods/forms/v2/get_form

  ## Example

      iex> Hubspot.Forms.getById("1234-abcd")
      %Hubspot.HTTP.Request{endpoint: "/forms/v2/forms/1234-abcd",
        method: :get, body: "", query: []}
  """
  def getById(form_guid) do
    %Hubspot.HTTP.Request{
      endpoint: "/forms/v2/forms/#{form_guid}",
      method: :get}
  end

  @doc """
  Create a new form.

  see: http://developers.hubspot.com/docs/methods/forms/v2/create_form

  ## Example

      iex> Hubspot.Forms.create([])
      %Hubspot.HTTP.Request{endpoint: "/forms/v2/forms",
        method: :post, body: [], query: []}
  """
  def create(form) do
    %Hubspot.HTTP.Request{
      endpoint: "/forms/v2/forms",
      method: :post,
      body: form}
  end

  @doc """
  Update an existing form.

  see: http://developers.hubspot.com/docs/methods/forms/v2/update_form

  ## Example

      iex> Hubspot.Forms.update("1234-abcd", [])
      %Hubspot.HTTP.Request{endpoint: "/forms/v2/forms/1234-abcd",
        method: :post, body: [], query: []}
  """
  def update(form_guid, form) do
    %Hubspot.HTTP.Request{
      endpoint: "/forms/v2/forms/#{form_guid}",
      method: :post,
      body: form}
  end

  @doc """
  Delete an existing form.

  see: http://developers.hubspot.com/docs/methods/forms/v2/delete_form

  ## Example

      iex> Hubspot.Forms.delete("1234-abcd")
      %Hubspot.HTTP.Request{endpoint: "/forms/v2/forms/1234-abcd",
        method: :delete, body: "", query: []}
  """
  def delete(form_guid) do
    %Hubspot.HTTP.Request{
      endpoint: "/forms/v2/forms/#{form_guid}",
      method: :delete}
  end

  @doc """
  Get all fields from a form.

  see: http://developers.hubspot.com/docs/methods/forms/v2/get_fields

  ## Example

      iex> Hubspot.Forms.getFields("1234-abcd")
      %Hubspot.HTTP.Request{endpoint: "/forms/v2/fields/1234-abcd",
        method: :get, body: "", query: []}
  """
  def getFields(form_guid) do
    %Hubspot.HTTP.Request{
      endpoint: "/forms/v2/fields/#{form_guid}",
      method: :get}
  end

  @doc """
  Get a single field from a form.

  see: http://developers.hubspot.com/docs/methods/forms/v2/get_field

  ## Example

      iex> Hubspot.Forms.getFieldByName("1234-abcd", "some_field")
      %Hubspot.HTTP.Request{endpoint: "/forms/v2/fields/1234-abcd/some_field",
        method: :get, body: "", query: []}
  """
  def getFieldByName(form_guid, name) do
    %Hubspot.HTTP.Request{
      endpoint: "/forms/v2/fields/#{form_guid}/#{name}",
      method: :get}
  end
end

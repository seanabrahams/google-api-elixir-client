defmodule Google.Apis.Drive.Files do
  use Google.Apis.Base, endpoint: "https://www.googleapis.com/drive/v3/files"

  @doc """
  Creates a copy of a file and applies any requested updates with patch semantics.

  Usage:
  Google.Apis.Drive.Files.copy(fileId: {"1234abcd"})

  Available params:
  fileId: "", keepRevisionForever: false, ignoreDefaultVisibility: false, ocrLanguage: ""

  fileId: The ID of the file to copy. This can be obtained either via the API, or copying
  the ID out of the Google Docs URL.

  keepRevisionForever: Whether to set the 'keepForever' field in the new head revision.
  This is only applicable to files with binary content in Drive. (Default: false)

  ocrLanguage: A language hint for OCR processing during image import (ISO 639-1 code).

  ignoreDefaultVisibility: Whether to ignore the domain's default visibility settings for the created file.
  Domain administrators can choose to make all uploaded files visible to the domain by default;
  this parameter bypasses that behavior for the request. Permissions are still inherited from parent folders.
  (Default: false)

  See https://developers.google.com/drive/v3/reference/files/copy
  """
  def copy(params \\ [fileId: "", keepRevisionForever: false, ignoreDefaultVisibility: false], request_body \\ []) do
    get!(URI.encode_query(params)).body
  end
end
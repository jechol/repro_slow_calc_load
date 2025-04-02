defmodule Nietflix.Ets do
  use Ash.Domain,
    otp_app: :nietflix

  resources do
    resource Nietflix.Ets.Author
    resource Nietflix.Ets.Post
    resource Nietflix.Ets.Comment
  end
end

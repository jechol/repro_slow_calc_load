defmodule Ets do
  use Ash.Domain,
    otp_app: :nietflix

  resources do
    resource Ets.Author
    resource Ets.Post
    resource Ets.Comment
  end
end

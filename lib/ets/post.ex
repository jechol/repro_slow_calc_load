defmodule Ets.Post do
  use Common.Post,
    otp_app: :nietflix,
    domain: Ets,
    data_layer: Ash.DataLayer.Ets
end

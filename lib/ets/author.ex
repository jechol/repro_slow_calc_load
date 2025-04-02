defmodule Ets.Author do
  use Common.Author,
    otp_app: :nietflix,
    domain: Ets,
    data_layer: Ash.DataLayer.Ets
end

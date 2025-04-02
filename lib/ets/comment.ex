defmodule Ets.Comment do
  use Common.Comment,
    otp_app: :nietflix,
    domain: Ets,
    data_layer: Ash.DataLayer.Ets
end

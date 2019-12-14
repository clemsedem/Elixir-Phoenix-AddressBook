defmodule Materializecss.Repo do
  use Ecto.Repo,
    otp_app: :materializecss,
    adapter: Ecto.Adapters.Postgres
end

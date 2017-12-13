# Bureaucrat
Bureaucrat.start(
  writer: Bureaucrat.MarkdownWriter,
  default_path: "doc/README.md"
)

ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter])

Ecto.Adapters.SQL.Sandbox.mode(Zipgenius.Repo, :manual)

# Auto-skip tests with @tag :skip
ExUnit.configure(exclude: [skip: true])

# Wallaby
{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, Zipgenius.Endpoint.url())

# ExMachina
{:ok, _} = Application.ensure_all_started(:ex_machina)
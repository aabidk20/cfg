return {
  "Saghen/blink.cmp",
  -- opts = { HERE }
  --WARN: Sources are not working as expected rn
  sources = {
    default = { "laravel", "lsp", "snippets", "buffer", "path" },
    providers = {
      laravel = {
        name = "laravel",
        module = "blink.compat.source",
      },
      ["easy-dotnet"] = {
        name = "easy-dotnet",
        enabled = true,
        module = "easy-dotnet.completion.blink",
        score_offset = 10000,
        async = true,
      },
    },
  },
}

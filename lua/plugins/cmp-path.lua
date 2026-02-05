return {
  "hrsh7th/cmp-path",
  event = "InsertEnter",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    require("config.path_completion")
  end,
}


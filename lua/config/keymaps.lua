-- Utility to simplify mappings
global_map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- ====================
-- Telescope Mappings
-- ====================
-- invoke find files, live grep, buffers and help
local builtin = require("telescope.builtin")

global_map("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find Files" })
global_map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live Grep" })
global_map("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Buffers" })
global_map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help Tags" })

-- Neotree file explorer
global_map("n", "<C-n>", ":Neotree filesystem toggle right<CR>", { desc = "Neotree: Toggle Explorer" })

-- ====================
-- LSP Mappings (buffer-local)
-- ====================
-- setup on_attach to bind LSP functions only when language server attaches
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  local buf_map = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true, buffer = bufnr }
    if opts then
      vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  -- Hover and navigation
  buf_map("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation" })
  buf_map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
  buf_map("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP: List References" })

  -- Code actions and formatting
  buf_map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" })
  buf_map("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP: Format Buffer" })
  -- Diagnostic navigation and display
  buf_map("n", "<leader>e", vim.diagnostic.open_float, { desc = "LSP: Show Diagnostics in Float" })
  buf_map("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP: Go to Previous Diagnostic" })
  buf_map("n", "]d", vim.diagnostic.goto_next, { desc = "LSP: Go to Next Diagnostic" })
  buf_map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "LSP: Populate Location List with Diagnostics" })
end

-- Pass on_attach to each server
-- local lspconfig = require("lspconfig")

local servers = { "lua_ls", "ts_ls", "html", "pyright" }
for _, server in ipairs(servers) do
  vim.lsp.config(server, { on_attach = on_attach, })
  vim.lsp.enable(server)
end 

-- ====================
-- Debugger Mappings
-- ====================
local dap = require("dap")

global_map("n", "<leader>dt", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
global_map("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
global_map("n", "<leader>do", dap.step_over, { desc = "DAP: Step Over" })
global_map("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
global_map("n", "<leader>du", dap.step_out, { desc = "DAP: Step Out" })
global_map("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: Toggle REPL" })

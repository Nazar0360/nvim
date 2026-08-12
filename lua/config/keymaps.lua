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

local function latex_build()
  vim.cmd("write") -- save file
  local file = vim.fn.expand("%:p")
  local base = vim.fn.expand("%:r")
  local cwd = vim.fn.expand("%:p:h")

  vim.notify("Building LaTeX → .dvi ...", vim.log.levels.INFO)
  local job = vim.fn.jobstart({
    "latex", "-interaction=nonstopmode", "-synctex=1", file
  }, {
    cwd = cwd,
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("Converting .dvi → .pdf ...", vim.log.levels.INFO)
        vim.fn.jobstart({
          "dvipdf", base .. ".dvi"
        }, {
          cwd = cwd,
          detach = true,   -- runs in background
          on_exit = function(_, code2)
            if code2 == 0 then
              vim.schedule(function()
                vim.notify("PDF ready: " .. base .. ".pdf", vim.log.levels.INFO)
              end)
            else
              vim.schedule(function()
                vim.notify("dvipdf conversion failed (exit " .. code2 .. ")", vim.log.levels.ERROR)
              end)
            end
          end
        })
      else
        vim.notify("LaTeX compilation failed", vim.log.levels.ERROR)
      end
    end,
  })
  if job <= 0 then vim.notify("Failed to start LaTeX job", vim.log.levels.ERROR) end
end

local function latex_view()
  local pdf = vim.fn.expand("%:r") .. ".pdf"
  if vim.fn.filereadable(pdf) == 1 then
    vim.fn.jobstart({ "vivaldi", pdf }, { detach = true })
  else
    vim.notify("PDF not found. Build first with <leader>ll", vim.log.levels.WARN)
  end
end

-- add mappings (your global_map helper already exists)
global_map("n", "<leader>ll", latex_build, { desc = "LaTeX: build (latex -> dvipdf)" })
global_map("n", "<leader>lv", latex_view, { desc = "LaTeX: view PDF" })

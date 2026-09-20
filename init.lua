vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        virtualtext = {
          auto_trigger_ft = {},
          keymap = {
            accept = "<Tab>",
            accept_line = "<A-a>",
            dismiss = "<A-e>",
            next = "<A-c>",
          },
        },
        provider = 'openai_compatible',
        request_timeout = 2.5,
        throttle = 1500,
        debounce = 600,
        provider_options = {
          openai_compatible = {
            api_key = 'OPENROUTER_API_KEY',
            end_point = 'https://openrouter.ai/api/v1/chat/completions',
            model = 'deepseek/deepseek-v4-flash',
            name = 'Openrouter',
            optional = {
              max_tokens = 128,
              top_p = 0.9,
              provider = {
                sort = 'throughput',
              },
              reasoning_effort = 'none'
            },
          },
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main", 
        dark_variant = "moon",
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  }
})

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')

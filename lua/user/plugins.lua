local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
   ----
   -- Packer and random dependencies
   use "wbthomason/packer.nvim"
   use "nvim-lua/popup.nvim"
   use "nvim-lua/plenary.nvim"
   use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
   })
   
   -- Colour schemes
   use 'folke/tokyonight.nvim'

   -- Comments
   use "numToStr/Comment.nvim"
    
   -- LSP
   use "williamboman/mason.nvim"
   use "williamboman/mason-lspconfig.nvim"
   use 'neovim/nvim-lspconfig' -- Configurations for Nvim L
   --
   -- Telescope
   use "nvim-telescope/telescope.nvim"
   use 'nvim-telescope/telescope-media-files.nvim'
   use "nvim-telescope/telescope-file-browser.nvim"
   use 'BurntSushi/ripgrep'

   -- Completion
   use "hrsh7th/nvim-cmp"
   use "hrsh7th/cmp-buffer"
   use "hrsh7th/cmp-path"
   use "hrsh7th/cmp-cmdline"
   use "hrsh7th/cmp-nvim-lsp"
   use "saadparwaiz1/cmp_luasnip"

   -- Snippets
   use "L3MON4D3/LuaSnip"
   use "rafamadriz/friendly-snippets"

   -- Which key
   use "folke/which-key.nvim"

   -- Tree sitter
   use {'nvim-treesitter/nvim-treesitter'} 
   use "ggandor/leap.nvim"

   -- Dashboard and sessions
   use "goolord/alpha-nvim"
 	use "Shatur/neovim-session-manager"
   
   use 'stevearc/dressing.nvim'
   -- Vimtex
   use "lervag/vimtex" -- essential for LaTeX; Vimscript
   use "kdheepak/cmp-latex-symbols"
   use "jbyuki/nabla.nvim" -- show symbols in editor

   -- Obsidian
   use ({"epwalsh/obsidian.nvim",
        --[[ event={ "BufReadPre /home/benjrise/Data/Obsidian/ml-notes/**.md" } ]]})

   -- Copilot
   -- use "github/copilot.vim"
   use { "zbirenbaum/copilot.lua" }
   -- Markdown previewer
   use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
   
  
   -- Automatically set up your configuration after cloning packer.nvim
   -- Put this at the end after all plugins
   use ({
     "jackMort/ChatGPT.nvim",
       requires = {
         "MunifTanjim/nui.nvim",
         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope.nvim"
       }
   })

   if PACKER_BOOTSTRAP then
    require("packer").sync()
   end
end)

-- Basic requirements
require "user.options"
require "user.keymaps"
require "user.plugins"

-- Dashboard and appearance
require "user.colorschemes"
require "user.alpha"
require "user.sessions"
require "user.dressing" -- Changes default plugins to use telescope 

-- Utilities
require "user.whichkey"
require "user.cmp"
require "user.comment"

-- IDE
require "user.treesitter"
require "user.telescope"
require "user.lsp"

-- Copilot
require "user.copilot"

-- Luasnip
require "user.luasnip"

-- Tex
require "user.vimtex"

-- Markdown 
require "user.markdown-preview"
-- For chatgpt copy and paste, replaces deafult formatting. (Note e is required here, otherwise if there is
-- no match the command stops running)
vim.cmd[[:call setreg("c", ":%s/\\\\( /$/ge\n:%s/ \\\\)/$/ge\n:%s/\\\\(/$/ge\n:%s/\\\\)/$/ge\n:%s/\\\\\\[/$$/ge\n:%s/\\\\\\]/$$/ge\n")]]



-- vim.cmd[[let @c=":%s/\\( /$/g\n:%s/ \\)/$/g\n"]]
-- vim.cmd[[let @d=":%s/\\( /$/g<CR>:%s/ \\)/$/g<CR>"]]
-- vim.cmd[[let @e=":norm :%s/\\( /$/g\\n:norm :%s/ \\)/g\\n"]]
-- Leap
-- require "user.leap"

-- Obsidian
-- require "user.obsidian"

-- ChatGPT
-- require "user.chatgpt"
--

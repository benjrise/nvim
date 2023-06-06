require("obsidian")
local opts = {
    notes_subdir = "/home/benjrise/Data/Obsidian/ml-notes/",
    -- daily_notes = {
    --   folder = "notes/dailies",
    --   date_format = "%Y-%m-%d"
    -- },

    completion = {
      nvim_cmp = true,  -- if using nvim-cmp, otherwise set to false
    },

    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    disable_frontmatter = false,
    note_frontmatter_func = function(note)
      local out = { date = note.date, id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    templates = {
      subdir = "Templates",
      date_format = "Do MMM YYYY",
      time_format = "%H:%M",
    },

    follow_url_func = function(url)
      vim.fn.jobstart({"open", url})  -- Mac OS
    end,
    use_advanced_uri = true,
    open_app_foreground = false,
    finder = "telescope.nvim",
}
require("obsidian").setup(opts)

local M = {}

M.auto_update = true -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
M.neovim_image_text = "The Superior Text Editor!" -- Text displayed when hovered over the Neovim image
M.main_image = "neovim" -- Main image display (either "neovim" or "file")
M.client_id = "793271441293967371" -- Use your own Discord application client id (not recommended)
M.log_level = nil -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
M.debounce_timeout = 10 -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
M.enable_line_number = true -- Displays the current line number instead of the current project
M.blacklist = {} -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
M.buttons = true -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
M.file_assets = {} -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
M.show_time = true -- Show the timer

-- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
M.editing_text        = "Editing some file..."
-- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
M.file_explorer_text  = "Browsing some directory..."
-- Format string rendered when committing changes in git (either string or function(filename: string): string)
M.git_commit_text     = "Committing changes..."
-- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
M.plugin_manager_text = "Managing plugins..."
-- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
M.reading_text        = "Reading some file..."
-- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
M.workspace_text      = "Working on %s"
-- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
M.line_number_text    = "Line %s out of %s"

require("presence").setup(M)

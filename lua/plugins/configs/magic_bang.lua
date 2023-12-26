local M = {}
M.bins = {
  awk = "awk",
  hs = "runhaskell",
  jl = "julia",
  lua = "lua",
  m = "octave",
  mak = "make",
  php = "php",
  pl = "perl",
  py = "python3",
  r = "Rscript",
  rb = "ruby",
  scala = "scala",
  sh = "bash",
  tcl = "tclsh",
  tk = "wish",
}

M.automatic = true         -- insert shebang on new file when in $PATH
M.command = true           -- define Bang user command
M.executable = true        -- make file executable on exit
M.default = "/bin/bash"     -- default shebang for `:Bang` without args

require("magic-bang").setup(M)

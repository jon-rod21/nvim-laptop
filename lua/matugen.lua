 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#0f1416',
    base01 = '#1b2022',
    base02 = '#262b2d',
    base03 = '#879397',
    base04 = '#bdc8cd',
    base05 = '#dfe3e5',
    base06 = '#dfe3e5',
    base07 = '#dfe3e5',
    base08 = '#ffb4ab',
    base09 = '#e6b4ff',
    base0A = '#a7cdda',
    base0B = '#69d4f3',
    base0C = '#e6b4ff',
    base0D = '#69d4f3',
    base0E = '#a7cdda',
    base0F = '#c2e9f6',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#dfe3e5',          bg = '#0f1416' })
  hi('TelescopeBorder',         { fg = '#879397',             bg = '#0f1416' })
  hi('TelescopePromptNormal',   { fg = '#dfe3e5',          bg = '#0f1416' })
  hi('TelescopePromptBorder',   { fg = '#879397',             bg = '#0f1416' })
  hi('TelescopePromptPrefix',   { fg = '#69d4f3',             bg = '#0f1416' })
  hi('TelescopePromptCounter',  { fg = '#bdc8cd',  bg = '#0f1416' })
  hi('TelescopePromptTitle',    { fg = '#0f1416',             bg = '#69d4f3' })
  hi('TelescopePreviewTitle',   { fg = '#0f1416',             bg = '#a7cdda' })
  hi('TelescopeResultsTitle',   { fg = '#0f1416',             bg = '#e6b4ff' })
  hi('TelescopeSelection',      { fg = '#dfe3e5',          bg = '#262b2d' })
  hi('TelescopeSelectionCaret', { fg = '#69d4f3',             bg = '#262b2d' })
  hi('TelescopeMatching',       { fg = '#69d4f3',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M

local wezterm = require 'wezterm'

local function select_random_backdrop(folder_path)
  local images = {}
  for _, ext in ipairs { "jpg", "jpeg", "png" } do
    local pattern = folder_path .. "/*." .. ext
    for _, file in ipairs(wezterm.glob(pattern) or {}) do
      table.insert(images, file)
    end
  end

  if #images == 0 then
    error("No images found in folder: " .. folder_path)
  end

  local random_index = math.random(1, #images)
  return images[random_index]
end

-- Seed the RNG once per session
math.randomseed(os.time())

-- Cross-platform home path
local home = wezterm.home_dir

-- Use correct separator for Windows
local sep = package.config:sub(1,1) == "\\" and "\\" or "/"
local folder = home .. sep .. ".config" .. sep .. "wezterm" .. sep .. "backdrops"


local config = {}

local triple = wezterm.target_triple or ""

if triple:find("windows") then
  config = require 'wezterm_win'
elseif triple:find("apple") or triple:find("darwin") or triple:find("macos") then
  config = require 'wezterm_mac'
elseif triple:find("linux") then
  config = require 'wezterm_linux'  -- if you have one
else
  -- fallback
  config = {}
end

config.window_background_image = select_random_backdrop(folder)
return config


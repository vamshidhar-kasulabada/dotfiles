local function select_random_backdrop(folder_path)
    -- Open the folder
    local handle = io.popen('ls "' .. folder_path .. '"') -- Use 'dir' on Windows
    if not handle then
        error("Unable to open folder: " .. folder_path)
    end

    -- Read all filenames into a table
    local files = {}
    for file in handle:lines() do
        if file:match("%.png$") or file:match("%.jpg$") or file:match("%.jpeg$") then
            table.insert(files, file)
        end
    end
    handle:close()

    -- Check if files were found
    if #files == 0 then
        error("No images found in folder: " .. folder_path)
    end

    -- Select a random file
    local random_index = math.random(1, #files)
    return folder_path .. "/" .. files[random_index]
end

-- Example usage
math.randomseed(os.time()) -- Seed the random number generator
local folder = "/Users/vamshidhar/dotfiles/.config/wezterm/backdrops" -- Replace with your folder path
local selected_backdrop = select_random_backdrop(folder)
return selected_backdrop;


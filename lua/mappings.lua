local map = vim.keymap.set

map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>")

-- nvimtree
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- format
map("n", "<leader>fm", function()
  require("conform").format()
end)

-- Themery
map("i", "<C-\\>", "<cmd> Themery <CR>")

vim.api.nvim_set_keymap('n', '<Leader>th', ':split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>tv', ':vsplit | terminal<CR>', { noremap = true, silent = true })

local function move_line_up()
  vim.cmd('move .-2')
end

local function move_line_down()
  vim.cmd('move .+1')
end

local function select_lines_up()
  vim.api.nvim_input('<Esc><S-v><Up>')
  vim.api.nvim_input('gi')
end

local function select_lines_down()
  vim.api.nvim_input('<Esc><S-v><Down>')
  vim.api.nvim_input('gi')
end

-- Key bindings for insert mode
vim.api.nvim_set_keymap('i', '<A-Up>', '', { noremap = true, silent = true, callback = move_line_up })
vim.api.nvim_set_keymap('i', '<A-Down>', '', { noremap = true, silent = true, callback = move_line_down })
vim.api.nvim_set_keymap('i', '<C-Up>', '', { noremap = true, silent = true, callback = select_lines_up })
vim.api.nvim_set_keymap('i', '<C-Down>', '', { noremap = true, silent = true, callback = select_lines_down })

-- neorg 
local neorg_leader = "<leader>n" -- Set a leader key for Neorg mappings

vim.keymap.set("n", neorg_leader .. "w", "<cmd>Neorg workspace notes<CR>", { desc = "Switch to Neorg workspace" })
vim.keymap.set("n", neorg_leader .. "n", "<cmd>Neorg index<CR>", { desc = "Open Neorg index" })
vim.keymap.set("n", neorg_leader .. "t", "<cmd>Neorg toggle-concealer<CR>", { desc = "Toggle concealer" })
vim.keymap.set("n", neorg_leader .. "h", "<cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_toggle<CR>", { desc = "Toggle TODO state" })
vim.keymap.set("n", neorg_leader .. "c", "<cmd>Neorg toggle-concealer<CR>", { desc = "Toggle concealer visibility" })


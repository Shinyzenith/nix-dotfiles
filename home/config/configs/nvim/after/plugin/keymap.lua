function flash_jump()
	require("flash").jump({
	  search = {
		mode = function(str)
		  return "\\<" .. str
		end,
	  },
	})
end

-- nnoremaps
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("n", "<C-G>", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<C-b>", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<C-e>", "<cmd>Telescope diagnostics<CR>")
vim.keymap.set("n", "<C-n>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "cc", "<plug>NERDCommenterToggle")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>s", "<cmd>:w !sudo tee %<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>p", "\"*yy")
vim.keymap.set("n", "<leader>t", "<cmd>terminal<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd>Ex<CR>")
vim.keymap.set("n", "s", flash_jump)

-- tnoremaps
vim.keymap.set("t", "<C-b>", "<cmd>Telescope buffers<CR>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-n>", "<cmd>tabnext<CR>")
vim.keymap.set("t", "<C-p>", "<cmd>tabprev<CR>")

-- vnoremaps
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "<leader>p", "\"*y")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "cc", "<plug>NERDCommenterToggle")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gvi'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gvi'")

vim.keymap.set("x", "s", flash_jump)
vim.keymap.set("o", "s", flash_jump)

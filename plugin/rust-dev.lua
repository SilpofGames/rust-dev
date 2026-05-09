if vim.g.loaded_rust_dev == 1 then return end
vim.g.loaded_rust_dev = 1

vim.api.nvim_create_user_command("RustInitProject", function() require("rust-dev.runner").init_project() end, {})
vim.api.nvim_create_user_command("RustRun", function() require("rust-dev.runner").run() end, {})
vim.api.nvim_create_user_command("RustBuild", function() require("rust-dev.runner").build() end, {})
vim.api.nvim_create_user_command("RustLint", function() require("rust-dev.runner").lint() end, {})
vim.api.nvim_create_user_command("RustFormat", function() require("rust-dev.runner").format() end, {})

local M = {}

function M.init_project()
  vim.notify("Initializing Cargo project...", vim.log.levels.INFO)
  vim.fn.system("cargo init")
  vim.notify("Rust Cargo project initialized!", vim.log.levels.INFO)
end

function M.run()
  local dir = vim.fn.getcwd()
  if vim.fn.filereadable(dir .. "/Cargo.toml") == 1 then
    vim.cmd("split | terminal cargo run")
    vim.cmd("startinsert")
  else
    local file = vim.fn.expand("%:p")
    local cmd = string.format("rustc %s && ./%s", vim.fn.shellescape(file), vim.fn.expand("%:t:r"))
    vim.cmd("split | terminal " .. cmd)
    vim.cmd("startinsert")
  end
end

function M.build()
  local dir = vim.fn.getcwd()
  if vim.fn.filereadable(dir .. "/Cargo.toml") == 1 then
    vim.cmd("split | terminal cargo build")
  else
    local file = vim.fn.expand("%:p")
    vim.cmd("split | terminal rustc " .. vim.fn.shellescape(file))
  end
end

function M.lint()
  vim.cmd("split | terminal cargo clippy")
end

function M.format()
  vim.fn.system("cargo fmt")
  vim.cmd("edit!")
  vim.notify("Rust project formatted!", vim.log.levels.INFO)
end

return M

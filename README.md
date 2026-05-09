# rust-dev.nvim

A Neovim plugin for Rust development. Build, run, lint and format Rust projects with Cargo.

## Install with silzy.nvim

```lua
use { "SilpofGames/rust-dev.nvim",
  config = function()
    require("rust-dev").setup()
  end,
}
use { "neovim/nvim-lspconfig",
  config = function()
    require("lspconfig").rust_analyzer.setup({
      settings = {
        ["rust-analyzer"] = { checkOnSave = { command = "clippy" } },
      },
    })
  end,
}
```

## Commands

| Command | Description |
|---------|-------------|
| `:RustInitProject` | Initialize a new Cargo project with `cargo init` |
| `:RustRun` | Run with `cargo run` or compile a single file |
| `:RustBuild` | Build with `cargo build` |
| `:RustLint` | Lint with `cargo clippy` |
| `:RustFormat` | Format with `cargo fmt` |

## Requirements

- Rust toolchain (`rustup`)
- `rust-analyzer` LSP (`rustup component add rust-analyzer`)

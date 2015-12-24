# My Emacs Config

A Refresh of my [emacs config](https://github.com/scottaj/emacs-config/tree/updates) using native emacs packages instead of el-get.

## Javascript
Uses js2-mode, flycheck and tern.

You need to `npm instal -g tern` in order to use that for completion.

## Rust
Uses flycheck and racer. You need to use cargo to install racer somewhere on your path, and also have a source checkout of rust pointed to by the `RUST_SRC_PATH` environment variable to get smart completion.

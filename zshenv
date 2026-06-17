# add homebrew directory to path
if [[ -d /opt/homebrew/bin ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# add rust toolchain to path
if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

# When cask installing emacs packages, ensure lsp-mode built with faster plist support
export LSP_USE_PLISTS=true

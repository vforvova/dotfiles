set -x EDITOR 'vim'
set -x LANG 'en_US.UTF-8'
set -x LC_ALL 'en_US.UTF-8'

#  Fisher autoinstallation
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end


if not set -q IS_INSTALLED
  add_to_path "/usr/local/bin"
  add_to_path "/usr/local/opt/gettext/bin"
  set -U IS_INSTALLED true
end

# N
if type -q n
  set -x N_PREFIX $HOME/n

  if not set -q N_IS_INSTALLED
    add_to_path $N_PREFIX/bin
    set -U N_IS_INSTALLED true
  end
end

# Node
if type -q node
  set -x NPM_PACKAGES $HOME/.npm-packages

  if not set -q NODE_IS_INSTALLED
    add_to_path $NODE_PACKAGES/bin
    set -U NODE_IS_INSTALLED true
  end
end

# Golang
if type -q go
  set -x GO111MODULE on
  set -x GOPATH $HOME/Projects/.go

  if not set -q GO_IS_INSTALLED
    add_to_path $GOPATH/bin
    add_to_path /usr/local/opt/go/libexec/bin
    set -U GO_IS_INSTALLED true
  end   
end

# Rust
if type -q go
  set -x CARGO_HOME $HOME/.cargo
  set -x RUSTUP_HOME $HOME/.rustup

  if not set -q RUST_IS_INSTALLED
    add_to_path $CARGO_HOME/bin
    set -U RUST_IS_INSTALLED true
  end   
end

if not set -q fish_user_abbreviations
  source $HOME/.config/fish/abbreviations.fish
end

function add_to_path --description "Persistently prepends to your PATH via fish_user_paths"
  if not contains $argv $fish_user_paths
    printf "Add to path $argv\n"
    set --universal fish_user_paths $argv $fish_user_paths
  end
end

# Examples
#
# add_to_path "/usr/local/bin"
# add_to_path "/usr/local/opt/gettext/bin"
#
# N ==========================================
# if type -q n
#   set -x N_PREFIX $HOME/n
#   add_to_path $N_PREFIX/bin
# end
#
# Node =======================================
# if type -q node
#   set -x NPM_PACKAGES $HOME/.npm-packages
#   add_to_path $NODE_PACKAGES/bin
# end
#
# Golang =====================================
# if type -q go
#   set -x GO111MODULE on
#   set -x GOPATH $HOME/Projects/.go
#   add_to_path $GOPATH/bin
#   add_to_path /usr/local/opt/go/libexec/bin
# end
#
# Rust =======================================
# if type -q go
#   set -x CARGO_HOME $HOME/.cargo
#   set -x RUSTUP_HOME $HOME/.rustup
#   add_to_path $CARGO_HOME/bin
# end

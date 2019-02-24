set -x EDITOR 'vim'
set -x LANG 'en_US.UTF-8'
set -x LC_ALL 'en_US.UTF-8'

# N
if type -q n
  set -x N_PREFIX $HOME/n
  add_to_path $N_PREFIX/bin
end

# Node
if type -q node
  set -x NPM_PACKAGES $HOME/.npm-packages
  add_to_path $NODE_PACKAGES/bin
end

# Golang
if type -q go
  set -x GOPATH $HOME/Projects/.go
  add_to_path $GOPATH/bin
  add_to_path /usr/local/opt/go/libexec/bin
end

add_to_path "/usr/local/opt/gettext/bin"

if not set -q fish_user_abbreviations
  source ./abbreviations.fish
end

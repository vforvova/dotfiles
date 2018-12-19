set -g EDITOR 'vim'
set -g LC_ALL 'en_US.UTF-8'

# N
if type -q n
  set -x N_PREFIX $HOME/n
  add_to_path $N_PREFIX/bin
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

set -g EDITOR 'vim'
set -g LC_ALL 'en_US.UTF-8'

set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths

if not set -q fish_user_abbreviations
  source ./abbreviations.fish
end

set -x EDITOR 'vim'
set -x LANG 'en_US.UTF-8'
set -x LC_ALL 'en_US.UTF-8'

#  Fisher autoinstallation
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

if not set -q fish_user_abbreviations
  source $HOME/.config/fish/abbreviations.fish
end

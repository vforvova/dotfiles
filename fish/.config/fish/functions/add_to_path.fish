function add_to_path --description "Persistently prepends to your PATH via fish_user_paths"
  if not contains $argv $fish_user_paths
    printf "Add to path $argv\n"
    set --universal fish_user_paths $argv $fish_user_paths
  end
end

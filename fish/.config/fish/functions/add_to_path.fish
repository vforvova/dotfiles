function add_to_path --description "Persistently prepends to your PATH via fish_user_paths"
  for path in $argv
    if not contains $path $fish_user_paths
      printf "Add to path $path\n"
      set --universal fish_user_paths $path $fish_user_paths
    end
  end
end

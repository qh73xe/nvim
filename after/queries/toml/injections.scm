;; extends
((pair
  (bare_key) @_key
  (string) @vim)
 (#vim-match? @_key "^hook_\w*")
 (#vim-match? @vim "^('''|\"\"\")")
 (#offset! @vim 0 3 0 -3))
((pair
  (bare_key) @_key
  (string) @vim)
 (#vim-match? @_key "^hook_\w*")
 (#vim-match? @vim "^('[^']|\"[^\"])")
 (#offset! @vim 0 1 0 -1))
((pair
  (bare_key) @_key
  (string) @lua)
 (#vim-match? @_key "^lua_\w*")
 (#vim-match? @lua "^('''|\"\"\")")
 (#offset! @lua 0 3 0 -3))
((pair
  (bare_key) @_key
  (string) @lua)
 (#vim-match? @_key "^lua_\w*")
 (#vim-match? @lua "^('[^']|\"[^\"])")
 (#offset! @lua 0 1 0 -1))
((table
  (dotted_key) @_key
  (pair
   (string) @vim))
 (#vim-match? @_key "^%(plugins\.)?ftplugin$")
 (#vim-match? @vim "^('''|\"\"\")")
 (#offset! @vim 0 3 0 -3))
((table
  (dotted_key) @_key
  (pair
   (string) @vim))
 (#vim-match? @_key "^%(plugins\.)?ftplugin$")
 (#vim-match? @vim "^('[^']|\"[^\"])")
 (#offset! @vim 0 1 0 -1))

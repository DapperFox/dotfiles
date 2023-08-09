if filereadable(expand("\~/.config/nvim/config/plugins-new.vim"))
  source \~/.config/nvim/config/plugins-new.vim
endif

if filereadable(expand("\~/.config/nvim/config/general.vim"))
  source \~/.config/nvim/config/general.vim
endif

if filereadable(expand("\~/.config/nvim/config/shortcut-mapping.vim"))
  source \~/.config/nvim/config/shortcut-mapping.vim
endif

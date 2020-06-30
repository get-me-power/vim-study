scriptencoding utf-8
let s:suite = themis#suite('vimrc_test')
let s:assert = themis#helper('assert')

function! s:suite.installed_plugin_list()
  call s:assert.match(join(g:plugin_list, "/"), 'vim-airline')
  call s:assert.match(join(g:plugin_list, "/"), 'vim-airline-themes')
  call s:assert.match(join(g:plugin_list, "/"), 'gina.vim')
  call s:assert.match(join(g:plugin_list, "/"), 'vim-fugitive')
  call s:assert.match(join(g:plugin_list, "/"), 'fzf.vim')
  call s:assert.match(join(g:plugin_list, "/"), 'vim-easymotion')
endfunction

function! s:suite.install_plugin()
  :Plug 'mattn/vim-sl'
  :PlugInstall | q
  let g:plugin_list = Plugin_list()
  call s:assert.match(join(g:plugin_list, "/"), 'vim-sl')
endfunction

scriptencoding utf-8
let s:suite = themis#suite('vimrc_test')
let s:assert = themis#helper('assert')

function! s:suite.plugin_list()
  :so $TRAVIS_BUILD_DIR/vimrc
  :PlugInstall | q
  echo Plugin_list()
  let g:plugin_list = Plugin_list()
  " pluggedディレクトリに入っているpluginをチェック（アルファベット順に並ぶ）
  call s:assert.equals(g:plugin_list[0], 'fzf.vim')
  call s:assert.equals(g:plugin_list[1], 'gina.vim')
  call s:assert.equals(g:plugin_list[2], 'vim-airline')
  call s:assert.equals(g:plugin_list[3], 'vim-airline-themes')
  call s:assert.equals(g:plugin_list[4], 'vim-easymotion')
  call s:assert.equals(g:plugin_list[5], 'vim-fugitive')
endfunction

function! Plugin_list()
  let plugin_list= split(glob(g:plug_home .'/*'), "\n")
  call map(plugin_list, 'fnamemodify(v:val, ":t")')
  return plugin_list
endfunction

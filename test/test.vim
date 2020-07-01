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
  call s:assert.match(join(g:plugin_list, "/"), 'vim-polyglot')
  call s:assert.match(join(g:plugin_list, "/"), 'vim-cursorword')
endfunction

function! s:suite.check_airline_runtime()
  call s:assert.match(&runtimepath, 'vim-airline')
  call s:assert.match(&runtimepath, 'vim-airline-themes')
endfunction


function! s:suite.check_gina_runtime()
  call s:assert.match(&runtimepath, 'gina.vim')
endfunction

function! s:suite.exist_fugitive_command()
  call s:assert.match(&runtimepath, 'vim-fugitive')
endfunction

function! s:suite.check_easymotion_runtime()
  call s:assert.match(&runtimepath, 'easymotion')
endfunction

function! s:suite.check_polyglot()
  call s:assert.match(&runtimepath, 'polyglot')
endfunction

function! s:suite.check_fzf_runtime()
  call s:assert.match(&runtimepath, 'fzf.vim')
  call s:assert.match(&runtimepath, 'fzf')
endfunction

function! s:suite.check_cursorword_runtime()
  call s:assert.match(&runtimepath, 'cursorword')
endfunction

function! s:suite.fail_check()
  call s:assert.not_match(&runtimepath, 'vim-plug')
endfunction


function! s:suite.install_plugin()
  :Plug 'mattn/vim-sl'
  :PlugInstall | q
  let g:plugin_list = Plugin_list()
  call s:assert.match(join(g:plugin_list, "/"), 'vim-sl')
endfunction

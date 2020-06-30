scriptencoding utf-8

function! s:test_run()
  let v:errors = []
  try
    call plug#begin($TRAVIS_BUILD_DIR . '/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    call plug#end()
    :PlugInstall
    call assert_equal(2, exists(':Plug'))
    let plugin_list = s:s:plugin_list
    call assert_equal('vim-airline', plugin_list[0])
    call assert_equal('vim-airline-themes', plugin_list[0])
  catch
    execute 'cq!'
  endtry
  if len(v:errors) >= 1
    echo v:errors
    " error exit
    execute 'qall!'
  endif
  echo 'test success'
  execute 'qall!'
endfunction

function s:plugin_list()
  let plugin_list = []
  let files = split(globpath(&rtp, $TRAVIS_BUILD_DIR . 'plugged'), "\n")
  call map(files, 'fnamemodify(v:val, ":t")')
  for plug in files
    call add(plugin_list, plug)
  endfor
  return plugin_list
endfunction
command -nargs=0 PluginList call s:PluginList()

call s:test_run()

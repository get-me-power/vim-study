scriptencoding utf-8

function! s:test_run()
  let v:errors = []
  try
    call assert_equal(2, exists(':Plug'))
    call plug#begin($TRAVIS_BUILD_DIR . '/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    call plug#end()
    :PlugInstall
  catch
    execute 'cq!'
  endtry
  if len(v:errors) >= 1
    echo v:errors
    " error exit
    execute 'cq!'
  endif
  echo 'test success'
  execute 'qall!'
endfunction

call s:test_run()

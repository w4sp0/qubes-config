" SPDX-FileCopyrightText: 2026 Radek Janik <cyberwassp@gmail.com>
"
" SPDX-License-Identifier: AGPL-3.0-or-later
"
" Read the offline documentation with 'devdoc'. In Go, Rust, Python, C and
" Elixir buffers, 'K' shows the documentation of the name under the cursor,
" including its qualifier, such as 'fmt.Println' or 'Vec::push'.
"
"   :Doc [TOPIC]   documentation of TOPIC, or of the name under the cursor
"   :DocBrowse     HTML manual of the language of the buffer

if exists('g:loaded_devdoc') || !executable('devdoc')
  finish
endif
let g:loaded_devdoc = 1

let s:filetypes = ['go', 'rust', 'python', 'c', 'cpp', 'elixir', 'eelixir',
      \ 'heex']

" The name under the cursor with its '.', '::' and '/' qualifiers.
function! s:Word() abort
  let l:chars = '[[:alnum:]_.:/?!]'
  let l:word = matchstr(getline('.'),
        \ l:chars . '*\%' . col('.') . 'c' . l:chars . '*')
  return substitute(l:word, '^[.:/]\+\|[.:/]\+$', '', 'g')
endfunction

function! s:Doc(browse, topic) abort
  let l:args = a:browse ? ['-b', &filetype] : [&filetype]
  if !a:browse
    call add(l:args, empty(a:topic) ? s:Word() : a:topic)
  endif
  execute '!devdoc ' . join(map(l:args, 'shellescape(v:val, 1)'))
endfunction

command! -nargs=? Doc call s:Doc(0, <q-args>)
command! -nargs=0 DocBrowse call s:Doc(1, '')

augroup devdoc
  autocmd!
  execute 'autocmd FileType ' . join(s:filetypes, ',')
        \ . ' nnoremap <buffer> <silent> K :Doc<CR>'
augroup END

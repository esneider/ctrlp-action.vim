"  Toggle Options

Recipe ':set wrap!<CR>'       'Word Wrap: Toggle'
Recipe ':set spell!<CR>'      'Spell Checking: Toggle'
Recipe ':set list!<CR>'       'Show Invisible Characters: Toggle'
Recipe ':set number!<CR>'     'Line Numbers: Toggle'
Recipe ':set cursorline!<CR>' 'Show Cursor Line: Toggle'

"  Misc Options

Recipe ':set vb t_vb=<CR>'     'Error Bell: Disable'
Recipe ':set mouse=a<CR>'      'Mouse: Enable'
Recipe ':set backspace=2<CR>'  'Backspace: Work in Insert Mode'
Recipe ':set laststatus=2<CR>' 'Status Line: Show'
Recipe ':set t_Co=256<CR>'     'Colors: Force 256 Colors'
Recipe ':set clipboard=unnamed,unnamedplus<CR>' 'Clipboard: Use System Clipboard'

"  Indentation

Recipe ':set expandtab<CR>'   'Indentation: Use Tabs'
Recipe ':set noexpandtab<CR>' 'Indentation: Use Spaces'
Recipe ':retab<CR>'           'Indentation: Reindent'

"  Encoding

Recipe ':set encoding=utf-8<CR>'  'Encoding: utf-8'
Recipe ':set encoding=utf-16<CR>' 'Encoding: utf-16'
Recipe ':set encoding=latin1<CR>' 'Encoding: latin1'

"  Convert Case

Recipe 'VU'   'Convert Case: Upper Case Current Line'
Recipe 'Vu'   'Convert Case: Lower Case Current Line'
Recipe 'viwU' 'Convert Case: Upper Case Current Word'
Recipe 'viwu' 'Convert Case: Lower Case Current Word'
Recipe 'V~'   'Convert Case: Swap Case Current Line'
Recipe 'viw~' 'Convert Case: Swap Case Current Word'

"  Tab Width

Recipe ':set sw=1 sts=1 ts=1<CR>' 'Tab Width: 1'
Recipe ':set sw=2 sts=2 ts=2<CR>' 'Tab Width: 2'
Recipe ':set sw=4 sts=4 ts=4<CR>' 'Tab Width: 4'
Recipe ':set sw=8 sts=8 ts=8<CR>' 'Tab Width: 8'

"  File

Recipe ':w<CR>'         'File: Save'
Recipe ':wa<CR>'        'File: Save All'
Recipe ':wq<CR>'        'File: Save and Close'
Recipe ':q!<CR>'        'File: Close Without Saving'
Recipe ':wqa<CR>'       'File: Save All and Close'
Recipe ':qa!<CR>'       'File: Close All Without Saving'
Recipe ':saveas<Space>' 'File: Save As'
Recipe ':e<Space>'      'File: Open File'

"  Search

Recipe 'n' 'Search Results: Next'
Recipe 'N' 'Search Results: Previous'
Recipe '/' 'Search'
Recipe '?' 'Search Backward'
Recipe '*' 'Search: Current Word'
Recipe '#' 'Search Backward: Current Word'
Recipe ':nohlsearch<CR>' 'Search Results: Clear Highlighting'

"  Tabs

Recipe 'gt'  'Tab: Next'
Recipe 'gT'  'Tab: Previous'
Recipe '1gt' 'Tab: Go To Tab 1'
Recipe '2gt' 'Tab: Go To Tab 2'
Recipe '3gt' 'Tab: Go To Tab 3'
Recipe '4gt' 'Tab: Go To Tab 4'
Recipe '5gt' 'Tab: Go To Tab 5'
Recipe '6gt' 'Tab: Go To Tab 6'
Recipe '7gt' 'Tab: Go To Tab 7'
Recipe '8gt' 'Tab: Go To Tab 8'
Recipe '9gt' 'Tab: Go To Tab 9'
Recipe ':tabnew<CR>' 'Tab: New'

"  Folding

Recipe 'zo' 'Fold: Open'
Recipe 'zc' 'Fold: Close'
Recipe 'za' 'Fold: Toggle'
Recipe 'zR' 'Fold: Open All'
Recipe 'zM' 'Fold: Close All'
Recipe 'zj' 'Fold: Next'
Recipe 'zk' 'Fold: Previous'

"  Spell

Recipe 'z=' 'Spell Checking: Correct'
Recipe 'zg' 'Spell Checking: Add Current Word To Dictionary'

"  Vim

Recipe ':e $MYVIMRC<CR>' 'Vim: Edit Vimrc'
Recipe ':version<CR>'    'Vim: Version'
Recipe ':help<CR>'       'Vim: Help'
Recipe ':xa<CR>'         'Vim: Save and Exit'
Recipe ':xa<CR>'         'Vim: Save and Quit'
Recipe ':xa!<CR>'        'Vim: Exit'
Recipe ':xa!<CR>'        'Vim: Quit'

"  History

Recipe 'u'     'History: Undo'
Recipe '<C-r>' 'History: Redo'

"  Text Edition

Recipe 'ggdG' 'Delete Entire File'
Recipe 'dd'   'Delete Current Line'
Recipe 'diw'  'Delete Current Word'
Recipe 'o'    'Insert Line After'
Recipe 'o'    'Insert Line Below'
Recipe 'O'    'Inset Line Before'
Recipe 'O'    'Insert Line Above'

"  Movements

Recipe 'gg' 'Go To: Beginning Of File'
Recipe 'G'  'Go To: End Of File'
Recipe 'w'  'Go To: Next Word'
Recipe 'b'  'Go To: Previous Word'
Recipe 'b'  'Go To: Beginning Of Word'
Recipe 'e'  'Go To: End Of Word'
Recipe ')'  'Go To: Next Sentence'
Recipe '('  'Go To: Previous Sentence'
Recipe '}'  'Go To: Next Paragraph'
Recipe '{'  'Go To: Previous Paragraph'
Recipe '^'  'Go To: Beginning Of Line'
Recipe '$'  'Go To: End Of Line'

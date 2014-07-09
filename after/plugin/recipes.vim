RecipeSection() " Boolean Options

Recipe(':set wrap<CR>', 'Enable: Word Wrap', "'wrap'")
Recipe(':set wrap!<CR>', 'Toggle: Word Wrap', "'wrap'")
Recipe(':set nowrap<CR>', 'Disable: Word Wrap', "'nowrap'")

Recipe(':set spell<CR>', 'Enable: Spell Checking', "'spell'")
Recipe(':set spell!<CR>', 'Toggle: Spell Checking', "'spell'")
Recipe(':set nospell<CR>', 'Disable: Spell Checking', "'nospell'")

Recipe(':set list<CR>', 'Enable: Invisible Characters', "'list'")
Recipe(':set list!<CR>', 'Toggle: Invisible Characters', "'list'")
Recipe(':set nolist<CR>', 'Disable: Invisible Characters', "'nolist'")

Recipe(':set nu<CR>', 'Enable: Line Numbers', "'number'")
Recipe(':set nu!<CR>', 'Toggle: Line Numbers', "'number'")
Recipe(':set nonu<CR>', 'Disable: Line Numbers', "'nonumber'")

Recipe(':set rnu<CR>', 'Enable: Relative Line Numbers', "'relativenumber'")
Recipe(':set rnu!<CR>', 'Toggle: Relative Line Numbers', "'relativenumber'")
Recipe(':set nornu<CR>', 'Disable: Relative Line Numbers', "'norelativenumber'")

Recipe(':set cul<CR>', 'Enable: Highlight Cursor Line', "'cursorline'")
Recipe(':set cul!<CR>', 'Toggle: Highlight Cursor Line', "'cursorline'")
Recipe(':set nocul<CR>', 'Disable: Highlight Cursor Line', "'nocursorline'")

Recipe(':set cuc<CR>', 'Enable: Highlight Cursor Column', "'cursorcolumn'")
Recipe(':set cuc!<CR>', 'Toggle: Highlight Cursor Column', "'cursorcolumn'")
Recipe(':set nocuc<CR>', 'Disable: Highlight Cursor Column', "'nocursorcolumn'")

Recipe(':set hls<CR>', 'Enable: Highlight Search Results', "'hlsearch'")
Recipe(':set hls!<CR>', 'Toggle: Highlight Search Results', "'hlsearch'")
Recipe(':set nohls<CR>', 'Disable: Highlight Search Results', "'nohlsearch'")

Recipe(':set ic<CR>', 'Enable: Case Insensitive Search', "'ignorecase'")
Recipe(':set ic!<CR>', 'Toggle: Case Insensitive Search', "'ignorecase'")
Recipe(':set noic<CR>', 'Disable: Case Insensitive Search', "'noignorecase'")

Recipe(':set bin<CR>', 'Enable: Edit Binary File', "'binary'")
Recipe(':set bin!<CR>', 'Toggle: Edit Binary File', "'binary'")
Recipe(':set nobin<CR>', 'Disable: Edit Binary File', "'nobinary'")

Recipe(':set bomb<CR>', 'Enable: Use BOM', "'bomb'")
Recipe(':set bomb!<CR>', 'Toggle: Use BOM', "'bomb'")
Recipe(':set nobomb<CR>', 'Disable: Use BOM', "'nobomb'")

Recipe(':set paste<CR>', 'Enable: Paste Mode', "'paste'")
Recipe(':set paste!<CR>', 'Toggle: Paste Mode', "'paste'")
Recipe(':set nopaste<CR>', 'Disable: Paste Mode', "'nopaste'")

RecipeSection() " Misc Options

Recipe(':set mouse=a<CR>', 'Enable: Mouse', "'mouse'")
Recipe(':set mouse=<CR>', 'Disable: Mouse', "'mouse'")

Recipe(':set ls=2<CR>', 'Enable: Status Line', "'laststatus'")
Recipe(':set ls=0<CR>', 'Disable: Status Line', "'laststatus'")

Recipe(':set ls=2<CR>', 'Show: Status Line', "'laststatus'")
Recipe(':set ls=0<CR>', 'Hide: Status Line', "'laststatus'")

Recipe(':set ff=dos<CR>', 'Use Windows Newlines', "'fileformat'")
Recipe(':set ff=unix<CR>', 'Use Unix Newlines', "'fileformat'")

Recipe(':set bs=2<CR>', 'Enable: Backspace in Insert Mode', "'backspace'")
Recipe(':set t_Co=256<CR>', 'Enable: 256 Colors in Terminal', "'t_Co'")
Recipe(':set vb t_vb=<CR>', 'Disable: Error Bell', "'visualbell'")

Recipe(':set cb=unnamed,unnamedplus<CR>', 'Use Operating System Clipboard', "'clipboard'")
Recipe(':set keymodel=startsel,stopsel<CR>', 'Use Shift to Select Text', "'keymodel'")

RecipeSection('Filetype')

Recipe(':set ft=c<CR>', 'C', "'filetype'")
Recipe(':set ft=clojure<CR>', 'Clojure', "'filetype'")
Recipe(':set ft=cpp<CR>', 'C++', "'filetype'")
Recipe(':set ft=cs<CR>', 'C#', "'filetype'")
Recipe(':set ft=css<CR>', 'CSS', "'filetype'")
Recipe(':set ft=fortran<CR>', 'Fortran', "'filetype'")
Recipe(':set ft=go<CR>', 'Go', "'filetype'")
Recipe(':set ft=haskell<CR>', 'Haskell', "'filetype'")
Recipe(':set ft=html<CR>', 'HTML', "'filetype'")
Recipe(':set ft=java<CR>', 'Java', "'filetype'")
Recipe(':set ft=javascript<CR>', 'JavaScript', "'filetype'")
Recipe(':set ft=lisp<CR>', 'Lisp', "'filetype'")
Recipe(':set ft=lua<CR>', 'Lua', "'filetype'")
Recipe(':set ft=make<CR>', 'Makefile', "'filetype'")
Recipe(':set ft=matlab<CR>', 'Matlab', "'filetype'")
Recipe(':set ft=objc<CR>', 'Objective C', "'filetype'")
Recipe(':set ft=ocaml<CR>', 'OCaml', "'filetype'")
Recipe(':set ft=pascal<CR>', 'Pascal', "'filetype'")
Recipe(':set ft=perl<CR>', 'Perl', "'filetype'")
Recipe(':set ft=php<CR>', 'PHP', "'filetype'")
Recipe(':set ft=python<CR>', 'Python', "'filetype'")
Recipe(':set ft=ruby<CR>', 'Ruby', "'filetype'")
Recipe(':set ft=sass<CR>', 'Sass', "'filetype'")
Recipe(':set ft=sh<CR>', 'Bash', "'filetype'")
Recipe(':set ft=sql<CR>', 'SQL', "'filetype'")
Recipe(':set ft=vim<CR>', 'VimScript', "'filetype'")
Recipe(':set ft=xml<CR>', 'XML', "'filetype'")
Recipe(':set ft=yaml<CR>', 'YAML', "'filetype'")

RecipeSection('Indentation')

Recipe(':set et<CR>', 'Use Spaces', "'expandtab'")
Recipe(':set noet<CR>', 'Use Tabs', "'noexpandtab'")

Recipe(':retab<CR>', 'Fix Mixed Indentation', ':retab')

Recipe('>>', 'Increase One Level to Current Line', '>>')
Recipe('<<', 'Decrease One Level to Current Line', '<<')

Recipe('>ip', 'Increase One Level to Current Paragraph', '>')
Recipe('<ip', 'Decrease One Level to Current Paragraph', '<')

RecipeSection('Encoding')

Recipe(':set enc=utf-8<CR>', 'utf-8', "'encoding'")
Recipe(':set enc=utf-16<CR>', 'utf-16', "'encoding'")
Recipe(':set enc=latin1<CR>', 'latin1', "'encoding'")

RecipeSection('Convert Case')

Recipe('VU', 'Upper Case Current Line', 'v_U')
Recipe('Vu', 'Lower Case Current Line', 'v_u')
Recipe('V~', 'Toggle Case Current Line', 'v_~')

Recipe('viwU', 'Upper Case Current Word', 'v_U')
Recipe('viwu', 'Lower Case Current Word', 'v_u')
Recipe('viw~', 'Toggle Case Current Word', 'v_~')

RecipeSection('Tab Width')

Recipe(':set sw=1 sts=1 ts=1<CR>', '1', "'tabstop'")
Recipe(':set sw=2 sts=2 ts=2<CR>', '2', "'tabstop'")
Recipe(':set sw=4 sts=4 ts=4<CR>', '4', "'tabstop'")
Recipe(':set sw=8 sts=8 ts=8<CR>', '8', "'tabstop'")

RecipeSection('File')

Recipe(':w<CR>', 'Save', ':write')
Recipe(':wa<CR>', 'Save All', ':wall')
Recipe(':wq<CR>', 'Save and Close', ':wq')
Recipe(':q!<CR>', 'Close Without Saving', ':quit!')
Recipe(':wqa<CR>', 'Save All and Close', ':wqall')
Recipe(':qa!<CR>', 'Close All Without Saving', ':qall!')

Recipe(':saveas<Space>', 'Save As', ':saveas')

Recipe(':e<Space>', 'Open File', ':edit')
Recipe(':e#<CR>', 'Open Last File', 'c_#')

RecipeSection() " Search

Recipe('/', 'Search', '/')
Recipe('?', 'Search Backwards', '?')
Recipe('*', 'Search: Current Word', 'star')
Recipe('#', 'Search Backwards: Current Word', '#')

RecipeSection('Search Results')

Recipe('n', 'Next', 'n')
Recipe('N', 'Previous', 'N')

Recipe(':nohls<CR>', 'Clear Highlighting', ':nohlsearch')

RecipeSection('Tabs')

Recipe(':tabnew<CR>', 'New Tab', ':tabnew')
Recipe(':tabclose<CR>', 'Close Tab', ':tabclose')

Recipe('gt', 'Next Tab', 'gt')
Recipe('gT', 'Previous Tab', 'gT')

Recipe('1gt', 'Go To Tab 1', 'gt')
Recipe('2gt', 'Go To Tab 2', 'gt')
Recipe('3gt', 'Go To Tab 3', 'gt')
Recipe('4gt', 'Go To Tab 4', 'gt')
Recipe('5gt', 'Go To Tab 5', 'gt')
Recipe('6gt', 'Go To Tab 6', 'gt')
Recipe('7gt', 'Go To Tab 7', 'gt')
Recipe('8gt', 'Go To Tab 8', 'gt')
Recipe('9gt', 'Go To Tab 9', 'gt')

RecipeSection('Fold')

Recipe('zj', 'Next Fold', 'zj')
Recipe('zk', 'Previous Fold', 'zk')

Recipe('zo', 'Open Fold', 'zo')
Recipe('zc', 'Close Fold', 'zc')
Recipe('za', 'Toggle Fold', 'za')
Recipe('zR', 'Open All Folds', 'zR')
Recipe('zM', 'Close All Folds', 'zM')

RecipeSection('Spell Checking')

Recipe('z=', 'Correct Current Word', 'z=')
Recipe('zg', 'Add Current Word to Dictionary', 'zg')

RecipeSection('Vim')

Recipe(':help<CR>', 'Help', ':help')
Recipe(':version<CR>', 'Version', ':version')
Recipe(':e $MYVIMRC<CR>', 'Edit Vimrc', '$MYVIMRC')

Recipe(':xa<CR>', 'Save and Exit', ':xall')
Recipe(':xa<CR>', 'Save and Quit', ':xall')
Recipe(':xa!<CR>', 'Exit Without Saving', ':xall')
Recipe(':xa!<CR>', 'Quit Without Saving', ':xall')

RecipeSection('History')

Recipe('u', 'Undo', 'undo')
Recipe('<C-r>', 'Redo', 'CTRL-R')

RecipeSection('Delete')

Recipe('ggdG', 'Entire File', 'd')

Recipe('x', 'Current Character', 'x')
Recipe('dd', 'Current Line', 'dd')
Recipe('diw', 'Current Word', 'diw')
Recipe('dip', 'Current Paragraph', 'dip')

Recipe('di"', 'Text Inside Double Quotes', 'd')
Recipe("di'", 'Text Inside Single Quotes', 'd')
Recipe('di(', 'Text Inside Parentheses', 'dib')
Recipe('di{', 'Text Inside Curly Brackets', 'diB')

RecipeSection('Insert')

Recipe('o', 'Line After', 'o')
Recipe('o', 'Line Below', 'o')
Recipe('O', 'Line Before', 'O')
Recipe('O', 'Line Above', 'O')
Recipe('i', 'Before Cursor', 'i')
Recipe('a', 'After Cursor', 'a')
Recipe('I', 'At Beginning of Line', 'I')
Recipe('A', 'At End of Line', 'I')

RecipeSection('Go To')

Recipe('gg', 'Beginning of File', 'gg')
Recipe('G', 'End of File', 'G')
Recipe('w', 'Next Word', 'w')
Recipe('b', 'Previous Word', 'b')
Recipe('b', 'Beginning of Word', 'b')
Recipe('e', 'End of Word', 'e')
Recipe(')', 'Next Sentence', ')')
Recipe('(', 'Previous Sentence', '(')
Recipe('}', 'Next Paragraph', '}')
Recipe('{', 'Previous Paragraph', '{')
Recipe('^', 'Beginning of Line', '^')
Recipe('$', 'End of Line', '$')
Recipe('%', 'Matching parentheses')
Recipe('%', 'Matching bracket')

RecipeSection('Search and Go To')

Recipe('//e<Left><Left>', 'End of Match', 's/\e')

RecipeSection() " Misc Commands

Recipe('.', 'Repeat Last Command', '.')
Recipe('J', 'Join Lines', 'J')
Recipe(':%sort<CR>', 'Sort All Lines', ':sort')
Recipe(':cd %:h<CR>', 'Change to the Directory of the Current File', ':cd')
Recipe('gf', 'Open File Name Under Cursor', 'gf')
Recipe('ga', 'Current Character ASCII Value', 'ga')
Recipe('g8', 'Current Character utf-8 Value', 'ga')
Recipe('<C-a>', 'Increment Number Under Cursor', 'CTRL-A')
Recipe('<C-x>', 'Increment Number Under Cursor', 'CTRL-X')
Recipe('gg=G', 'Fix Indentation of All File', '=')
Recipe('==', 'Fix Indentation of Current Line', '==')
Recipe('=ip', 'Fix Indentation of Current Paragraph', '=')

RecipeSection('Replace')

Recipe('r', 'Current Character', 'r')
Recipe('ciw', 'Current Word', 'c')
Recipe('cc', 'Current Line', 'c')

Recipe('ci"', 'Text Inside Double Quotes', 'd')
Recipe("ci'", 'Text Inside Single Quotes', 'd')
Recipe('ci(', 'Text Inside Parentheses', 'dib')


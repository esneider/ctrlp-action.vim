RecipeBegin()

RecipeSection() " Toggle Options

Recipe(':set wrap!<CR>', 'Enable Word Wrap: Toggle', "'wrap'")
Recipe(':set spell!<CR>', 'Enable Spell Checking: Toggle', "'spell'")
Recipe(':set list!<CR>', 'Show Invisible Characters: Toggle', "'list'")
Recipe(':set nu!<CR>', 'Show Line Numbers: Toggle', "'number'")
Recipe(':set cul!<CR>', 'Show Cursor Line: Toggle', "'cursorline'")

RecipeSection() " Misc Options

Recipe(':set vb t_vb=<CR>', 'Error Bell: Disable', "'visualbell'")
Recipe(':set mouse=a<CR>', 'Use Mouse: Enable', "'mouse'")
Recipe(':set bs=2<CR>', 'Backspace in Insert Mode', "'backspace'")
Recipe(':set ls=2<CR>', 'Show Status Line', "'laststatus'")
Recipe(':set t_Co=256<CR>', 'Force 256 Colors', "'t_Co'")
Recipe(':set cb=unnamed,unnamedplus<CR>', 'Use System Clipboard', "'clipboard'")

RecipeSection('Indentation')

Recipe(':set noet<CR>', 'Use Tabs', "'noexpandtab'")
Recipe(':set et<CR>', 'Use Spaces', "'expandtab'")
Recipe(':retab<CR>', 'Fix mixed case', ':retab')

RecipeSection('Encoding')

Recipe(':set enc=utf-8<CR>', 'utf-8', "'encoding'")
Recipe(':set enc=utf-16<CR>', 'utf-16', "'encoding'")
Recipe(':set enc=latin1<CR>', 'latin1', "'encoding'")

RecipeSection('Convert Case')

Recipe('VU', 'Upper Case Current Line', 'v_U')
Recipe('Vu', 'Lower Case Current Line', 'v_u')
Recipe('viwU', 'Upper Case Current Word', 'v_U')
Recipe('viwu', 'Lower Case Current Word', 'v_u')
Recipe('V~', 'Swap Case Current Line', 'v_~')
Recipe('viw~', 'Swap Case Current Word', 'v_~')

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
Recipe(':nohlsearch<CR>', 'Clear Highlighting', ':nohlsearch')

RecipeSection('Tabs')

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
Recipe(':tabnew<CR>', 'New Tab', ':tabnew')

RecipeSection('Fold')

Recipe('zo', 'Open Fold', 'zo')
Recipe('zc', 'Close Fold', 'zc')
Recipe('za', 'Toggle Fold', 'za')
Recipe('zR', 'Open All Folds', 'zR')
Recipe('zM', 'Close All Folds', 'zM')
Recipe('zj', 'Next Fold', 'zj')
Recipe('zk', 'Previous Fold', 'zk')

RecipeSection('Spell Checking')

Recipe('z=', 'Correct Current Word', 'z=')
Recipe('zg', 'Add Current Word To Dictionary', 'zg')

RecipeSection('Vim')

Recipe(':e $MYVIMRC<CR>', 'Edit Vimrc', '$MYVIMRC')
Recipe(':version<CR>', 'Version', ':version')
Recipe(':help<CR>', 'Help', ':help')
Recipe(':xa<CR>', 'Save and Exit', ':xall')
Recipe(':xa<CR>', 'Save and Quit', ':xall')
Recipe(':xa!<CR>', 'Exit', ':xall')
Recipe(':xa!<CR>', 'Quit', ':xall')

RecipeSection('History')

Recipe('u', 'Undo', 'undo')
Recipe('<C-r>', 'Redo', 'CTRL-R')

RecipeSection('Delete')

Recipe('ggdG', 'Entire File', 'd')
Recipe('dd', 'Current Line', 'dd')
Recipe('diw', 'Current Word', 'diw')

RecipeSection('Insert')

Recipe('o', 'Line After', 'o')
Recipe('o', 'Line Below', 'o')
Recipe('O', 'Line Before', 'O')
Recipe('O', 'Line Above', 'O')

RecipeSection('Go To')

Recipe('gg', 'Beginning Of File', 'gg')
Recipe('G', 'End Of File', 'G')
Recipe('w', 'Next Word', 'w')
Recipe('b', 'Previous Word', 'b')
Recipe('b', 'Beginning Of Word', 'b')
Recipe('e', 'End Of Word', 'e')
Recipe(')', 'Next Sentence', ')')
Recipe('(', 'Previous Sentence', '(')
Recipe('}', 'Next Paragraph', '}')
Recipe('{', 'Previous Paragraph', '{')
Recipe('^', 'Beginning Of Line', '^')
Recipe('$', 'End Of Line', '$')

RecipeSection('Search and Go To')

Recipe('//e<Left><Left>', 'End Of Match', 's/\e')



RecipeSection " Toggle Options

Recipe ':set wrap!<CR>' 'Enable Word Wrap: Toggle'
Recipe ':set spell!<CR>' 'Enable Spell Checking: Toggle'
Recipe ':set list!<CR>' 'Show Invisible Characters: Toggle'
Recipe ':set number!<CR>' 'Show Line Numbers: Toggle'
Recipe ':set cursorline!<CR>' 'Show Cursor Line: Toggle'

RecipeSection " Misc Options

Recipe ':set vb t_vb=<CR>' 'Error Bell: Disable'
Recipe ':set mouse=a<CR>' 'Use Mouse: Enable'
Recipe ':set backspace=2<CR>' 'Backspace in Insert Mode'
Recipe ':set laststatus=2<CR>' 'Show Status Line'
Recipe ':set t_Co=256<CR>' 'Force 256 Colors'
Recipe ':set clipboard=unnamed,unnamedplus<CR>' 'Use System Clipboard'

RecipeSection 'Indentation'

Recipe ':set expandtab<CR>' 'Use Tabs'
Recipe ':set noexpandtab<CR>' 'Use Spaces'
Recipe ':retab<CR>' 'Reindent'

RecipeSection 'Encoding'

Recipe ':set encoding=utf-8<CR>' 'utf-8'
Recipe ':set encoding=utf-16<CR>' 'utf-16'
Recipe ':set encoding=latin1<CR>' 'latin1'

RecipeSection 'Convert Case'

Recipe 'VU' 'Upper Case Current Line'
Recipe 'Vu' 'Lower Case Current Line'
Recipe 'viwU' 'Upper Case Current Word'
Recipe 'viwu' 'Lower Case Current Word'
Recipe 'V~' 'Swap Case Current Line'
Recipe 'viw~' 'Swap Case Current Word'

RecipeSection 'Tab Width'

Recipe ':set sw=1 sts=1 ts=1<CR>' '1'
Recipe ':set sw=2 sts=2 ts=2<CR>' '2'
Recipe ':set sw=4 sts=4 ts=4<CR>' '4'
Recipe ':set sw=8 sts=8 ts=8<CR>' '8'

RecipeSection 'File'

Recipe ':w<CR>' 'Save'
Recipe ':wa<CR>' 'Save All'
Recipe ':wq<CR>' 'Save and Close'
Recipe ':q!<CR>' 'Close Without Saving'
Recipe ':wqa<CR>' 'Save All and Close'
Recipe ':qa!<CR>' 'Close All Without Saving'
Recipe ':saveas<Space>' 'Save As'
Recipe ':e<Space>' 'Open File'
Recipe ':e#<CR>' 'Open Last File'

RecipeSection " Search

Recipe '/' 'Search'
Recipe '?' 'Search Backwards'
Recipe '*' 'Search: Current Word'
Recipe '#' 'Search Backwards: Current Word'

RecipeSection 'Search Results'

Recipe 'n' 'Next'
Recipe 'N' 'Previous'
Recipe ':nohlsearch<CR>' 'Clear Highlighting'

RecipeSection 'Tabs'

Recipe 'gt' 'Next Tab'
Recipe 'gT' 'Previous Tab'
Recipe '1gt' 'Go To Tab 1'
Recipe '2gt' 'Go To Tab 2'
Recipe '3gt' 'Go To Tab 3'
Recipe '4gt' 'Go To Tab 4'
Recipe '5gt' 'Go To Tab 5'
Recipe '6gt' 'Go To Tab 6'
Recipe '7gt' 'Go To Tab 7'
Recipe '8gt' 'Go To Tab 8'
Recipe '9gt' 'Go To Tab 9'
Recipe ':tabnew<CR>' 'New Tab'

RecipeSection 'Fold'

Recipe 'zo' 'Open Fold'
Recipe 'zc' 'Close Fold'
Recipe 'za' 'Toggle Fold'
Recipe 'zR' 'Open All Folds'
Recipe 'zM' 'Close All Folds'
Recipe 'zj' 'Next Fold'
Recipe 'zk' 'Previous Fold'

RecipeSection 'Spell Checking'

Recipe 'z=' 'Correct Current Word'
Recipe 'zg' 'Add Current Word To Dictionary'

RecipeSection 'Vim'

Recipe ':e $MYVIMRC<CR>' 'Edit Vimrc'
Recipe ':version<CR>' 'Version'
Recipe ':help<CR>' 'Help'
Recipe ':xa<CR>' 'Save and Exit'
Recipe ':xa<CR>' 'Save and Quit'
Recipe ':xa!<CR>' 'Exit'
Recipe ':xa!<CR>' 'Quit'

RecipeSection 'History'

Recipe 'u' 'Undo'
Recipe '<C-r>' 'Redo'

RecipeSection 'Delete'

Recipe 'ggdG' 'Entire File'
Recipe 'dd' 'Current Line'
Recipe 'diw' 'Current Word'

RecipeSection 'Insert'

Recipe 'o' 'Line After'
Recipe 'o' 'Line Below'
Recipe 'O' 'Line Before'
Recipe 'O' 'Line Above'

RecipeSection 'Go To'

Recipe 'gg' 'Beginning Of File'
Recipe 'G' 'End Of File'
Recipe 'w' 'Next Word'
Recipe 'b' 'Previous Word'
Recipe 'b' 'Beginning Of Word'
Recipe 'e' 'End Of Word'
Recipe ')' 'Next Sentence'
Recipe '(' 'Previous Sentence'
Recipe '}' 'Next Paragraph'
Recipe '{' 'Previous Paragraph'
Recipe '^' 'Beginning Of Line'
Recipe '$' 'End Of Line'

RecipeSection 'Search and Go To'

Recipe '//e<Left><Left>' 'End Of Match'


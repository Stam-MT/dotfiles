
# Vim Modes

## normal mode

like the main menu, where you reach all other modes from
- access via ESC

## insert mode

type and delete characters
- access via i,a from normal mode (start at lef / right of cursor)
- access via I,A from normal mode (start at start / end of line)

## visual mode

highlight characters
- character visual mode: highlight individual character
  - access via v
- line visual mode: highlight whole lines
  - access via V
- block visual mode: highlight rectangle
  - access via ctrl+v

## replace mode

write over existing characters
- access via r for single char
- access via shift+r for multiple chars

## command mode

- type : your command


# Commands
- :Tutor        open interactive vim tutorial
- :7            jump to line 7
- :q            quit vim
- :q!           quit vim and discard changes
- :w            save changes
- :wq           save and quit
- :set variable set variable
- :unset variable set variable!


# Keybinds

## Native Keybinds

### Basics
- h,j,k,l,b,w   move cursor left,up,down,right
- x             delete character under cursor
- r             replace character under cursor
- o/O           insert new line below/above and enter insert mode

### Copy (yank) / Cut (delete) / Paste (put)
- yy    / dd    copy / cut line
- 4yy   / 4dd   copy / cut 4 lines
- y$    / d$    copy / cut from cursor to end of line
- y^    / d^    copy / cut from cursor to start of line
- p/P           paste after/before cursor

### Undo / Redo
- u             undo last action
- ctrl+r        redo last undo

### Search
- /keyword      search in buffer for keyword
- n/N           go to next/previous search result
- */#           go to next occurrence of word under cursor

### Splits
- :vsp    / :sp     split vim, open new buffer of same file next / below
- :(v)sp file       split vim, open new buffer of file
- ctrl+w, w         switch active buffer
- ctrl+w, h/j/k/l   switch active buffer to left, up, down, right
- ctrl+w, H/J/K/L   move active buffer to left, up, down, right


## Custom Keybinds

### File Browsing
- tb            file brower (Telescope)
- tf            fuzzy search files (Telescope)
- tg            live grep in files (Telescope)

### Programming
- space+h       hover over type / method
- space+s       signature help
- space+r       rename
- space+ek      go to next error
- space+ej      go to previous error
- space+ca      code actions
- td            go to Definition (Telescope)
- ti            go to implementation (Telescope)
- tt            go to type definition (Telescope)
- tr            show references (Telescope)
- tj            jump to method / field (Telescope)
- te            show errors (Telescope)

### Move Lines
- alt+j,k       move whole lines up / down (in insert and visual mode)

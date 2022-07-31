
# Vim Modes
- normal mode: like the main menu, where you reach all other modes from
    - access via <ESC>
- insert mode: type and delete characters
    - access via i,a from normal mode (start at lef / right of cursor)
    - access via I,A from normal mode (start at start / end of line)
- visual mode: highlight characters
    - character visual mode: highlight individual character (via v)
    - line visual mode: highlight whole lines (via shift+v)
    - block visual mode: highlight rectangle (via ctrl+v)
- replace mode: write over existing characters
    - access via r for single char, or via shift+r for multiple chars
- command mode: type : <your command>


# Commands
- h,j,k,l       move cursor left,up,down,right
- :Tutor        open interactive vim tutorial
- :7            jump to line 7
- :q            quit vim
- :q!           quit vim and discard changes
- :w            save changes
- :wq           save and quit
- :set variable set <variable>
- :unset variable set <variable>!
- :vsp <file>   view new splitpane for file


# Keybinds

## Native Keybinds

### Copy (yank) / Cut (delete) / Paste (put)
yy      / dd    copy / cut line
4yy     / 4dd   copy / cut 4 lines
y$      / d$    copy / cut from cursor to end of line
y^      / d^    copy / cut from cursor to start of line
p               paste after cursor
shift+p         paste before cursor

### Single Character Modifications
x               delete character under cursor
r               replace character under cursor


## Custom Keybinds

### Programming
gd              go to Definition
shift+k         hover over type / method
ctrl+k          signature help
space+rn        rename
gr              show references
space+f         formatting (only supported by some language servers)

### Splitplanes
alt+h,j,k,l     move splitpane left,up,down,right (in normal mode)
ctrl+h,j,k,l    switch active splitpane left,up,down,right (in normal mode)

### Move Lines
alt+j,k         move whole lines up / down (in insert and visual mode)

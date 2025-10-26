# Neovim Cheatsheet

A personal collection of useful commands and concepts.

## Basic Navigation

- Put your right index finger on `j` and the middle finger on `k` for easy navigation.
- `<C-f>` and `<C-b>` - **Page down** and **page up**.
- `<C-e>` and `<C-y>` - **Scroll down** and **scroll up** one line without moving the cursor.
- `H`, `M`, `L` - Move the cursor to the **top**, **middle**, or **bottom** of the screen.
- `zz` - **Center** the current line in the window. Also works with `zt` (top) and `zb` (bottom).
- `-` and `+` - Move to the **previous** or **next** line and go to first non-whitespace character of the line (like pressing `k` / `j` and `^`.

## Word and Character Movement

- `e` / `E` - Jump to the **end** of the current word. `E` uses WORDs (delimited by whitespace).
- `w` / `W` - Jump forward to the start of the next **word**. `W` uses WORDs. Often time you can use it to jump between function names or variables or other identifiers.
- `f{char}` / `F{char}` - **Find** a character on the current line (forward/backward).
- `t{char}` / `T{char}` - Jump **'til** (just before) a character on the current line (forward/backward).
- `;` / `,` - **Repeat** the last `f`, `F`, `t`, or `T` motion forward (`;`) or backward (`,`).

## Advanced Navigation

- `'m` and `m - Jump to beginning of mark line or exact position of mark.
- `g;` and `g,` - Jump to the next or previous change in the file.
- `gx` - Open the URL under the cursor in your default web browser.
- `[{` - Jump to the **previous unmatched `{` brace**. Can be combined with `v%` (e.g., `[{v%`) to select the entire block.
- `'.` - Jump to the **exact position** of the last change.
- `f(w` - Jump to function arguments (inside parentheses).
- `]m` / `[m` - Jump to the start of the **next/previous method** in languages like C, Java, or Python.
- `]M` / `[M` - Jump to the end of the **next/previous method**.
- `[{` / `]}` - Jump to the previous/next `{` brace from inside a code block.
- `[(` / `])` - Jump to the previous/next `(` from inside a code block.
- `]]` / `[[` - Jump to next/previous `{` in the first column.
- `][` / `[]` - Jump to next/previous `}` in the first column.

## Basic Editing

- `yy` / `Y` - **Copy (yank)** the entire current line.
- `.` - **Repeat** the last change (e.g., a deletion, paste, or command).
- `D` - delete from the cursor to the end of the line (same as `d$`).
- `<C-[>` or `<C-c>` - Exit insert mode (similiar as `Esc`).
- `J` - **Join** the current line with the next line, adding a space between them. Also works with a count (e.g., `3J` joins three lines). Also works in visual mode. Can also be used to make multi line arrays and objects in one line.

## Text Objects and Advanced Editing

- `cib` - **Change inside block** (parentheses). Deletes content inside `()` and enters insert mode.
- `cgn` - **Change** the **next search match**. Can be repeated with `.`.
- `d/pattern<CR>`, `c/pattern<CR>`, `y/pattern<CR>` - **Delete**, **change**, or **yank** from the cursor to the next occurrence of "pattern".
- `as` / `is` - Select **around** or **inside** a sentence.

## Numbers

- `<C-a>` - **Increment** the number under or after the cursor.
- `<C-x>` - **Decrement** the number under or after the cursor.

## Visual Selection

- `gv` - **Reselect** the **previous visual selection**.
- `o` - Toggle the cursor between the **beginning and end** of the visual selection.
- `gn` / `gN` - **Select** the **next/previous search match** in visual mode.
- **Text Objects** - Use text objects like `iw` (inside word) or `a"` (around quotes) to quickly change or expand your visual selection.
- `an` / `in` - Select **around** or **inside** a node in languages like XML or HTML.

## Visual Block Mode

- `<C-b>$` - Move to end of line for all lines in visual block mode. Can be combined with `A` to append text at the end of multiple lines for example.

## Text Transformation

- `u` / `U` - **Lowercase** or **uppercase** the selected text.
- `:s/\n/, ` - Replace newlines with commas in a selected block.
- `:s/, /,\r` - Split a comma-separated list into multiple lines.

## Insert Mode Commands

- `<C-r>{register}` - **Paste** the content from a specified register. For example, `<C-r>"` pastes from the default register.
- `<C-x><C-s>` - **Signature Help**. When an LSP is active, this can show function parameter information. Note: `<C-s>` alone often freezes the terminal (XOFF).
- `<C-s>` - Shows function signature help when an LSP is active.
- `<C-o>{cmd}` - Execute a single normal mode command while in insert mode. For example, `<C-o>dw` deletes a word without leaving insert mode.
- `<C-x><C-f>` - **File name completion**. Start typing a file path and use this shortcut to auto-complete it.
- `<C-h>` - **Delete** the character before the cursor (like Backspace).
- `<C-w>` - **Delete** the word before the cursor.
- `<C-u>` - **Delete** from the cursor to the beginning of the line.

## Search

- `<C-f>` - Open the command-line window for easier editing of long commands. Press `<C-c>` to exit.
- `<C-p>` / `<C-n>` - Navigate through **command-line history** (previous/next).
- `/\v` - Start a search with **very magic** mode, where most characters are treated as special regex characters without needing to escape them.
- `/\c` - Start a search that is **case-insensitive** or `/\C` for **case-sensitive**.
- `\V` - Very nomagic mode. All characters are treated as literal characters except `\`.

## Substitution

- `:/start/,/end/s/old/new/g` - Perform a **substitution** between lines matching "start" and "end".
- `:.,+5s/old/new/g` - Perform a substitution from the current line (`.`) to 5 lines below (`+5`).
- `:s/\<select\|from\|where\>/\U&/g` - Uppercase SQL keywords in the current line.

## File Operations

- `:enew` - Create a **new, unnamed buffer** for scratch work.
- `:view {file}` - Open a file in **read-only mode**.
- `:e!` - **Reload the file**, discarding all unsaved changes.
- `:e #` - Open alternate file (the last file you were editing).
- `:r {file}` - Read file in
- `:r {cmd}` - Read the output of a shell command into the current buffer.
- `:x` - Saves, if there are changes, and exits (same as `:wq`). You can also use `ZZ` in normal mode for a similar effect.

## Buffer Management

- `:b ` - Switch between open **buffers**. Use `<Tab>` to complete buffer names.
- `:ls` - List **open buffers**
- `:bn` / `:bp` - Switch to **next** or **previous** buffer
- `<C-^>` - Toggle between the current and the last edited buffer.
- `:bufdo {cmd}` - Execute a command in all open buffers.

## Argument List

- `:args {file1} {file2} ...` - Open multiple files as arguments.
- `:args *.ts` - Load all `.ts` files in the current directory into the argument list.
- `:argdo %s/old/new/g | update` - Perform a substitution in all files in the argument list and save changes.

The `:global` command (`:g`) executes a command on all lines matching a pattern. Use `:vglobal` (`:v`) for all lines **not** matching.

- `:g/pattern/d` - **Delete** all lines containing "pattern".
- `:g/pattern/norm {cmd}` - Execute a **normal mode command** on each matching line.
- `:g/pattern/s/old/new/g` - Perform a **substitution** on all lines matching "pattern".
- `:g/await/?^function?s/function/async function/` - Make all functions containing "await" async.

## Registers

- `:reg` - **Show all registers** and their content.
- `"_` - The **black hole register**. Use it to delete text without affecting any other register (e.g., `"_dd`).
- `"0` - The **yank register**. Always contains the last text you yanked with `y`.
- `a-z` - **Named registers**. Use them to store text for later use (e.g., `"ayy` to yank a line into register 'a', then `"ap` to paste it).
- `"1`-`"9` - The **delete registers**. A history of your last 9 multi-line deletions.
- `"-"` - The **small delete register**. Contains text from deletions of less than one line.
- `"/"` - The **search register**. Contains your last search pattern.

## Macros

- `@a` - **Execute the macro** stored in register 'a'.
- `5@a` - **Execute macro 'a' five times**.

## Window Operations

- `<C-w>H` - **Move the current split** to the far left, making it a vertical split. Works with `H` (left), `J` (bottom), `K` (top), and `L` (right).
- `:vert {cmd}` - **Execute a command** and open its result in a **vertical split**. For example, `:vert help marks`.
- `<C-w>x` - **Swap** the current window with the next one.
- `<C-w>=` - **Equalize** the size of all open windows.
- `<C-w>>` / `<C-w><` - **Increase** or **decrease** the width of the current window.
- `:windo {cmd}` - Execute a command in **all windows**. For example, `:windo diffthis` to show diff between files.
- `:windo diffthis` - **Show differences** between all open buffers in diff mode. Use `:windo diffoff` to exit diff mode.

- `za` - **Toggle** the fold at the current line.
- `zA` - **Recursively toggle** all folds under the cursor.

## Search and Populate Lists

- `:vimgrep /pattern/ **/*.ts` - Search for a pattern in files and populate the quickfix list.
- `:lvimgrep /pattern/ **/*.ts` - Search for a pattern in files and populate the location list for the current window.

## List Management

- `:Cfilter /pattern/` - Filter the quickfix list to only show entries matching "pattern".
- `:Cfilter! /pattern/` - Filter the quickfix list to exclude entries matching "pattern".
- `:lopen` / `:copen` - Open the location list or quickfix list window.
- `]l` / `[l` - Jump to the next or previous entry in the location list.

## Terminal Mode

- `<C-\><C-n>` - Exit terminal mode and return to normal mode.

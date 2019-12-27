# Tmux formatting/theme template to provide a structure for tmux formatting
# themes which can be switched using a tmux variable set in `.tmux.conf`.
#
# Below is a summary of the various formattinng, styling, and status features
# provided by tmux, pulled from `man(5) tmux`. Some tips have been added from
# my experience and from blogs/documents found online. Tmux features are
# numerous, this references only provides what I found to be the most relevant.
# For additional options/features, view the tmux MAN page (`man(5) tmux`) and
# read [The TAO of tmux](https://leanpub.com/the-tao-of-tmux/read).
# ==============================================================================
# Formatting:
#   Variable substition:  encapsulate the variable name with `#{variable}`.
#   Escape special chars: `#,}` using `#` (eg. `##` to get `#`).
#   Variables with alias: refer by using `#` (eg. `#alias`).
#   Conditionals:
#     Formatted with `#{?exists_not_zero,value if true, value if false}`.
#     Comparisons return 0 or 1.
#     Comparisons using `==` or `!=` - `#{==:#{var},match-value}`.
#     Comparisons using `m` match regex - `#{m:.<pattern>,#{compared-var}}`
#     In pane search returns 0 if not found, line # if found - `#{C:<pattern>}`
#     Note, the patterns above are `man(3) fnmatch` patterns.
#     Comparisons using `||` and `&&` - `#{||,#{var1},#{var2}}`
#   Format Output:
#     Limit string length - `#{=5:var}` for first, or `#{-3:var}` for last
#     Convert time to str - `#{t:var}` for `123` to `Sun Oct 2 01:00:00 1991`
#     File basename - `#{b:var}`
#     File dirname  - `#{d:var}`
#     Replace string - `#{s/pattern/replace/:var}`
#   Insert first line of shell output: `#(cmd)`
#     Tmux does nont wait for command to exit
#     Tmux inserts previous result or a placeholder if command hasn't run yet
#     Tmux will insert most recent line of output if command hasn't exited
#     If command hasn't exited, status line will update at most once a second
# Style:
#   A comma separated list of colors and attributes.
#   To disable an attribute, prefix the attribute with `no` (eg. `nodim`)
#   To put attributes on multiple lines, add `-a` to subsequent `set-option`
#     commands after the first `set-option <var>` comand.
#   Color parameters:
#     `fg=<color>` - Sets the font/foreground color
#     `bg=<color>` - Sets the background color
#   Attributes:
#     `(bright|bold)` - turn text bold
#     `dim` - Use dim color
#     `underscore` - Add an underscore
#     `blink` - Add blinking text
#     `reverse` - Reverse the text
#     `hidden` - Hide the text
#     `italics` - Italicize the text
#     `strikethrough` - Add a strikethrough to the text
#   Color:
#     Simple - `black`, `red`, `green`, etc. Can use bright variants
#       (eg. `brightred`) if supported.
#     Color Number - `colour[1-255]` to use 256-color set (eg. `colour144`)
#     Hex - `#ffffff` to set the closest matching color from the 256-color set.
#     Restore default - `default`
# Status Line:
#   Structure - "<left-status>    <window-list>   <right-status>"
#   Window list may be denoted with index, name, and flag representing its status
#   Window name is inverted if alerted (activity, silence, bell)
#   Window Status Symbols:
#     `*` - Current window
#     `-` - Perviously selected window
#     `#` - Window activity is monitored and activity detected
#     `!` - Window bells are monitored and has occurred
#     `~` - Window has been silent for `monitor-silence` interval
#     `M` - Window contians marked pane
#     `Z` - Window's active pane is zoomed
#   Status line is updated every `status-interval` if a change is detected.
#   Status line parts may be coloured:
#     Completely with `status-style`
#     Either side of status line with `status-(left|right)-style`
#     Just window list with `window-status-style` (more options available)
#     In parts by adding `#[<style>]` to the format string; `#[default]`
#       restores the styling to the parameter's default.
#   Date/time can be added with aliases or using formats from `man(3) strftime`
#   Colors/text can be toggled using `#{?var/conditional,#[fg=colour1]text}`
#     to toggle when true and `#{?var/conditional,,text}` when false.
#   Writing scripts and calling them with `#()`.
#   For Powerline like customization, use a font with ligatures and enable
#     ligatures in your terminal.
#   If the terminal supports unicode, add chars like 🔍 to spice up your status.
# ==============================================================================
# Copy Mode Formatting & Styling -----------------------------------------------
setw mode-style '<style>'

# Pane Formatting & Styling ----------------------------------------------------
# --- Pane: Title Format
setw pane-border-format '<format>'
#setw pane-border-status 'off|top|bottom'

# --- Pane: Border Style
setw pane-active-border-style '<style>' # Attributes are ignored
setw pane-border-style '<style>' # Attributes are ignored

# Terminal Titles Formatting ---------------------------------------------------
#set set-titles 'on|off' # Attempts to set the client terminal's title
#set set-titles-string '<format>'

# Status Bar Formattinng & Styling ---------------------------------------------
# --- Status Bar: Settings
#set status 'on|off' # Show/hide status line
set status-interval '<seconds>' # Interval to update status, default 15
set status-justify 'left|centre|right'
set status-position 'top|bottom'
# Display bell message, forward to terminal, both
set visual-activity 'on|off|both'
set visual-bell 'on|off|both'
set visual-silence 'on|off|both'

# --- Status Bar: Message Styling
set message-command-style '<style>'
set message-style '<style>'

# --- Status Bar: Left Format & Style
set status-left '<format>
set status-left-length '<cols>'
set status-left-style '<style>'

# --- Status Bar: Right Format & Style
set status-right '<format>'
set status-right-length '<cols>'
set status-right-style '<style>'
set status-style '<style>'

# --- Status Bar: Window List Format & Style
setw window-active-style '<style>'
setw window-status-activity-style '<style>'
setw window-status-bell-style '<style>'
setw window-status-current-format '<format>
setw window-status-current-style '<style>'
setw window-status-format '<format>' # Default: #I:#W#F
setw window-status-last-style '<style>'
setw window-status-separator '<string>'
setw window-status-style '<style>'
setw window-style '<style>'

# vi: ft=tmux

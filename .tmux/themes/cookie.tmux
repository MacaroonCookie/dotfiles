# My primary tmux formatting theme for my tmux environment.
# To enable: set `THEME=cookie` in `~/.tmux.conf`
# ==============================================================================
# Copy Mode Formatting & Styling -----------------------------------------------
setw mode-style 'fg=colour232'
setw -a mode-style 'bg=colour6'
setw -a mode-style 'bold'

# Pane Formatting & Styling ----------------------------------------------------
# --- Pane: Title Format
#setw pane-border-format '<format>'
#setw pane-border-status 'off|top|bottom'

# --- Pane: Border Style
#setw pane-active-border-style '<style>' # Attributes are ignored
#setw pane-border-style '<style>' # Attributes are ignored

# Terminal Titles Formatting ---------------------------------------------------
#set set-titles 'on|off' # Attempts to set the client terminal's title
#set set-titles-string '<format>'

# Status Bar Formattinng & Styling ---------------------------------------------
# --- Status Bar: Settings
#set status 'on|off' # Show/hide status line
#set status-interval '<seconds>' # Interval to update status, default 15
#set status-justify 'left|centre|right'
#set status-position 'top|bottom'
# Display bell message, forward to terminal, both
#set visual-activity 'on|off|both'
#set visual-bell 'on|off|both'
#set visual-silence 'on|off|both'

# --- Status Bar: Message Styling
#set message-command-style '<style>'
#set message-style '<style>'

# --- Status Bar: Left Format & Style
#set status-left '<format>
#set status-left-length '<cols>'
#set status-left-style '<style>'

# --- Status Bar: Right Format & Style
#set status-right '<format>'
#set status-right-length '<cols>'
#set status-right-style '<style>'
#set status-style '<style>'

# --- Status Bar: Window List Format & Style
#setw window-active-style '<style>'
#setw window-status-activity-style '<style>'
#setw window-status-bell-style '<style>'
#setw window-status-current-format '<format>
#setw window-status-current-style '<style>'
#setw window-status-format '<format>' # Default: #I:#W#F
#setw window-status-last-style '<style>'
#setw window-status-separator '<string>'
#setw window-status-style '<style>'
#setw window-style '<style>'

# vi: ft=tmux

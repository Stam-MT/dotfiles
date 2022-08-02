
All Shortcuts start with CTRL + b.

# Servers

tmux ...
- start-server      start servers (without any sessions)
- kill-server       kill server, clients and all sessions

# Sessions

A sesion is run by the tmux server and can be attached to by a client.
Sessions conaint a set of windows.
They are persistent and keep running, even when the client is detached.
The client can later reconnect ("attach") to the session and continue its work.

## Outside tmux

tmux ...
- new-session               enter tmux and create new session
- attach-session            enter tmux in last active session
- attach-session -t 2       enter tmux and attach to session 2
- list-sessions             list all sessions
- kill-session -t 2         terminate session 2
- kill-session -a -t 2      terminate all sessions but session 2
- rename session -t 2 "name"   rename session

## In Session

- d                 detach from current session and drop out of tmux
- D                 choose what to detach
- $                 rename session
- ( )               switch to prev / next session
- r                 force redraw of client
- s                 open control panel (to inspect sessions, type commands)
- ctrl+b :          type commands (e.g. kill-session)

also you can use all outside tmux commands (see above).

# Windows

A window belongs to a tmux session and has multiple panes. All windows are shown at the bottom at a tmux client.

- c                 create new window
- &                 kill current window
- 1-9               jump to window
- ,                 rename current window

# Panes

- "                 create new pane below
- %                 create new pane to the right
- x                 kill current pane
- o                 switch to next pane (cyclic)
- arrow keys        switch to next pane (directional)
- hold C-b + arrow  resize pane
- !                 extract pane into own (new) window
- z                 toggle zoom of pane
- { }               swap position of current pane with next / prev

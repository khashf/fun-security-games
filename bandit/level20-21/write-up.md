Start a tmux session named `foobar`: `tmux new -s foobar`
Within `foobar` session, start listening on a port: `nc -l 31338`
Detach from this session with `Ctrl B + D`
Use `./suconnect` to connect to that port: `./suconnect 31338`
Attach to the `foobar` session again, enter the password from the previous level as instructed
The `./suconnect` will reply with the desired password

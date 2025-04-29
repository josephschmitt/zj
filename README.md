# ZJ: Quality of Life Zellij Scripts

ZJ is a collection of small utility scripts that make starting, managing, and clearing [Zellij](https://zellij.dev/) sessions easier based on my most common use cases. 

## Features
1. Correctly sets the current working directory when starting a new zellij session pointed at a project directory
1. Automatically names your new sessions after the directory you've opened
1. Provides a `zellij_clear` script that will delete exited sessions
1. Provides a useful ["ide" layout](./layouts/ide.kdl) that combines your `$EDITOR` with common pane sizes that mimics an IDE layout

## Installation
[Download](https://github.com/josephschmitt/zj/releases/latest) or clone the project files and place them somewhere convenient on your system (such as `$HOME/.config/zj`).

```sh
$ git clone git@github.com:josephschmitt/zj.git $HOME/.config/zj
```

Then add the `bin/` directory to your `PATH`.
```sh
# Add this to your shell profile
export PATH="$PATH:$HOME/.config/zj/bin"
```

## Usage
```sh
$ zj [--layout "ide"] [--name "my-session"] [-N] path/to/project
```

This will start a new session, optionally using a provided layout (name or full path) and session name. The working directory of the project will automatically be set to the project path, so your `EDITOR` and your panes will be synced up to the same directory, even if you launched it from a separate one. Providing `-N` flag will ignore the `--name` flag as it will try to use the working directory as the name of the session and newly opened tab.

If using `zj` from inside an existing zellij session, it'll open in a new tab instead of opening a new session, and will name the tab instead of the session.

If you want to use the provided ["ide" layout](./layouts/ide.kdl), copy the `./layouts/ide.kdl` file to your Zellij layouts directory, usually found at `$HOME/.config/zellij/layouts/`.
```sh
$ cp ./layouts/ide.kdl $HOME/.config/zellij/layouts/
```

Or provide the path to the file to the `--layout` flag.
```sh
$ zj --layout path/to/layout.kdl
```

### Environment Variables
If you primarily use the same layout each time you launch `zj`, set the `ZJ_DEFAULT_LAYOUT` env var:

```sh
$ env ZJ_DEFAULT_LAYOUT="ide" 
# From now on will default to the editor layout when the `--layout` flag is not provided
$ zj path/to/project

# Or set it to the path to your layout
$ env ZJ_DEFAULT_LAYOUT="/path/to/layout.kdl" 
$ zj path/to/project
```

Additionally, if you always want `zj` to try to name your session after the directory you are opening, set the `ZJ_ALWAYS_NAME` env var:

```sh
$ env ZJ_ALWAYS_NAME=true

# From now on, will automatically use the folder name as the session name (if not already in use)
# In this example below which opens the `zj` folder, the session name will be `zj`
$ zj /home/user/development/zj 
```

### `zellij_clear`

The `zellij_clear` command can be used to delete one (or all) sessions. It differs from the built-in Zellij `delete-session` and `delete-all-sessions` in that it also deletes sessions that are "exited". Zellij keeps closed sessions around as "exited" for a certain amount of time in case you go to re-attach to them it can resurrect them instead of creating a new session. I've found that sometimes this causes strange behavior, and so wanted a way to immediately delete exited sessions to forcibly create new ones from scratch.

## Motivation

Most of this logic was initially backed in to my previous Zellij-related project [`zide`](https://github.com/josephschmitt/zide) which aimed to provide an IDE-like experience between a file-picker, your `EDITOR`, and Zellij panes. This was incredibly useful in editor's that didn't have a built-in file picker like Helix. However, I don't always use Helix (I switch between it and Neovim) and Helix itself is gaining a built-in file picker soon. However, I missed some of these convenience features I had baked in to `zide`, and so I decided to pull them apart into their own project.

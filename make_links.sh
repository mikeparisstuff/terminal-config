#!/bin/bash

HOME_PATH=$(eval echo ~${SUDO_USER})
REPO_NAME="terminal-config"

TMUX_FILE="$HOME_PATH/.tmux.conf"
TMUX_FILE_OLD="$HOME_PATH/.tmux.conf_OLD"
TMUX_DIR="$HOME_PATH/.tmux"
TMUX_DIR_OLD="$HOME_PATH/.tmux.OLD
REPO_TMUX_FILE="$HOME_PATH/$REPO_NAME/.tmux.conf"
REPO_TMUX_DIR="$HOME_PATH/$REPO_NAME/.tmux"

# Make the symbolic link for the .tmux.conf file.
if [ -L "$TMUX_FILE" ]
then
    echo "$TMUX_FILE is already symlinked! Delete the symlink and re-run this script if you wish to create new links! Skipping..."
elif [ -f "$TMUX_FILE" ]
then
    echo "$TMUX_FILE does exist. Copying to $TMUX_FILE_OLD"
    mv $TMUX_FILE $TMUX_FILE_OLD
    echo "Creating symbolic link..."
    ln -s $REPO_TMUX_FILE $TMUX_FILE
    echo "Done."
else
    echo "$TMUX_FILE does not exist. Creating symbolic link..."
    ln -s $REPO_TMUX_FILE $TMUX_FILE
    echo "Done."
fi

# Make the symbolic link for the .tmux directory.
if [ -L "$TMUX_DIR" ]
then
    echo "$TMUX_DIR is already symlinked! Delete the symlink and re-run this script if you wish to create new links! Skipping..."
elif [ -f "$TMUX_DIR" ]
then
    echo "$TMUX_DIR does exist. Copying to $TMUX_DIR_OLD"
    mv $TMUX_DIR $TMUX_DIR_OLD
    echo "Creating symbolic link..."
    ln -s $REPO_TMUX_DIR $TMUX_DIR
    echo "Done."
else
    echo "$TMUX_DIR does not exist. Creating symbolic link..."
    ln -s $REPO_TMUX_DIR $TMUX_DIR
    echo "Done."
fi

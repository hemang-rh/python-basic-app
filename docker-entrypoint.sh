#!/bin/sh
set -e

if [ $# -eq 0 ]; then
    echo "Please provide a command. Available commands:"
    echo "  hello NAME [--count NUMBER]  - Say hello to someone"
    echo "  show-tasks                   - Display task list"
    exit 1
fi

exec py-cli "$@"
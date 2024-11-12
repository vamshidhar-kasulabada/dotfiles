# parse_git_branch(){
#     branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
#     if [ -n "$branch" ]; then
#         echo " ($branch)"
#     fi
# }
parse_git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        # Check for uncommitted changes
        if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
            echo " ($branch) x"  # Add an "X" mark if there are uncommitted changes
        else
            echo " ($branch)"
        fi
    fi
}

export PS1='\[\e[33m\]\W\[\e[0m\]\[\e[31m\]$(parse_git_branch)\[\e[0m\] \$ '

# simple PS1 Variable without git 
# export PS1='\[\e[33m\]\W\[\e[0m\] \$ '


# Enable the copilot alias
eval "$(gh copilot alias -- bash)"

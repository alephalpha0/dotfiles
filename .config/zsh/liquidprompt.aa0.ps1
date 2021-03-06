#######################################
## alephalpha0 custom liquidprompt   ##
## created:2020-10-23                ##
#######################################
# Used features:
# LP_PERM a colon ":"
# LP_PWD current working directory
# LP_VENV Python virtual environment
# LP_PROXY HTTP proxy
# LP_VCS the content of the current repository
# LP_ERR last error code
# LP_MARK prompt mark
# LP_TIME current time
# LP_TTYN number of current terminal (useful in title for quick switching)
# LP_RUNTIME runtime of last command
# LP_MARK_PREFIX user-defined prompt mark prefix (helpful if you want 2-line prompts)
# LP_PS1_PREFIX user-defined general-purpose prefix (default set a generic prompt as the window title)
# LP_PS1_POSTFIX user-defined general-purpose postfix
# LP_BRACKET_OPEN open bracket
# LP_BRACKET_CLOSE close bracket
# Remember that most features come with their corresponding colors,
# see the README.

# add permissions colon, pwd, venv, proxy, job runtime, error code
LP_PS1="${LP_PS1_PREFIX}${LP_BRACKET_OPEN}${LP_PERM}"
LP_PS1="${LP_PS1}${LP_PWD}${LP_BRACKET_CLOSE}${LP_VENV}${LP_PROXY}"
LP_PS1="${LP_PS1}${LP_RUNTIME}${LP_ERR}${LP_MARK_PREFIX}"
# Add time and VCS infos
# If root, the info has not been collected unless LP_ENABLE_VCS_ROOT
# is set.
LP_PS1="${LP_PS1}${LP_TIME}${LP_VCS}"

# add prompt mark
LP_PS1="${LP_PS1}${LP_MARK}${LP_PS1_POSTFIX}"

# "invisible" parts
# Get the current prompt on the fly and make it a title
LP_TITLE="$(_lp_title "$LP_PS1")"

# Insert it in the prompt
LP_PS1="${LP_TITLE}${LP_PS1}"

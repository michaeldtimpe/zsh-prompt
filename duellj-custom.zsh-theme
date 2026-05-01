# forked from duellj.zsh-theme
# changes:
#   - replaced history-number [%!] with time [%*]; removed RPROMPT
#   - inserted env indicators (+[conda-env]+[venv]) between host and path

setopt prompt_subst

_duellj_env_indicators() {
	local out=""
	if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
		out+=$'%{\e[1;37m%}+%{\e[0m%}%{\e[0;34m%}%B[%b%{\e[0m%}%{\e[1;35m%}'"$CONDA_DEFAULT_ENV"$'%{\e[0m%}%{\e[0;34m%}%B]%b%{\e[0m%}'
	fi
	if [[ -n "$VIRTUAL_ENV" ]]; then
		out+=$'%{\e[1;37m%}+%{\e[0m%}%{\e[0;34m%}%B[%b%{\e[0m%}%{\e[1;31m%}'"${VIRTUAL_ENV:t}"$'%{\e[0m%}%{\e[0;34m%}%B]%b%{\e[0m%}'
	fi
	PROMPT_ENV_INDICATORS=$out
}
precmd_functions+=(_duellj_env_indicators)

PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%}${PROMPT_ENV_INDICATORS} - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[0;33m%}%*%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

#!/usr/bin/env sh
#

_SELF=$HOME/textgen-portable
export MAMBA_EXE=$_SELF/micromamba/bin/micromamba

hook_mamba () {
	eval "$($MAMBA_EXE shell hook --shell=bash)"
}

export hook_mamba
hook_mamba
micromamba activate $_SELF/env_textgen

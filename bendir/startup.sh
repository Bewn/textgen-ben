#!/usr/bin/env sh
# this code is based on the arch PKGBUILD in the build directory, but should be 
# accessible to generic x86_64 distros
#

_cwd=$PWD
cd $_cwd
prepare () {
	cd $_cwd
	if [ ! -d "$_cwd/textgen-portable" ]; then mkdir $_cwd/textgen-portable; fi
	cd $_cwd/textgen-portable
	_cwd=$_cwd/textgen-portable

	#download latest micromamba
	if [ ! -d $_cwd/micromamba ]; then mkdir $_cwd/micromamba && cd $_cwd/micromamba
		wget https://micro.mamba.pm/api/micromamba/linux-64/latest && tar xf latest;
	fi
	export MAMBA_EXE=$_cwd/micromamba/bin/micromamba #micromamba now runnable from this script
	
	#make  environment
	$MAMBA_EXE create --prefix=$_cwd/env_textgen
	export _mamba_env=$_cwd/env_textgen
}

main () {
    #pythonic bash with functional flair
    $(prepare)
}

main
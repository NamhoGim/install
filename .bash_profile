#Basic Configuration
export EDITOR=vim
export SVN_EDITOR=vim
export FIGNORE=.svn
export TERM=xterm-256color
export LC_CTYPE=C
export LC_ALL=C
export LC_MESSAGES=C

alias ll='ls -alt'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim' 
alias ctags="`brew --prefix`/bin/ctags"
alias grep="grep --exclude-dir='.svn' --exclude=tags --color=auto"

#ubuntu
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	    ## Auto complete
		if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
			. /etc/bash_completion
		fi

		export SHELL=/bin/bash
		export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

#macosX
else
	export CLICOLOR=1
	export LSCOLORS=GxFxCxDxBxegedabagaced
	export color_prompt=yes
	export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
	#xport LC_ALL=en_US.UTF-8
	#export LANG=en_US.UTF-8

	# Setting PATH for Python 3.5
	# The orginal version is saved in .bash_profile.pysave
	PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

	# Setting PATH for Python 2.7
	# The original version is saved in .bash_profile.pysave
	PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}" export PATH
fi

if [[ "$HOSTNAME" == "gimnamho" ]]; then
	BASE16_SHELL="$HOME/.config/base16-shell/base16-isotope.dark.sh"
	[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
	export BRANCH=~/SVNARC/projects/typedarch/branches/namho/ASPLOS2017
	export RISCV=/opt/riscv_chkld
	#export RISCV=/opt/riscv4unified
	#export RISCV=/opt/riscv
	#export RISCV=/opt/riscv4js_old
	#export RISCV=/opt/riscv4lua
	export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
	export PATH=$PATH:$RISCV/bin
	export PATH=$PATH:$RISCV/riscv64-unknown-elf/bin
	export PATH=/opt/Xilinx/Vivado/2015.2/bin:$PATH
	export PATH=/opt/Xilinx/SDK/2015.2/bin:$PATH
	export PATH=/opt/Xilinx/SDK/2015.2/gnu/arm/lin/bin:$PATH
	export PATH=/home/gimnamho/Downloads/Xilinx_Vivado_SDK_Lin_2015.2_0612_1/tps/lnx64/jre/bin:$PATH

elif [[ "$HOSTNAME" == "gimnamho-mac.local" ]]; then
	export CC=clang
	function attach() {
		# MYIP=$(ipconfig getifaddr en0)
		MYIP=$(ifconfig | grep "147.46.174.146")
		echo $MYIP
		if [[ $MYIP == "" ]]; then
			echo "not matched"
			lsof -ti:2222 | xargs kill -9
			lsof -ti:1221 | xargs kill -9
			ssh arcgate -L 2222:147.46.174.66:22 -L 1221:147.46.219.120:22 -f -N -M
			SESS=$(ssh gimnamho.tunnel -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh -x gimnamho.tunnel -t 'tmux -CC'
			else
				ssh -x gimnamho.tunnel -t 'tmux -CC attach -d'
			fi

		else
			echo "matched"
			SESS=$(ssh gimnamho -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh -x gimnamho -t 'tmux -CC'
			else
				ssh -x gimnamho -t 'tmux -CC attach -d'
			fi
		fi
}
fi

function extract() {
if [[ -f $1 ]]; then
	case $1 in 
		*.tar.bz2)  tar xjf $1      ;;
		*.tar.gz)   tar xzf $1      ;;
		*.bz2)      bunzip2 $1      ;;
		*.rar)      unrar e $1      ;;
		*.gz)       gunzip $1       ;;
		*.tar)      tar xf $1       ;;
		*.tbz2)     tar xjf $1      ;;
		*.tgz)      tar xzf $1      ;;
		*.zip)      unzip $1        ;;
		*.Z)        uncompress $1   ;;
		*.7z)       7z x $1         ;;
		*.tar.xz)   tar xfJ $1      ;;
		*)          echo "'$1' cannot be extracted via extract()" ;;
	esac
else
	echo "'$1' is not a vaild file"
fi 
}

function compress() {
if [[ -e $2 ]]; then
	case $1 in 
		*.tar.bz2)  tar -jcvf $1 $2 ;;
		*.tar.gz)   tar -zcvf $1 $2 ;;
		*.zip)      zip -r $1 $2    ;;
		*)          echo "'$2' cannot be compressed via compress()" ;;
	esac
else
	echo "'$1' is not a vaild file"
fi
}

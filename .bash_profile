#Basic Configuration
export EDITOR=vim
export SVN_EDITOR=vim
export FIGNORE=.svn
export TERM=xterm-256color
export LC_CTYPE=C
export LC_ALL=C
export LC_MESSAGES=C

#alias ls='ls --color=auto'
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
	export LSCOLORS=ExFxCxDxBxegedabagaced
	export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
	#export PATH=/usr/local/texlive/2016/bin:$PATH
	export PATH="$PATH:/Library/TeX/Distributions/Programs/texbin"
	export marvel2=/Users/$(whoami)/GitHub/marvel2
	export GOPATH=/Users/$(whoami)/go:/Users/$(whoami)/go/bin:$marvel2/go:$marvel2/go/vendor
	export PATH="$PATH:$GOPATH"

	export PS1='\[\e[3m\]\[\e[32m\]\[\e[4m\]\u@\h\[\e[0;00m\]:\[\e[24m\]\[\e[0;34m\]\[\e[3m\]\w\[\e[0;24m\] '
	#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
	export LC_ALL=en_US.UTF-8
	export LANG=ko_KR.UTF-8 #en_US.UTF-8

	# Setting PATH for Python 3.5
	# The orginal version is saved in .bash_profile.pysave
	PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

	# Setting PATH for Python 3.7
	PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"

	# Setting PATH for Python 2.7
	# The original version is saved in .bash_profile.pysave
	PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}" export PATH
	export PATH=$PATH:/usr/local/go/bin
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

elif [[ "$HOSTNAME" == "gimnamhoMacBook.local" ]]; then
	export CC=clang
function attach() {
		# MYIP=$(ipconfig getifaddr en0)
		MYIP=$(ifconfig | grep "147.47.208.152")
		echo $MYIP
		if [[ $MYIP == "" ]]; then
			echo "not matched"
			lsof -ti:2222 | xargs kill -9
			lsof -ti:1221 | xargs kill -9
			ssh arcgate -L 2222:147.47.208.243:22 -f -N -M
			SESS=$(ssh gimnamho.tunnel -t tmux ls | grep "windows")
			#SESS=$(ssh gimnamho -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh gimnamho.tunnel -t 'tmux -CC'
			else
				ssh gimnamho.tunnel -t 'tmux -CC attach-session -d -t 0' 
			fi

		else
			echo "matched"
			SESS=$(ssh gimnamho -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh gimnamho -t 'tmux -CC'
			else
				ssh gimnamho -t 'tmux -CC attach-session -d -t 0' 
			fi
		fi
}
function x3() {
		# MYIP=$(ipconfig getifaddr en0)
		MYIP=$(ifconfig | grep "147.47.208.152")
		echo $MYIP
		if [[ $MYIP == "" ]]; then
			echo "not matched"
			#lsof -ti:2222 | xargs kill -9
			#lsof -ti:1221 | xargs kill -9
			ssh arcgate -L 2223:147.46.219.100:22 -f -N -M
			SESS=$(ssh x3.tunnel -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh x3.tunnel -t 'tmux -CC'
			else
				ssh x3.tunnel -t 'tmux -CC attach-session -d -t 0'
			fi

		else
			echo "matched"
			SESS=$(ssh x3 -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh x3 -t 'tmux -CC'
			else
				ssh x3 -t 'tmux -CC attach-session -d -t 0'
			fi
		fi
}
function x4() {
		# MYIP=$(ipconfig getifaddr en0)
		MYIP=$(ifconfig | grep "147.47.208.152")
		echo $MYIP
		if [[ $MYIP == "" ]]; then
			echo "not matched"
			#lsof -ti:2222 | xargs kill -9
			#lsof -ti:1221 | xargs kill -9
			ssh arcgate -L 2225:147.46.219.132:22 -f -N -M
			SESS=$(ssh x4.tunnel -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh x4.tunnel -t 'tmux -CC'
			else
				ssh x4.tunnel -t 'tmux -CC attach-session -d -t 0'
			fi

		else
			echo "matched"
			SESS=$(ssh x4 -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh x4 -t 'tmux -CC'
			else
				ssh x4 -t 'tmux -CC attach-session -d -t 0'
			fi
		fi
}
function x5() {
		# MYIP=$(ipconfig getifaddr en0)
		MYIP=$(ifconfig | grep "147.47.208.152")
		echo $MYIP
		if [[ $MYIP == "" ]]; then
			echo "not matched"
			lsof -ti:2222 | xargs kill -9
			lsof -ti:1221 | xargs kill -9
			ssh arcgate -L 2226:147.46.219.138:22 -f -N -M
			SESS=$(ssh x5.tunnel -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh x5.tunnel -t 'tmux -CC'
			else
				ssh x5.tunnel -t 'tmux -CC attach-session -d -t 0'
			fi

		else
			echo "matched"
			SESS=$(ssh x5 -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh x5 -t 'tmux -CC'
			else
				ssh x5 -t 'tmux -CC attach-session -d -t 0'
			fi
		fi
}	
function a1() {
		# MYIP=$(ipconfig getifaddr en0)
		MYIP=$(ifconfig | grep "147.47.208.152")
		echo $MYIP
		if [[ $MYIP == "" ]]; then
			echo "not matched"
			lsof -ti:2224 | xargs kill -9
			lsof -ti:1221 | xargs kill -9
			ssh arcgate -L 2224:147.46.216.150:22 -f -N -M
			SESS=$(ssh a1.tunnel -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh a1.tunnel -t 'tmux -CC'
			else
				ssh a1.tunnel -t 'tmux -CC attach-session -d -t 0'
			fi

		else
			echo "matched"
			SESS=$(ssh a1 -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh a1 -t 'tmux -CC'
			else
				ssh a1 -t 'tmux -CC attach-session -d -t 0'
			fi
		fi
}
fi

function extract() {
if [[ -f $1 ]]; then
	case $1 in 
		*.tar.bz2)  tar xjf $1      								;;
		*.tar.gz)   tar xzf $1      								;;
		*.bz2)      bunzip2 $1      								;;
		*.rar)      unrar e $1      								;;
		*.gz)       gunzip $1       								;;
		*.tar)      tar xf $1       								;;
		*.tbz2)     tar xjf $1      								;;
		*.tgz)      tar xzf $1      								;;
		*.zip)      unzip $1        								;;
		*.Z)        uncompress $1   								;;
		*.7z)       7z x $1         								;;
		*.tar.xz)   tar xfJ $1     									;;
		*)          echo "'$1' cannot be extracted via extract()" 	;;
	esac
else
	echo "'$1' is not a vaild file"
fi 
}

function compress() {
if [[ -e $2 ]]; then
	case $1 in 
		*.tar.bz2)  tar -jcvf $1 $2 								;;
		*.tar.gz)   tar -zcvf $1 $2 								;;
		*.zip)      zip -r $1 $2     							 	;;
		*)          echo "'$2' cannot be compressed via compress()" ;;
	esac
else
	echo "'$1' is not a vaild file"
fi
}

function dirdiff() {
	vim -c "DirDiff $1 $2"
}

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

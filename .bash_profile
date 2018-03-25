#Basic Configuration
export EDITOR=vim
export SVN_EDITOR=vim
export FIGNORE=.svn
export LC_CTYPE=C
export LC_ALL=C
export LC_MESSAGES=C
export TERM=xterm-256color

alias ll='ls -alt'
alias lll='ls -luh'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim' 
#alias grep="grep --exclude-dir=.svn --exclude=tags --color=auto"

#ubuntu
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	    ## Auto complete
#		if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#			. /etc/bash_completion
#		fi

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

    alias ctags="`brew --prefix`/bin/ctags"
	# Setting PATH for Python 3.5
	# The orginal version is saved in .bash_profile.pysave
	PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"

	# Setting PATH for Python 2.7
	# The original version is saved in .bash_profile.pysave
	PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}" export PATH
fi

if [[ "$HOSTNAME" == "gimnamho" ]]; then
    export PYTHONSTARTUP=~/.pythonrc
    export PYTHONPATH=
    export color_prompt=yes
    #export COLORTERM=gnome-terminal
    # ~/.bashrc: executed by bash(1) for non-login shells.
    # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
    # for examples

    # If not running interactively, don't do anything
    case $- in
        *i*) ;;
          *) return;;
    esac

    # don't put duplicate lines or lines starting with space in the history.
    # See bash(1) for more options
    HISTCONTROL=ignoreboth

    # append to the history file, don't overwrite it
    shopt -s histappend

    # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
    HISTSIZE=1000
    HISTFILESIZE=2000

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # If set, the pattern "**" used in a pathname expansion context will
    # match all files and zero or more directories and subdirectories.
    #shopt -s globstar

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color) color_prompt=yes;;
    esac

    # uncomment for a colored prompt, if the terminal has the capability; turned
    # off by default to not distract the user: the focus in a terminal window
    # should be on the output of commands, not on the prompt
    #force_color_prompt=yes

    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
        else
        color_prompt=
        fi
    fi

    if [ "$color_prompt" = yes ]; then
        #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        PS1='\[\e[3m\]\[\e[32m\]\[\e[4m\]\u@\h\[\e[0;00m\]:\[\e[24m\]\[\e[0;34m\]\[\e[3m\]\w\[\e[0;24m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
    esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --exclude-dir=.svn --exclude=tags --color=auto'
    #alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -al'
#alias la='ls -A'
#alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

	BASE16_SHELL="$HOME/.config/base16-shell/base16-isotope.dark.sh"
	[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
    alias gem5arm="$GEM5/build/ARM/gem5.opt $GEM5/configs/example/se.py --cpu-type=arm_detailed --cpu-clock='2.0GHz' -n 4 --caches --l1i_size='32kB' --l1i_assoc=2 --l1d_size='32kB' --l1d_assoc=2 --l2cache --l2_size='2MB' --l2_assoc=16"
    export MY=/home/gimnamho/SVNARC/projects/typedarch/branches/namho
    export SR=svn+ssh://kkjknh2@147.46.219.120/SVN/svnroot/
    #export JSARM=/home/gimnamho/SVNARC/projects/typedarch/branches/namho/bass/mozjs17.0.0_ARM/js/src/arm
    export dswp=$MY/dswp
    export GEM5=/home/gimnamho/SVNARC/projects/typedarch/branches/gitae/dswp-o3/gem5
    export LUA=/home/gimnamho/SVNARC/projects/typedarch/branches/namho/post_dswp/lua-5.3.0/src
    export RISCV=/opt/riscv_rocc
	#export RISCV=/opt/riscv
	export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    #export PATH=$PATH:/opt/arm-unknown-linux-gnueabi/bin
    export PATH=/home/gimnamho/arm-unknown-linux-gnueabi/bin:$PATH
    export PATH=/home/gimnamho/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/lib:$PATH
    #export PATH=/home/gimnamho/SVNARC/projects/typedarch/branches/namho/bass/gcc-linaro-4.9-2016.02-x86_64_arm-linux-gnueabi/bin:$PATH
	export PATH=$PATH:$RISCV/bin
	export PATH=$PATH:$RISCV/riscv64-unknown-elf/bin
	export PATH=/opt/Xilinx/Vivado/2015.2/bin:$PATH
    #export PATH=/opt/Xilinx/Vivado/2016.2/bin:$PATH
    export PATH=/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64:$PATH
	export PATH=/opt/Xilinx/SDK/2015.2/bin:$PATH
    #export PATH=/opt/Xilinx/SDK/2016.2/bin:$PATH
	export PATH=/opt/Xilinx/SDK/2015.2/gnu/arm/lin/bin:$PATH
    #export PATH=/opt/Xilinx/SDK/2016.2/gnu/arm/lin/bin:$PATH
	export PATH=/home/gimnamho/Xilinx_Vivado_SDK_Lin_2015.2_0612_1/tps/lnx64/jre/bin:$PATH
    #export PATH=/home/gimnamho/Downloads/Xilinx_Vivado_SDK_2016.2_0605_1/tps/lnx64/jre/bin:$PATH
    #export PATH=$PATH:$HOME/x-tools/arm-unknown-linux-gnueabi/bin
    #export PATH=/home/gimnamho/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-elf/aarch64-elf/bin:$PATH
    #export PATH=/home/gimnamho/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-elf/bin:$PATH
    #export PATH=/home/gimnamho/sysroot-newlib-linaro-2016.11-aarch64-elf:$PATH
    export PATH=/usr/local/cuda/bin:/usr/local/cuda/lib64:/usr/local/cuda/lib:$PATH
    export CUDA_INSTALL_PATH=/usr/local/cuda
    export LD_LIBRARY_PATH=/lib:/usr/local/lib:/usr/lib:/usr/local/cuda/lib64:/usr/local/cuda/lib
    export DLDRAM=/home/gimnamho/SVNARC/projects/dldram
    export DSWP=/home/gimnamho/SVNARC/projects/typedarch/dswp

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
				ssh gimnamho.tunnel -t 'tmux -CC'
			else
				ssh gimnamho.tunnel -t 'tmux -CC attach -d'
			fi

		else
			echo "matched"
			SESS=$(ssh gimnamho -t tmux ls | grep "windows")
			if [[ $SESS == "" ]]; then
				ssh gimnamho -t 'tmux -CC'
			else
				ssh gimnamho -t 'tmux -CC attach -d'
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
function dirdiff() {
 vim -c "DirDiff $1 $2"
 }

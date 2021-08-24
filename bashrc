# ~/.bashrc: executed by bash(1) for non-login shells.

#-------------------------------------___# ~/.bashrc: executed by bash(1) for 
#non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for 
# examples

#*******************************************************************#             
#                        SimpleBashrc
#      Change this planet I trust and belive of that you can do it
#
#
#
####   Sorry for my grammar and spelling mistakes, my english sucks

# The comments made by me always gonna have before start and at the end a comment 
# line with a lot of asterisks like this:

#********************************************************************#

##########################################################>


# # If not running interactively, don't do anything
# case $- in
#     *i*) ;;
#       *) return;; 
# esac
# don't put duplicate lines or lines starting with space in the history. See 
# bash(1) for more options


HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it

shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)


#*******************************************************************#
# I always add more history length to the history log, it is your own log of you 
# work with the shell, because that in the history log you always find a lot of help 
# is like your own man page/tldr and library of commands made by yourself for you, 
# due that if you can lodge more information, is better. 
#*******************************************************************#

HISTSIZE=12000 HISTFILESIZE=15000

# check the window size after each command and, if necessary, update the values of 
# LINES and COLUMNS.

shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will match all 
#files and zero or more directories and subdirectories. 

# shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot) 
fi

# set a fancy prompt (non-color, unless we know we "want" color)

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;; 
esac

# uncomment for a colored prompt, if the terminal has the capability; turned off by 
# default to not distract the user: the focus in a terminal window should be on the 
# output of commands, not on the prompt

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429). 
        # (Lack of such support is extremely rare, and such a case would tend to 
        # support setf rather than setaf.)
        color_prompt=yes 
    else 
        color_prompt=yes
    fi 
fi

##########################################################
#>>>>>>>>>>>    PROMPT by DEFAULT <<<---- (★╭╮★)
##########################################################

#*******************************************************************#
# Here start the code that manage how looks your prompt, this snippet of code is 
# the config by default, if you want to change the design by default just
# type helpme and the help commands for the functions of this .bashrc
# file will be show, I have to say that this works better and more cool having
# installed all the binaries necesaries for the experimental config.
#*******************************************************************#

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\e[35m\]@\[\e[0;1;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$' 
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ' 
fi

unset color_prompt force_color_prompt
        
# If this is an xterm set the title to user@host:dir
case "$TERM" in xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" ;; *) ;; 
esac

#*******************************************************************#
# The next config helps you to improve the performance of some binaries in lest 
# words it enables the coloritation of the output of some commands
#
#  
#
#      
#          This is important little padawan, so focus in here
#                                                                                    
# Maybe the next config of aliases, do not take effect in your shell, like in 
# mine,this is because this config to be enable first test some conditions, if the 
# result of any of them is false, the aliases do not are put to work, we can solve 
# this in many easy ways, but first I gonna explain how works this tests, lol maybe 
# you already knows how it work, if that is the case you only make me lost my time 
# you little Nikola Tesla (LoL is a joke) So to enable this alias config first is 
# tested if the binary dircolors exist, if the result of this condition is true, 
# another test is done,the second test prove if the directory .dircolors exist, so 
# if any of this conditions is not satisfy the aliases will not be configured, so 
# for avoid this you can comment the lines with the evaluations or like me, put the 
# aliases directly at the end of this archive, I do not comment this because I want
# to let you this resolution at your discretion and for last I put always in the argument
# "--color", by default is automatic but nowadays mostly terminal have color support
# a least that you have the lucky of have a very old pc, that's so cool for colection
# (I love that kind of pc)but you gonna have more advantage using a pc more new, also
# it manage the energy so much better and this is the better for our world
# because we are very close of make shit our enviroment so because we need to take care 
# of our planet a very lot, due all this the value of the argument always is the best
# in any case, even if you wanna disable the color support or put in automatic, type
# helpme in your terminal for that you see with which command of experimental config and functions of this
# .bashrc file you can change all this values in automatic without have to edit this archive
# directly....(-‿◕)
#*******************************************************************#


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)" 
    alias ls='ls --color=always'
    alias dir='dir --color=always' 
    alias vdir='vdir --color=always'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always' 
    alias egrep='egrep --color=always' 
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'; alias la='ls -A'; alias l='ls -CF'


# Alias definitions. You may want to put all your additions into a separate file 
# like ~/.bash_aliases, instead of adding them here directly. See 
# /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases 
fi

# enable programmable completion features (you don't need to enable this, if it's 
# already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion 
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion 
  fi 
fi






#######################################################################>
#                         CUSTOM CONFIG
#######################################################################>

#*******************************************************************#
# Here must be your custom config(at the end of file) to avoid have a mess
# This is my standard config nowadays, feel free of coment, modify or remove all 
# you want, this don't affect nothing of this .bashrc archive
# due all is comented (LoL obviusly) or almost all because is enable(uncomented)
# the line of unmask config with the value in octal 027 I explain you how works
# all this in the next hints I don't gonna say you in which because I'm a bad person
# LoL joke, rather to force you to read all the hints, remember knowledge is power
# so if you read this hints maybe you learn anything new by more insifnificant
# that it could be, it gonna improvement your SuperPowers oh sure
# if we see the power that give you the knowledge how an extra added to yours superpowers
# that you already have, yeah we all have super powers how I, my super power of made shit
# the things in automatic, maybe could be a course for you, but for me is a bless (sometimes
# only when I have free time LOL) due it force me to repair and made
# the things again so I practice and learn more, so which are your superPowers?? take 
# advantage of they, and using it with the power of knowledge you can do amazing things  
#*******************************************************************#


#######################################################################>
#######################################################################>

#*******************************************************************#
# I have a good new and another bad, so first the good.... 
# In the next colum is all the music that for me is a very cool
# you will find a url of youtube of a playlist(Lazarus) of music to get motivation
# for code, that playlist has  been saved me  a lot the times when
# I'm very tired and I feel that can't more, also you have a long url list
# of music to work or study, and all this work in conjunt with your prompt, y
# yeah in my plans of how this should work, the prompt must to show the name of playing
# song in youtube also should be posible change the song to another from your shell,
# but here goes the really bad news, yeah rather was a good new and a
# very bad new, and is that this was only plans, Lol, I never planned 
# more concise in technical things of hows make that this happen
# also is easy make the functions yesterday I was doing that, the problem
# here is that because none link have a song tittle, the tittle must be get of the
# same you web pag of youtube when is played the song, this is easy of get,
# if you have a minimal knowledge of web develoment the song tittle is showed
# using the label h1, so with a wget and a sed command you can get it 
# easily and more cool if you use the var sustitution, you can get the name
# store in a var to print, but making tests, this is a little slow due
# wget must to download the pag, and it will be do it every time that you change 
# of song so that for me is unviable due this must work fast
# so I though maybe use cmus to do this more eficient but all the songs
# must be download with youtube-dl and this generate a additional
# dependency, so by the moment I don't gonna add this function for 
# can work in finished this repo, due this isn't vital by the moment 
# and with more time I do this more slow to take a cool choice
# so you can ignore the declare command that is at the end of this columm
# or better yet you can do and add the function already I told you how goes all this
# could be a cool task to training, also for set the songs or the playlist you 
# must run the web browser configure by default
# (at least in xfce4 using the xserver lightdm) using the binaries , x-www-browser
# or xdg-open and the setting like argument the url, any of both binaries 
# do the work
#*******************************************************************#

#######################################################################
#  __  __         _      _                      _                     _
# |  \/  |_  _ __(_)__  | |____ __   __ ___ _ _| |__     __ _ _ _  __| |
# | |\/| | || (_-< / _| | _/ _ \\ V V  / _ \ '_| / /    / _` | ' \/ _` |
# |_|  |_|\_,_/__/_\__| \__\___/ \_/\_/\___/_| |_\_\    \__,_|_||_\__,_|
#
#
#
# 
#                                    _ _           
#                         __ ___  __| (_)_ _  __ _ 
#                        / _/ _ \/ _` | | ' \/ _` |
#                        \__\___/\__,_|_|_||_\__, |
#                                            |___/ 
                                
################### Here is Lazarus, the bestplaylist of electro,minimal, progress, 
################### house, techno, bass, psy trance, hitech, etc, etc.....

####                    This list was made for inyect to you a lot of energy and 
####                    motivation.... do not abuse of it to make partys, use it 
####                    like a tool to help you to give the best you....

###########################                     HERE IS THE PLAYLIST:

##########                                          LAZARUS.........
#
###################    https://www.youtube.com/playlist?list=PL6v_pTizzCASVh6kyzCk_WcAnAYLPHnQs
#
#
#
#                       THIS IS MUSIC COOL MUSIC TO STAY FOCUS:
# 
############--> https://www.youtube.com/watch?v=4yKhCYlyyzA <--############
#             https://www.youtube.com/watch?v=n0N0iOxY0UY 
#             https://youtu.be/YPuqXLa1wuU
#             https://www.youtube.com/watch?v=6gScEA4dcBE 
#             https://www.youtube.com/watch?v=sy1dYFGkPUE
#             https://www.youtube.com/watch?v=lWvIQjz2cCY 
#             https://www.youtube.com/watch?v=f8IbpBm1OLE 
#             https://youtu.be/0yBnIUX0QAE
#             https://youtu.be/orc9nAiEG_8
#             https://www.youtube.com/watch?v=kVbGFw5u880 
#             https://www.youtube.com/watch?v=b2M7qgPJdkI 
#             https://youtu.be/hLhN__oEHaw https://youtu.be/N3eb5g9NH30 
#             https://www.youtube.com/watch?v=KqpJFAm0r_c 
#             https://youtu.be/Sv6dMFF_yts 
#             https://www.youtube.com/watch?v=J1Rd7zrvW7k 
#             https://www.youtube.com/watch?v=4JkIs37a2JE 
#             https://www.youtube.com/watch?v=NI6aOFI7hms 
#             https://youtu.be/OcaPu9JPenU 
#             https://www.youtube.com/watch?v=0zZ2bifb338 
#             https://www.youtube.com/watch?v=RvuVFHTvdaY 
#             https://www.youtube.com/watch?v=0WxDrVUrSvI 
#             https://youtu.be/5y_EjC3uUMg 
#             https://www.youtube.com/watch?v=0N9SEnTJRaw 
#             https://youtu.be/QBbJCGYKr_8 https://youtu.be/O0lf_fE3HwA 
#             https://www.youtube.com/watch?v=k8f4lcwKz6g 
#             https://www.youtube.com/watch?v=S2Cti12XBw4 
#             https://www.youtube.com/watch?v=YRgmFr1Q0X4 
#             https://www.youtube.com/watch?v=H_pRyMShJ0k 
#             https://youtu.be/AN0Cu8G4k_8 
#             https://www.youtube.com/watch?v=oBDtRwU33rk 
#             https://youtu.be/Q7hzQ7FOW6E  
#             https://youtu.be/2A2XBoxtcUA  
#             https://youtu.be/WuMDYi0-CxA  
#             https://youtu.be/dne7tscdVls  
#             https://youtu.be/WCtUCW1sDqs  
#             https://youtu.be/2WrIN7xhEks  
#             https://youtu.be/QuFb2iRhM7M  
#             https://youtu.be/ma9I9VBKPiw  
#             https://youtu.be/gH476CxJxfg  
#             https://youtu.be/w8KQmps-Sog  
#             https://youtu.be/wYkHPkTy0WA  
#             https://youtu.be/Y-h98hFYusc  
#             https://youtu.be/ubvV498pyIM  
#             https://youtu.be/xxhET61yB1A  
#             https://youtu.be/a8vGaBm9Y_4  
#             https://youtu.be/rJD5bTcYBpQ 
#             https://youtu.be/v_zZmsFZDaM 
#             https://youtu.be/KgJzb_c2iiM  
#             https://youtu.be/Usl993HxnzU  
#             https://youtu.be/DkFJE8ZdeG8  
#             https://youtu.be/Ttc_M0yR3SY  
#             https://youtu.be/qBy1_LIB2OQ  
#             https://youtu.be/4qv96L2cqa4  
#             https://youtu.be/oExYK58k0xo  
#             https://youtu.be/U5JOSn716iw  
#             https://youtu.be/BPidLpADlaM  
#             https://youtu.be/UTgzbX7SF5E  
#             https://youtu.be/Q_7r2T0vO1I  
#             https://youtu.be/x6ajmEAyWEg  
#             https://youtu.be/Djh3xFfA6-k
#             https://youtu.be/lu9tUEVQzqo  
#             https://youtu.be/WOxE7IRizjI  
#             https://youtu.be/eKQuwAmIVKA  
#             https://youtu.be/iD2xL3qqV7o  
#             https://youtu.be/PCkT4K-hppE  
#             https://youtu.be/84no_HITKFo  
#             https://youtu.be/3dIuyu1FP7o  
#             https://youtu.be/Tq7Ovshz1UI  
#             https://youtu.be/3a8q_SL9RRE  
#             https://youtu.be/OZc11vc27f8  
#             https://youtu.be/eRuV0VKINto  
#             https://youtu.be/izTXFfU32iY  
#             https://youtu.be/7-a3dTzQsDw  
#             https://youtu.be/73L-91N1Fh8  
#             https://youtu.be/-JhwxTen6yA  
#             https://youtu.be/H3T1wVewVmQ  
#             https://youtu.be/nqWZqQXk_Ao  
#             https://youtu.be/c6tB98vZ1PE 
#             https://youtu.be/s8mjqR_8lUk
#             https://youtu.be/GNTnIZtj89k
#             https://youtu.be/AvSsCo7mtk8
#             https://youtu.be/_DGm4J6DdKY
#             https://youtu.be/QraBtD-KEQg
#             https://youtu.be/S6N-s67b5jg
#             https://youtu.be/1vbZMpRTT5M
#             https://youtu.be/JAfpp-F71-Y
#             https://youtu.be/YGIzrWOuyE8
#             https://youtu.be/Lp1fQ51YZMM
#             https://youtu.be/EqkBRVukQmE
#             https://youtu.be/xrHoJ5bYqA0
#             https://youtu.be/PeQAZsyucbQ
#             https://youtu.be/CUGzWETn1HQ
#             https://youtu.be/9OCEh6g6whc
#             https://youtu.be/HKLnmMacEB4
#             https://youtu.be/dvgZkm1xWPE
#             https://youtu.be/Oextk-If8HQ
#             https://youtu.be/-aco1xqWTIw
#             https://youtu.be/qGBohd0V2Mo
#             https://youtu.be/7bK5EPjGri4
#             https://youtu.be/7siu5MQ_8s0
#             https://youtu.be/E8o5zX5dMCs
#             https://youtu.be/VRrCXECRwu4
#             https://youtu.be/XkcyIElmOxg
#             https://youtu.be/ia_Nocs7Nr4
#             https://youtu.be/WxfXzywKzYs
#             https://youtu.be/jmKNmxBYex0
#             https://youtu.be/k_OwCasz23E
#             https://youtu.be/OTluo0QId6g
#             https://youtu.be/PZjKVi7uUzM
#             https://youtu.be/zWjXipKSjdg
#             https://youtu.be/32DOcN9A0TQ
#             https://youtu.be/W7DUFLa0UUI
#             https://youtu.be/mKVEeCwdc9w
#             https://youtu.be/df2K91QSqJE
#             https://youtu.be/_9UauaXTXUI
#             https://youtu.be/OczRpuGKTfY
#             https://youtu.be/X61BVv6pLtw
#             https://youtu.be/SWSz_PAfgNc
#             https://youtu.be/TOypSnKFHrE
#             https://youtu.be/pK7egZaT3hs
#             https://youtu.be/cLnkQAeMbIM
#             https://youtu.be/4kSuJwYoxkw
#             https://youtu.be/zE7woxcB35s
#             https://youtu.be/mMfxI3r_LyA
#             https://youtu.be/CF4gibe8VAo
#             https://youtu.be/bojBxTg6Z-g
#             https://youtu.be/gtlGGw-PCtI
#             https://youtu.be/WbJNkH-pDd8
#             https://youtu.be/oKlb_0TmIxU
#             https://youtu.be/UcPyNBTkzGE
#             https://youtu.be/9FwrfWcSqyA
#             https://youtu.be/elq7Z0_UpW8
#             https://youtu.be/JAfpp-F71-Y
#             https://youtu.be/PDJkgrovDPk
#             https://youtu.be/-Uv5cV67x4A
#             https://youtu.be/zJCuMcItXvQ
#################################################>



## declare -a song  |~+>~=_/sONGzZ\_-->> 

##########################################################################
############# sHEL1 0p71oNz --Here Start the experimental configs
##########################################################################


##########################################################>

#
#    IMPORTANT All commands, alias or one liners that I will 
#    added always gonna are commented (inactivated) it's up to you if you activate 
#    them by uncomment, only a very important commands will be added enabled by 
#    default (uncommented) and the active commands always gonna are in the begin of 
#    this section.
#
# Ok here goes all commands or one liners that you want that being run when you 
# open your shell, by the way is optional the place where you put the commands in 
# this archive (.bashrc) you can put them all in place that be the best for you, in 
# my case I put almost all my custom config at the end (EOF lol) of the document, 
# this with the idea of have all sorted and keep easy find anything, even your 
# custom config also must keep sorted, in my case first I have all the aliases and 
# then the commands to be run, so in less words !! KEEP SORTED ALL ALWAYS !! maybe 
# your day is a disorder, maybe your Gnu/Linux home is a chaos, maybe the life is a 
# clutter, even your own life is a mess, maybe your room is a muddle, maybe you 
# finds order in the disorder, maybe the disorder is beneficial in some cases even 
# in the computation (entropy), but in the archive .bashrc the disorder is the dead, 
# I think that I limited myself in the last sentence, so I will correct it,have a 
# mess in the .bashrc file it is the nonstop path to an absolute and inevitable 
# death (from your .bashrc file and everything that depends on it in your system, 
# and your pc can exploit in some cases (all about your pc exploting in thousand of 
# litle pieces is a joke..smile a some)), no matters the structure or gerarchy that 
# you use for sort, the important is that it is sorted, so in this way you 
# improvement the way to find anything, and by last and more important; maybe you 
# already knows this concept, and you have many years working in this way, and you 
# use it always in all the aspects of your life, maybe you borned to sort 
# everything, maybe and that is the only purpose of your life, and if that is the 
# case, why you are reading this? This hint is for helping to the begginers, you 
# should are working, due to this, your code always have bugs... Hahahahajajajajja 
# lol is a joke, to ended this hint in a cool way, but really, get to work now and 
# change this planet for better. 
#*******************************************************************#

#*******************************************************************#
# This umask config is the best to keep a good control over the permises of use of 
# archives.
#*******************************************************************#

umask 027




############################################################################>


#*#


#*******************************************************************#
# The variable $PATH this var is a very lot useful
# and important, the function of this var is save the paths where our system gonna search for the binaries for 
# can run them only putting the name of the binary, to do this more easy of understand here a example:
# in this folder /bin there's the binaries to manage your system like touch, with this binary you can set
# the last time that was use a file, also you can create new files, so we gonna create the archive 
# hola.txt so to run it, only putting touch like this
# $ touch hola.txt
# you need to have set in the var $PATH, the absolute path of the folder(directory) in which our binary touch
# is stored, in this case the folder /bin (remember absolute paths) so one of the values of $PATH must be
# /bin in another case you must to put the absolute path of the binary every time that you wish run it, example
# $ /bin/touch hola.txt
#  every path in the var $PATH must be separate by ":" you can add the paths that you want so in the 
# next command I add a directory in which I have all 
# my custom installed binaries or executables and this is put in here when I loggin in my acount all them be load
# in $PATH, and for last to set this (to set any var enviroment) you use the command "export" how 
# this command is part of the builtin commands(run help in your terminal to see all the builtin commands), 
# you can use it without have to set their folder path, yeah all the builtin commands can be 
# run with only their names, uff I finished by now to don't confuse you but this is a lot of things to explain 
# like use ln to make a dinamyc link and linked to a folder specified in $PATH, for me is more cool set it its
# path in the var $PATH due you need super user permissions to write in some folder like /bin, anyway is just my
# way of think...animus
#*******************************************************************#





#*******************************************************************#
# This alias for nano adds the line number and soft wrap ...animus...Peace && Love
#*******************************************************************#

# alias nano='nano -l$'



#*******************************************************************#
# Here are my aliases to enable color output and use lsd (very cool and not only by 
# the name) I recomend lsd in raves or when you go out of trip and #LoL joke,
# I can't let this oportunity pass so I recommend lsd like a cool and fancy alternative to 
# binaries for list files and directories, but in my case I found some bugs that 
# make a little dificult work with it, at first it was that it don't list the directories
# that own to root when binaries like ls, dir or vdir does, according to that because I 
# made the install using snap and I didn't  set
# or add the flag --classic, this is some very cool 
# of snap that puts a limit to the installed binaries to
# avoid that they can have access to sensible info of the system 
# but when I reinstalled it with the flag --classic, the binary stops of work it
# wasn't found in the folder snap, looks like when it is run in simple way just using
# the name of binary, it is execute than before, yeah with the same limits, but if you 
# execute it using the absolute path that was /snap/lsd/51/bin/lsd it works so I think 
# that this bug is due to the config by defaul of the binary snap because you run $ which lsd 
# it return you the path /snap/bin/lsd that is a dinamyc link to the binary snap located 
# in the path /usr/bin/snap but due I didn't debugged it more by the time,so only 
# I use the solution more fast that passed for my mind, and it was make a dinamyc link of the binary 
# /snap/lsd/51/bin/lsd to the folder $HOME/bin/lsd and with this I solve that bug without use super user permisses
# this only works until the next update due is change the name (number) of the folder in which is locate the binary
# to a to a larger number, and the dinamyc link is cuted LoL, so that is all, about how do temp solution if you 
# have the same bug that me, right now it run it with the deafult mode when it is installed that is the with the
# jail mode that is force to set with the argument --jail, anyway for me it work so cool so I recommend it to use
# due it looks so cool and for last right now I'm setted the next alias for lsd the before worked is cool 
# for the colors but without it is more useful for due in a terminal with a window size of less size is show a big 
# so much number of files so it that let you to view in many cases, all the files listed with don't need to scrooll
# down and losing your focus making this, and the argument --icon-theme set a icon theme to show you with 
# icons the type of archive listed, due without it the aparence of the icons is on a kind of error.
#                           for install it type this
#                           snap install (--classic or --jail or anything) lsd
#                           https://github.com/Peltoche/lsd 
#*******************************************************************#

# alias lsd='lsd --icon always --icon-theme unicode'


#*******************************************************************#
# Ok in this alias I put this to make the remove task more fast, wihout the binary 
# still question you if you want to remove these file, this is dangerous in some 
# cases, so take this with care 
#*******************************************************************#

# alias rm='rm --interactive=never'




#*******************************************************************#
# Ok the next alias is for a binary very cool you must install yes or yes, due it 
# is very helpful(sometimes), it give you another kind of of documentation like a 
# man page but with examples of use of the command in my case that I read a lot 
# man, I can say that, with many commands the explanantion of the man is very 
# literal or technical, and is very hard understand how work with the binary, in 
# that cases tldr helps you a lot with examples of use from the perspective of the 
# a normal user ,here a example, I dare you to use the command nsenter, only get 
# info of its man page, anyway tldr in some cases can save you, if the page of the 
# command exist, we have a lot on clients of tldr install it is easy, but with snap 
# is even easier, in snap we have 2 clients but this is the best for me you only 
# needs type in your shell
#
#    snap install tldr-luk3yx
#
#  and the alias is only to make short the command
#
#*******************************************************************#

# alias tldr='tldr-luk3yx'

#*******************************************************************#
# The next alias help you to give you more color to stdout(standard output, 
# you need to learn all acronym like this is very important) of lsblk,
# using ccat and my color scheme dark let's do this
# fast this command list the disps connected to your pc
# this command for me is very important,and here I gonna use the argument -f
# so due that you can't add more arguments, it will give you erros
#*******************************************************************#

# alias impblk='lsblk -f|ccatdark'


#*******************************************************************#
# The next command have a very special quality, it have the power of make you 
# smile every time that you open a Terminal, so yeah, this binary is very powerful 
# and useful, you can install it, with the next command:
#
#          $ sudo apt update && sudo apt install cornyjokes
# The idea of put this command here is print a joke then of print the content
# of the archive "comandos.txt", so animus and smile more...
#*******************************************************************#

# cornyjokes




#*******************************************************************#
# This command help us when you open your terminal, it prints the options
# of the shell that is enable
#*******************************************************************#

#shopt



#*******************************************************************#
# Ok here start the function to change the prompts for anothers  more cools, remember that this
# looks more cool if you install the terminal emulator "Terminator" (https://gnometerminator.blogspot.com/p/introduction.html)
# also use my themes for terminator, all gonna looks amazing the repo is "Shelltrific" (https://github.com/TitanHero/Shelltrific)
# all this right now must be do at hand but right now I'm gonna start to work in the installer to do this all this in automatic
# also you can visit the repo LittleScript(under develoment) due all this was and is make for it (https://github.com/TitanHero/LittleScript)
#*******************************************************************#

##########################################################
#>>>>>>>>>>>          In this part goes the all related to the prompts ☠☠☠☠☠ (-‿◕)
#>>>>>>>>>>>          I need to say that here is only a few number of prompts this due
#>>>>>>>>>>>          the mostly prompts that I made are for the repo LittleScript  
#>>>>>>>>>>>          and so much prompts don't show info is only the desing
#>>>>>>>>>>>          this works very cool for LittleScript due to the way in the which I
#>>>>>>>>>>>          have planned how must to work LittleScript, but relax, I gonna add
#>>>>>>>>>>>          all these and all that I will be invent in this repo https://github.com/TitanHero/ImperialOrder
#>>>>>>>>>>>          but right now this repo only have a lot of bragging and nothig of code, 
#>>>>>>>>>>>          LoL  this is only by right now, maybe I'm  a faker so let's will see   
#>>>>>>>>>>>          how much bluff is when be its turn to work in it, due right now I change my way
#>>>>>>>>>>>          way of work to get results fastly yeah I'm working in a repo until finished
#>>>>>>>>>>>          Anyway we need to have faith and patience...just remember.....
#>>>>>>>>>>>          the world is made of LOVE && PEACE....lol, I don't know why but I feel wants to say and put this in here lol
##########################################################




#*******************************************************************#
# LoL I already have all prepared I only put and let the before code of the
# prompt to make it all more exciting and see if you are reading the hints so you can 
# remove the before code due it is unusefull it starts from the last #>>>>>>>>>>>
# until the start of this hint so here goes by the moment and first this humble prompts
# just wait me a some because also I need to add the functions of the helpme and the helpme
# function in question ...lol you need installed the command binary toilet to all this could 
# work how was though (-‿◕)
# for install toilet only run the install script installer.sh or use the next command
#         sudo apt install toilet
#*******************************************************************#



#declare impdefault="$PS1"

#declare basics="\[\e[0m\]\[\033[0;4;36;45m\]\[\033[9;12;22m\]░▒▒░▒▓\[\e[0m\]\[\033[4;9;35m\]▒░▒░▒\[\e[0m\]\[\033[2;4;36m\]░░░░▓$(toilet -F metal -f term $(tb|tail -n 3)) \[\e[0m\]\[\033[1;35;46m\]\n▒Hour\[\033[2;4;36m\]\[\033[6;7;34m\][\T}\[\e[0m\]\[\033[1;36m\]-~>░▒\[\e[7m\]░$(uptime -p)░▒\[\e[0m\]░▒\[\e[7m\] \[\e[0m\]\[\e[1;7;44m\](>‿◠)✌*\[\e[0m\]\[\e[0m\]▒-╼ ҉>[\[\e[41m\]░▒\[\e[0m\]\n ╒=╝\342\225\274\[\e[7m\]\PID\[\e[0m\]░\[\e[1;33m\]$$\[\e[0m\]▒\342\225\274~<{ OldPwd ~\342\224\200>{ $OLDPWD ]\n \[\e[7m\]┋\[\e[0m\]\[\e[1;32m\]░ ҉\[\e[1;31m\]tty\[\e[1;30m\]}~->[\[\e[1;7;43m\]$(tty) \[\e[0m\]\[\e[1;7;30m\]─[HistoryNumber ]}+->(\[\e[1;7;43m\]\!\[\e[0m\]\n╔╝\[\e[0;4;9m\]\nǁ\[\033[0;1;4;9;97m\]╓\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200")[\[\033[0;39m\]UserID\[\033[1;4;34m\]$UID\e[0m─[\[\033[0;1;7;40m\]\u\[\033[31m\]@\e[32m\h\e[0m\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]LAstUpdatE\[\033[0;31m\]]\[\033[0;31m\]┋\e[7m\342\224\200\e[0m\342\225\274\342\224\200\[\e[1;32;46m\]I♥$MACHTYPE\[\033[0;4;37m\]animo\n\e[0;1;4;7;35m$?\[\e[0;1;4;31m\]┋҉░\[\e[0;4;7;36m\]\#\[\e[0m\]-╼\[\e[0;1;4;31m\](\[\e[0;1;32m\]\w\[\e[0;1;4;31m\])\[\e[0;4m\]\n╚\[\e[0;1;7;40m\]▒ ҉~─>\[\e[0;1;7;9;31m\]$\[\e[0;9m\] \[\e[0;1;35m\]░\[\e[0;1;31m\]"

#declare nextFuturePrompt="\[\e[1;1;4;36;42m\]░▒\[\e[7;4;33m\]▓ ҉\[\e[33;41m\]╼\u\[\e[m\]\[\e[1;36;42m\]@\[\e[m\e[1;7;4;37;42m\]\h\[\e[m\]\[\e[7;9m\]]\[\e[m\]\[\e[9;30;42m\]-\[\e[7;9m\]╼\[\e[0m\]\[\e[1;7;9;35;45m\] ҉\[\e[m\]\n\[\e[7m\]▒░╼r2╼ ҉\w\[\033[0;1;31m\]"

#declare terprompt=" \[\e[4;9m\] ┌\[\e[0;2;36m\]                       \n\[\033[0;4;34m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;1;7;31m\]\342\234\227\342\234\227 \[\e[0;33m\]Last Command error \[\e[1;7;9m\]\$?\[\033[0;1;34m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;1;4;36;45m\]\w\[\e[0;1;34m\]─╼\[\033[0;1;36m\]\u\[\033[0;01;35m\]@\[\033[01;31m\]\h\[\e[0;1;4;32m\]~-~{\[\e[0;7;35m\]UId\[\e[0;4;7;36m\]$UID]\[\e[0m\]'; fi)\[\033[0;33m\]>\[\033[0;35m\]\!\[\033[0;9;36m\]}\n\[\e[0;1;4;9;35m\]  └─\[\e[0;1;36m\]\$\[\e[0;1;32m\]"

#declare lexprompt="\n\[\e[0;4;7;30m\]\T\n\[\e[0;9m\]╘\[\e[0;1;4;7;33m\]😉\$(echo \$((\# - 1)))\[\e[1m\]\[\e[0;4;9;30m\]=\[\e[0;1;7;35m\]$?\[\e[0;1;4;9m\]_┌\[\e[0;1;4;36m\]  \[\e[9m\]_~┭_~ ┉ \[\e[1;9;30m\]|╒__-\[\e[7m\]┭~ \[\e[0m\]\#\n\[\033[0;1;4;7;9;34m\]╘\[\e[0;1;4;9;34m\]┮\[\033[1;4;7;9;34m\]╞\$([[ \$? != 0 ]] && echo \"[\[\033[0;1;7;31m\]\342\234\227\342\234\227\342\234\227\[\e[0;33m\]LastCommand \$(fc -l|tail -n 1) \[\e[1;7;9m\]\$(echo '\$?')\[\033[0;1;34m\]\342\224\200\")\[\e[0;4;9;30m\]╃\[\e[7m\]╾$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;1;7;32m\]\w\[\e[0;1;4;9;34m\]╼░>\n╠\[\e[35m\]┭\[\e[1;4;9;34m\]╝\[\e[30m\]░▒▓{\[\e[0;1;31;46m\]≐\[\e[0;1;4;9;34m\]}┮\[\e[1;4;9;32m\]╘\[\033[0;1;36m\]\u\[\033[0;1;35m\]@\[\033[01;31m\]\h\[\e[0;9m\]]\[\e[34m\]_\[\e[30m\]{\[\e[0;7;35m\]UId\[\e[0;4;7;36m\]$UID\[\e[0m\]'; fi)\[\033[0;4;9;30m\]}|[\[\033[0;1;4;35m\]$HOSTTYPE\[\033[0;9;36m\]}~|\n\[\033[0m\]\[\033[0;4;35m\]╘\[\033[7m\]┄\[\033[9;35m\]╒\[\e[0m\]\[\033[0;4;9;35m\]╯\[\e[0;4;9m\]┭\[\e[0;4;9;30m\]~\n {\[\033[0;4;9;34m\]╘\[\e[0;9m\]░\[\e[0;1;7;30m\]\$\[\033[0;1;31m\]"

#declare orbitalprompt="\[\e[0;1;9;33m\]> \[\e[0;1;34m\]\u\[\e[0;4;9m\]▒\[\e[0;1;33m\]\h\[\e[1;35m\]░\[\e[0;4;33m\]\w \[\e[7m\]\w╼~~ ҉\[\e[3;35m\]\w\[\e[0;1;30m\]♥҉\[\e[0;1;31m\]$\[\e[0;9;32m\] \[\e[0m\]>\[\e[0m\]"

#declare parrotprompt="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]rootEd\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h';fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\342\224\224\[\e[4m\]{\!]\[\033[0;31m\]\342\224\200\342\224\200\342\225\274\[\033[0m\]\#\[\e[1;7;33m\]\$\[\e[0m\]"

#declare lightOrder="\[\033[01;32m\]\u\[\e[35m\]@\[\e[0;1;32m\]\h\[\033[00m\]:Command:\! Display \[\e[0;1;35m\]$DISPLAY\[\e[0;1;36m\] $DESKTOP_SESSION $XDG_CURRENT_DESKTOP\[\e[0;34m\] Shell \[\e[0;4m\]$SHELL \[\e[0m\]Lvl:\[\e[1;7;35m\] $SHLVL \[\e[0m\] TermVersion $VTE_VERSION: xdgSessionID: $XDG_SESSION_ID \n\[\e[4m\]╚\[\e[0;1;7;40m\]░▒ ҉ \w\n\[\e[0m\] ┋҉ ~─\#>\[\e[0;1;7;9;31m\]\$\[\e[0;9m\] \[\e[0;1;7;36m\]░\[\e[0;1;32m\]"

#declare rocketPrompt="\[\e[0;1;34m\] ҉ ҉                          \[\e[0m\]\u\[\e[1;35m\]  ҉\[\e[0m\]\h  \$?\[\e[1;9;31m\]~ ░҉  ҉~░҉\[\e[0;4;34m\]\!\[\e[1;9;36m\]  ҉░҉\\n\[\e[0;1;6;10;34m\]] ҉\w ҉ ҉\[\e[0;1;31m\]░҉\[\e[0;34m\]▒҉\[\e[7;9;36;45m\]]\[\e[0;1;9;31m\]}m\[\e[0;30;47m\]▒▒╼╼░─҉\[\e[1;33m\]♥\[\e[0;1;31;47m\]✌\[\e[0;9;31m\]$\[\e[0;1;9m\]>\[\e[34m\]\n ҉ ҉\[\e[0;9;32m\] ░\[\e[0;34m\]"

#declare rocketPromptMini="]\[\e[0;1;34m\] ҉ \[\e[0;32m\]\w░҉▒҉\[\e[0;1;7;9;36;47m\]▒\[\e[0;1;9m\]]m\[\e[0;1;36;40m\]╼╼─\[\e[0;1;9;36m\]>\[\e[36m\]  \[\e[0;7;35;43m\]\u\[\e[0;9;35m\]░҉\[\e[0;1;4;7;33;46m\]\h\[\e[0;5;9;34;45m\]╼\[\e[7m\] \[\e[34m\]$\[\e[1;30m\]҉▒\[\e[0;5;9;34m\]  ҉\n▒\[\e[0m\]"

#declare abstracTech="\[\e[0;1;4;35m\]҉ \[\e[0m\]ǁ┋\[\e[1;32m\]░\[\e[0;4;9;36;45m\]┋\[\e[0;1;32m\]\u\[\e[0m\]@\[\e[4;35;42m\]\h\[\e[0m\]\[\e[1;30m\]░▒\[\e[0;1;36;40m\]┋\[\e[0;1;4;32;46m\]░\[\e[4;33;42m\]┋\[\e[0;4;37m\]=\[\e[0m\]-╼\[\e[7m\]$SHELL👌\[\e[0m\] $(toilet -F gay -f term ' ҉╼✌(>‿◠)✌-╼┋[▒]')\[\e[1;31m\]\[\e[0m\]▒\[\e[1;9;45m\]+=\[\e[0m\]>\[\e[1;30m\] ҉ $(tty)┋\[\e[41m\]\[\e[0m\]\[\e[1;34;48m\]\[\e[1;6;7;9;10m\]\n ҉\[\e[0;1;4;9;36;44m\]░҉▒҉\[\e[0;4;33m\]▒░\[\e[6;7;35;43m\]\[\e[0m\]\[\e[1;4;33m\]▒\[\e[0;1;4;34;42m\]$҉\[\e[9m\]▒\[\e[0;34m\]"

#declare flowersForEveryone="\[\e[0;9;32m\]$\[\e[0;1;9;30m\]]҉\[\e[0;1;36m\]>╼\[\e[0;7;34m\]~╼\[\e[9m\]{░\[\e[0;7;34m\]\w\[\e[0;9;35;42m\]─҉♥ ҉ \u\[\e[0;1;9;36m\] ╼\[\e[0;1;31m\]ꙮ \[\e[0;1;4;7;9;33;42m\]\h\[\e[0;4;7;9;32;45m\]\n▒>\[\e[0m\]"

#declare hippiePower="\n\[\e[0;1;7;9;40m\]▒ ҉~─>\[\e[0;1;7;9;31m\]$?\[\e[0;9m\] \[\e[0;1;7;9;36m\] ҉ \[\e[0;1;9;33m\e[0m\]"

#declare galactical="\n\[\e[0;4;7;9;36m\]╚\[\e[0;1;40m\]▒ ҉~─>\[\e[0;1;4;9;33m\]~\[\e[0;9m\] \[\e[1;36m\] ҉\[\e[0;1;4;9;7;35m\]\n $\[\e[0m\]"

#declare proManiac="\n\[\e[0;4;7;9;36m\]╚\[\e[0;1;40m\]▒ ҉~─>\[\e[0;1;4;9;33m\]~\[\e[0;9m\] \[\e[1;36m\] ҉\[\e[0;1;4;9;7;33m\]$\[\e[0m\]"

#declare espiral="\[\033[01m\]\n\[\e[0;4;7;9;36m\]╚\[\e[0;1;45m\]▒\[\e[7m\] ҉~─>\[\e[0;1;4;9;33m\]~\[\e[0;4;9m\]\[\e[1;36m\] ҉\[\e[0;1;4;7;33m\] \[\e[0m\]"

#declare runFaster="\[\e[0m\]{$?|\u|\h|\s|\#|\!|$SHELL|$OLDPWD|$MACHTYPE|\[\e[0;9m\]\n╚\[\e[0;4;7;9;33m\]~⦕⦕⦕⦕\[\e[0;1;4;9;36m\]\w] ҉\[\e[0;1;7;31m\]\[\e[0;31m\]>"

#declare commandShit="\[\e[0;35m\]LastCommmand Shit\n\[\e[0;4;9;36m\]╚\[\e[0;1;40m\]▒ ҉~─>\[\e[0;1;31m\]Error~ \[\e[0;4;9m\] \[\e[0;1;36m\] ҉\[\e[0;1;33m\] \n😆 😉 🤯 🤓 \[\e[4;7;9;33m\] \[\e[0m\]"

#declare abstractLazy="\[\e[7;9;36;44m\]]░҉҉▒҉}▒҉╼҉\[\e[0m\]\u\[\e[34m\]@\[\e[0;36m\]\h\[\e[32;43m\]╼҉{\[\e[m\]\[\e[31;42m\]\[\e[0m\]>\w\n\[\e[1;31m\]$\[\e[0m\]"

#declare neverGiveup=""

#*******************************************************************#
# Here start the alias that set the prompts
#*******************************************************************#

##alias impn=''

##alias imp='toilet -F metal:border -f term"Prompt, just Smile making the Peace && Love" ; export PS1=$nextFuturePrompt'

##alias impdf='toilet -F gay:border -f term "PromptIt, you can do it champion" ; export PS1=$impdefault'

##alias impt='toilet -F metal:border -f term "ChangePrompt,smile more" ; export PS1=$terprompt'

##alias impo='toilet -F metal:border -f term "NewPrompt, for save the planet" ; export PS1=$orbitalprompt'

##alias impl='toilet -F gay -f term "PrompItUp helping to others" ; export PS1=$lexprompt' 

##alias imppa='toilet -F gay:border -f term "PromptIt, making good actions" ; export PS1=$parrotprompt'

##alias impli='toilet -F gay:border -f term "Prompt The Planet,with so much pacifism and Love" ; export PS1=$lightOrder'

##alias impba='toilet -F metal:border -f term "Prompt changed...with Love and Peace" ; export PS1=$basics'

##alias imprk='toilet -F gay:border -f term "Here comes the new Prompt..Peace && Love" ; export PS1=$rocketPrompt'

##alias impat='toilet -F metal -f term "Peace...Love...&& Prompts" ; export PS1=$abstracTech'

##alias imprkm='toilet -F gay:border -f term "You can do it CHAMPION, smile here is your new Prompt" ; export PS1=$rocketPromptMini'

##alias impe='toilet -F metal:border -f term "A flower for a cool person, you can change the planet if you want..."; export PS1=$flowersForEveryone'

##alias imphippie='toilet -F gay -f term "A prompt with a little big dose of hippie power"; export PS1=$hippiePower'

##alias impga='toilet -F metal -f term "Lets make it work, so here is this new prompt"; export PS1=$galactical'

##alias imppm='toilet -F gay:border -f term "Do you know that lick latch is illegal in anothers planets??? Smile \n fresh pR0Mpt\n Peace && Love....animus"; export PS1=$proManiac'

##alias impga='toilet -F metal:border -f term "Never give up...get motivation with this prompt"; export PS1=$espiral'

##alias imprf='toilet -F gay -f term "Run fast to your goals, this new prompt gonna help to do it....You can do it"; export PS1=$runFaster'

##alias impcs='toilet -F gay:border -f term "Amazing effort,a big will and a lot of smiles have this Prompt"; export PS1=$commandShit'

##alias impal='toilet -F metal -f term "Simple prompt, bigger dreams, keep trying"; export PS1=$abstractLazy'

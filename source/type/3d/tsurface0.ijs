
dbg 1
dbstop ''
require 'numeric'

dat=. (];];sin@*/~) i:2j70
pd 'reset'
pd 'type surface'
pd 'edgecolor 64 64 64'
pd 'mesh 1'
pd 'backcolor lightgray'
pd dat
pd 'show'


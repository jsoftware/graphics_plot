
require 'numeric trig'

pd 'reset'
dat=. (;];*/&sin~) steps _2 2 100

pd 'backcolor teal'

pd 'new 0 80 500 840'
pd 'type density'
pd 'mesh 0'
pd 'bandcolor grayscale'
pd 'titlefont arial 25 italic'
pd 'title Gray-Scale Density'
pd dat

pd 'new 500 80 500 840'
pd 'mesh 0'
pd 'type density'
pd 'titlefont arial 25 italic'
pd 'title Color-Coded Density'
pd dat
pd 'show'

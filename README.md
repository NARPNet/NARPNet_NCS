# NARPNet_NCS

NCS Macros for the NARPNet Digital Net


## Current status

**This is VERY preliminary at this point.**  

Just my first draft of a set of macros.  I am learning more and more about
FLDIGI and macros as I do this.  Things will definitley change.  Maybe 
drastically.

We need discussion among others to end up with a generally acceptable set of
macros.  Please use the Discussions area of this repo for that.  If there are
any actual bugs, please talk about them in Discussions first and then report an
Issue if necessary.

I may make an initial downloadable zip file release in Releases soon.


## Overview

These macros are intended to make it as simple as practical for NCS's to run
the NARPNet Digital Net.  Making it simple is helpful in promoting more NCS's
to help shoulder the load of running a reliable weekly net.

A macro file for the net is there to reduce typing and to define a standard flow
of the net.  The macros basically chop the flow of the net into little pieces,
some of which are used multiple times in a row -- like asking if there are any 
more check-ins.

These macros were patterned after those distributed by AmRRON.  The net flow
defined in the NARPNet NCS macros was patterned off of both AmRRON and SEEN
nets.  Also, the NARPNet NCS macros are more tailored to having a team of 
NCS's rather than a single operator.


### The Macro Files

To use these, you really need to tell FLDIGI to show the 48 macros with 
*View / View/Hide 48 macros*.  This will show all 48 maxcro buttons.

The files are really subject to change but here is a basic decription of
what's there right now.

* `NARPNet_NCS.mdf`: the main NARPNet NCS macro file.  
  * The green buttons on the left are numbered in order of the flow of the net.  
  * The red buttons in the middle are general "operator" functions (i.e., not 
  necessaily NCS).  
  * The blue buttons on the right are things that dont transmit anything.  They
  just configure things and such.

* `NARPNet_OP.mdf`: So far this is just the NCS file with the NCS stuff 
deleted.  It's just there in cast the participants of the net want a macro
file to make it easier to check-in, send traffic and stuff.

### The Data Files

These are files in the `files` dir used by the NCS macro files.  They are 
transmitted verbatim without any macro tag replacements.

* `CHECKINS.txt`: This is the most important and most used file.  It contains 
the check-ins that the NCS has seen so far.  It is where the NCS record the
checkins and is transmitted in full in `Ck-ins Call` (to ACK early check-ins) 
and in `Ck-in Roster` (to list of all the check-ins at the end of the net).

* `NCS_REMARKS.txt`: This is transmitted in the preamble to the net (`START.2`).
The idea is that the NCS might have announcement or other info to contribute.
The idea is that there will be something different here to make the net a little
different each week.  SEEN uses quotes with a blurb of explanation, etc.  Could
be short commentary on current events, etc.

* `NCS_CLOSING.txt`: This is similar to `NCS_REMARKS.txt` and is transmitted in 
the closing of the net.  The NCS's personal way of signing off.

* `NCS_TFC.txt`: This is a list of files that the NCS will transmit to the net.
It is filled out in advance before each net.  It is used in the `NCS_TFC` macro.

* `AmCON_Level.txt`: The current AmRRON level from the AmRRON home page.  A nod
in support of AmRRON.  Easy to get and update.  Doesnt change much.  Not sure
if this will stay or not.

* `NWOTW.txt`: not used in the NCS macros, but is there in the `AmR Checkin`
macro so make AmRRON checkins easier for operators.  There is also a 
`Edit NWOTW` macro that being up the file in a text editor to make it easy
to change.




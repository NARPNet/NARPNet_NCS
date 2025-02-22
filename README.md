# NARPNet_NCS Macros

NCS Macros for the NARPNet Digital Net.


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

These macros are intended to make it as simple as practical for NCS's to run the
NARPNet Digital Net.  Making it simple is helpful in promoting more NCS's to
help shoulder the load of running a reliable weekly net.

A macro file for the net is there to reduce typing and to define a standard flow
of the net.  The macros basically chop the flow of the net into little pieces,
some of which are used multiple times in a row -- like asking if there are any
more check-ins.

These macros were patterned after those distributed by AmRRON.  The net flow
defined in the NARPNet NCS macros was patterned off of both AmRRON and SEEN
nets.  Also, the NARPNet NCS macros are more tailored to having a team of NCS's
rather than a single operator.

*The following is just a description of the files and such.  It is not intended
to be a users manual that describes how to use the macros to run a net.  That
documentation will come in time as the macros stabilize a bit.*


### The Macro Files

To use these, you really need to tell FLDIGI to show the 48 macros with *View /
View/Hide 48 macros*.  This will show all 48 maxcro buttons.

The files are really subject to change but here is a basic decription of what's
there right now.

* `NARPNet_NCS.mdf`: the main NARPNet NCS macro file.  
  * The green buttons on the left are numbered in order of the flow of the net.  
  * The red buttons in the middle are general "operator" functions (i.e., not
  necessaily NCS).  
  * The blue buttons on the right are things that dont transmit anything.  They
  just configure things and such.

* `NARPNet_OP.mdf`: So far this is just the NCS file with the NCS stuff deleted.
It's just there in cast the participants of the net want a macro file to make it
easier to check-in, send traffic and stuff.

### The Data Files

These are files in the `files` dir used by the NCS macro files.  They are
transmitted verbatim without any macro tag replacements.

* `CHECKINS.txt`: This is the most important and most used file.  It contains
the check-ins that the NCS has seen so far.  It is where the NCS record the
checkins and is transmitted in full in `Ck-ins Call` (to ACK early check-ins)
and in `Ck-in Roster` (to list of all the check-ins at the end of the net). I
believe that it was suggested in the AmRRON macros that this file not be saved
or archived in any way because it contains FCC call signs which are personally
identifying information.  We should probably handle it this way for privacy
reasons.

* `NCS_REMARKS.txt`: This is transmitted in the preamble to the net (`START.2`).
The idea is that the NCS might have announcement or other info to contribute.
Another reason is so that there will be something to make the net a little
different each week.  SEEN uses quotes with a blurb of explanation, etc.  
Could be short commentary on current events, etc.  Whatever the NCS thinks is
appropriate.

* `NCS_CLOSING.txt`: This is similar to `NCS_REMARKS.txt` and is transmitted in
the closing of the net.  The NCS's personal way of signing off.  Some of the
AmRRON NCS's have colorful and humorous ways of signing off.

* `NCS_TFC.txt`: This is a list of files that the NCS will transmit to the net.
It is filled out in advance before each net.  It is used in the `NCS_TFC` macro.

* `AmCON_Level.txt`: The current AmRRON level from the AmRRON home page.  A nod
in support of AmRRON.  Easy to get and update.  Doesnt change much.  Not sure
if this will stay or not.

* `NWOTW.txt`: not used in the NCS macros because we decided in discussions that
we would not implement NTOTW in the NARPNet Digital Net.  But this file there in
the `AmR Checkin` utility macro to make AmRRON checkins more convenient for
operators.  There is also a `Edit NWOTW` macro that brings up the file in a text
editor to make it easy to change (see below on the edit macros).

### The Setup Files

There are two setup files that perform the same function on Windows and Linux:
`setup.bat` (Windows) and `setup.sh` (Linux).

The idea is that you copy the NCS macros and the `files` dir with the data files
to where you want to store your macros (like in your `fldigi.files/macros`) dir
and then run the setup script.  All it does is fix the file paths in the macro
files to match you macro location through simple string replacement.  This is
necessary because FLDIGI seems to want to full path to the file.  There seems to
be no default dir for relative paths except for the current working directory of
the running FLDIGI executable.

The setup files are there to eliminate, as much as possible, the need to
manually edit the macros.  Hopefully this will make it easier on folks who
aren't accustomed to doing this sort of stuff.

### The Edit Macros

Some of the macros call up a text editor to edit the data files in the `files`
dir.  This is entirely optional and the text editor to be used is defined by the
end user's system and personal preferences.  Here are some caveats based on my
experiences playing with it.

First, FLDIGI is prone to crash when calling external programs with its `EXEC`
macro if it's not setup exactly right.  You can lose any changes to your macro
files or config if you havent saved them before it crashes.  FLDIGI seems to
like some programs and dispise others and I havent delved into why.  I don't
think the `EXEC` macro was actually written to launch text editors, but you can
make it work and it really does make editing the data files much easier.

In Windows, `notepad.exe` seems to work fine for a single file like the NWOTW.
However, AFAIK, you can't specify multiple files on the notepad command line.
For bringing up a tabbed editor with all the NCS data file in it, I have found
that Visual Studio Code works great on both Windows and Linux.  It's free and is
a great editor.  I would rather specify something that comes by default on the
OS, but couldnt find a multi-tabbed editor that FLDIGI was happy with.  Perhaps
more work can be put into this.

### The `NCS MACROS` and `OP MACROS` buttons

So, I discovered FLDIGI's `MACROS` macro which lets you load a different macro
file.  This essentially lets you implement multiple macro "pages" to further
organize your macros.  Strangely, it's not hard to use all 48 macros.

I recently discovered this feature and used it to switch between
`NARPNet_NCS.mdf` and `NARPNet_OP.mdf`.  This feature may lead to the greatest
amount of change to how this macro set is organized.


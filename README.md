# NARPNet NCS Macros

NCS Macros for the NARPNet Digital Net.


## Current status

**This is VERY preliminary at this point.**  

Just my first draft of a set of macros.  I am learning more and more about
FLDIGI and macros as I do this.  Things will definitely change.  Maybe
drastically.

We need discussion among others interested in being NCS operators to end up with
a generally acceptable set of macros.  Please use the Discussions area of this
repo for that.  If there are any actual bugs, please talk about them in
Discussions first and then report an Issue if necessary.  To participate in
Discussions or file Issues, you must have a GitHub account.

You can [download the latest
pre-release](https://github.com/NARPNet/NARPNet_NCS/releases/latest/).  Look
under Assets and ignore the source code zips.  Also see the [preliminary installation instructions, below](#preliminary-installation-instructions).


## Overview

These macros are intended to make it as simple as practical for NCS's to run the
NARPNet Digital Net.  Making it simple is helpful in promoting more NCS's to
help shoulder the load of running a reliable weekly net.

A macro file for the net exists to reduce typing and to define a standardized
flow of the net.  The macros basically chop the flow of the net into little
pieces, some of which are used multiple times in a row -- like asking if there
are any more check-ins.

These macros were patterned after those distributed by AmRRON.  The net flow
defined in the NARPNet NCS macros was patterned after both AmRRON and SEEN nets.
Also, the NARPNet NCS macros are more tailored to having a team of NCS operators
rather than a single operator.

*The following is just a description of the files and such.  It is not intended
to be a users manual that describes how to use the macros to run a net.  That
documentation will come in time as the macros stabilize a bit.*


### The Macro Files

To use these macro files, you really need to tell FLDIGI to show the 48 macros
with *View / View/Hide 48 macros*.  This will show all 48 macro buttons.

These files are likely to change but here is a basic description of what's there
right now.

* `NARPNet_NCS.mdf`: the main NARPNet NCS macro file.  
  * The green buttons on the left are numbered in order of the flow of the net.  
  * The red buttons in the middle are general "operator" functions (i.e., not
  necessarily NCS).  
  * The blue buttons on the right are things that don't transmit anything.  They
  just configure things and such.

* `NARPNet_OP.mdf`: So far this is just the NCS file with the NCS stuff deleted.
It's just there in case the participants of the net want a macro file to make it
easier to check-in, send traffic and stuff.

### The Data Files

The data files are in the `files` dir and are used by the NCS macros for
information that changes from net to net.  They are transmitted verbatim without
any macro tag replacements.

* `CHECKINS.txt`: This is the most important and most used file.  It contains
the check-ins that the NCS has seen so far.  It is where the NCS records the
check-ins as the net progresses.  The file is transmitted in full in `Ck-ins
Call` (to ACK early check-ins) and in `Ck-in Roster` (to list of all the
check-ins at the end of the net). I believe that it was suggested in the AmRRON
macros that this file not be saved or archived in any way because it contains
FCC call signs which are personally identifying information.  We should probably
handle the check-in data carefully for privacy reasons.

* `NCS_REMARKS.txt`: This is transmitted in the preamble to the net (`START.2`).
The idea is that the NCS might have an announcement or other info to contribute.
Another reason is so that there will be something to make the net a little
different each week. SEEN uses quotations with a blurb of explanation, etc. Or,
it could be a short commentary on current events, etc.  Whatever the individual
NCS thinks is appropriate.

* `NCS_CLOSING.txt`: This is similar to `NCS_REMARKS.txt` and is transmitted in
the closing of the net.  This is the individual NCS's personal way of signing
off.  Some of the AmRRON NCS's have colorful and humorous ways of signing off.
Having a variety of NCS operators with different personalities also helps keep
the net from seeming cold and stagnant.

* `NCS_TFC.txt`: This is a list of files that the NCS will transmit to the net.
It is filled out in advance before each net.  It is used in the `NCS_TFC` macro.

* `AmCON_Level.txt`: The current AmRRON level from the AmRRON home page.  It is
a nod in support of AmRRON.  Easy to get and update.  Doesn't change much.  Not
sure if this will stay a part of the net or not.

* `NWOTW.txt`: not used in the NCS macros because we decided in discussions that
we would not implement NWOTW in the NARPNet Digital Net.  But this file is used
in the `AmR Checkin` utility macro to make AmRRON check-ins more convenient for
operators.  There is also a `Edit NWOTW` macro that brings up the file in a text
editor to make it easy to change (see below on the [edit
macros](#the-edit-macros)).

### The Setup Files 

There are two setup files that perform the same function on Windows and Linux:
`setup.bat` (Windows) and `setup.sh` (Linux).

The idea is that you copy the NARPNet_NCS dir to where you want to store your
macros (like in your `fldigi.files/macros` dir) and then run the setup script.
You can double click it from your file manager. All it does is fix the file
paths in the macro files to match your macro location through simple string
replacement based on the location of the setup script. This is necessary because
FLDIGI seems to want to want the full path to the file.  There does not seem to
be a default dir for relative paths except for the current working directory of
the running FLDIGI executable.

The setup files are there to eliminate, as much as possible, the need to
manually edit the macros.  Hopefully this will make it easier on regular folks
who aren't accustomed to doing this sort of stuff.

### The Edit Macros

Some of the macros call up a text editor to edit the data files in the `files`
dir.  This is entirely optional and the text editor to be used is defined by the
end user's operating system and personal preferences.  So, you will have to
tweak this macro for your environment.  Here are some caveats based on my
experiences playing with it.

First, FLDIGI is prone to crash when calling external programs with its `EXEC`
macro if `EXEC` isn't called exactly right. So, until you get it tweaked right, be
prepared to FLDIGI to crash when you click the button.  If it crashes you can
lose any unsaved changes to your macro files or config (ask me how I know).
FLDIGI seems to like some programs and despise others and I haven't delved into
why.  I don't think the `EXEC` macro was intended to launch text editors, but
you can make it work and it really does make editing the data files much easier
when you don't have to open the filesystem browser and navigate to where the
files are.

In Windows, `notepad.exe` seems to work fine for a single file like the NWOTW.
However, AFAIK, you can't specify multiple filenames on the notepad command
line. For bringing up a tabbed editor with all the NCS data files in it, I have
found that Visual Studio Code works great on both Windows and Linux (on Linux,
install the .deb/.rpm package from the vscode site, not the flatpack -- it must
have /usr/bin/code). It's free, based on open source (like Chrome vs Chromium),
and it's a great editor.  I would rather specify an editor that comes by default
on the OS, but couldn't find a built-in, multi-tabbed editor that FLDIGI was
happy with. Perhaps more work can be put into this.

### The `NCS MACROS` and `OP MACROS` buttons

So, I discovered FLDIGI's `MACROS` macro which lets you load a different macro
file.  This essentially lets you implement multiple macro "pages" to further
organize your macros.  Strangely, it's not hard to use all 48 macros.

I recently discovered this feature and used it to switch between
`NARPNet_NCS.mdf` and `NARPNet_OP.mdf`.  This feature may lead to the greatest
amount of change to how this macro set is organized.

## Preliminary Installation Instructions

If you want to play with the macros, here are some basic installation
instructions to point you in the right direction.
- Download and extract the [latest pre-release
  zip](https://github.com/NARPNet/NARPNet_NCS/releases/latest/) (file is under
  "Assets").
- Copy the inner `NARPNet_NCS` dir to your `<HOME>/fldigi.files/macros`
  directory.
- Run the setup script:
  - Windows: double click on `setup.bat` (should complete without errors).
  - Linux: double click on `setup.sh` (should complete without errors).
    - You probably have to make it executable first.
    - You might have to tell it to run the script in a terminal.
    - You *might* have to fix Windows line termination in the script file and
      maybe all the data files in the files dir.  This will be addressed somehow
      in future releases.  Maybe via a zip for Windows and a tar for Linux.
- Open FLDIGI.
- Make sure that your call sign, first name, county and state are filled out in
  the FLDIGI Operator config.
- Make sure that the 48 macro buttons are visible with `View -> View/Hide 48
  macros`.
- Use `File / Macro / Open` to open the `NARPNet_NCS.mdf` file.
- Test the file locations using the `Test NCS Files` macro button: it should
  dump the contents of all the NCS data files without errors.
- DON'T click on the edit macro buttons unless you are prepared for FLDIGI to
  crash until you get them tweaked right. 
  - The `Edit NWOTW` button should work on Windows because it edits a single
    file using notepad.
- Once `Test NCS Files` is working correctly, play with the macros at will.  If
  you right click on them, they have comments at the top that explain them a
  little bit.

Please report your experiences in the GitHub Discussion area or via email to
lobanz@protonmail.com.  Thanks!

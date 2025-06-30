NCS Macros for the NARPNet Digital Net
--------------------------------------

Documentation is in the GitHub Wiki: 

  https://github.com/NARPNet/NARPNet_NCS/wiki


Installation
------------

(To upgrade the macros to a different version, see next section.)

Please see the documentation link above for detailed written and video 
instructions on installation and use.

The basic installation is as follows:
- Extract the distribution archive (zip or tgz).
- Copy the NARPNet_NCS dir in to your FLDIGI macros dir.
- From the NARPNet_NCS dir in the FLDIGI macros dir, run setup.bat (Windows)
  or setup.sh (Linux)

IMPORTANT: Don't press the Edit macro buttons until you have configured them
according to the documentation referenced above.  Otherwise FLDIGI will crash.


Upgrading
---------

To upgrade the macros to a different version:
- Take note of your text editor path in your existing Edit macro buttons.
- Close FLDIGI.
- Rename the NARPNet_NCS folder in your FLDIGI macros dir to a different 
  name such as "NARPNet_NCS.old".
- Follow the installation process above, including running the setup script.  
- Copy all the files from the "files" dir of the old macros dir to the "files" 
  dir in the new macros dir, overwriting the new files with the old ones.
- Open FLDIGI.
- In FLDIGI, edit each of the edit button macros and correct your text editor 
  path. 
  - There is an edit button on each macro page except Personal.  
  - NOTE that you have to save each macro file you edit BEFORE switching 
    pages or FLDIGI will lose your changes.
- Keep the old macros dir around until you feel confident that you have 
  everything you need from it.


Overview
--------

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


Contact
-------

Please report your experiences in the GitHub Discussion area or via email to
lobanz@protonmail.com.  Thanks!


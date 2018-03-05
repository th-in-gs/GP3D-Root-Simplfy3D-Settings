# GP3D Root Simplify3D Settings

This is how I use Simplify3D with my GP3D Root 3D printer. It seems to be a great printer, hobbled by its slightly weird setup and bad software. With S3D working, I'm really happy with it.

Here are a .fff "FFF profile", a .frm firmware configuration file, and a double-clickable .command file, for Mac, to get USB communication working.

I think that the Root is basically a slightly modified rebadge of the Weistek Ideawerk WT150, so this might help anyone trying to get that working in S3D too.

These files are for use in Simplify3D 4.0.1 - make sure that's the version you're using, in 4.0.0, to cut a long story short, not everything works.

If these are useful to you, I'd love to hear from you - jamie@montgomerie.net.


## Three Things of Note!

### Connecting to the printer over USB

I prefer printing over USB (I really can't see the 3D printing world's fascination with sneakernetting around SD cards - what's up with that?)

Unfortunately, the Root appears at first to not be able to talk to S3D - starting communication always fails. Fortunately, that's fixable.

The TL;DR if you're using a Mac: as I am, double-click the "Stall Simplify3D While Connecting To Printer.command", quickly switch to S3D, open the "Machine Control Panel" from the "Tools" menu, and hit "Connect". Connection should establish! If it doesn't, try again.

The explanation: what happens is that the Root resets itself whenever a connection is established. It’s then unresponsive to serial input for a few seconds while it reboots. It’s during that unresponsive time that S3D tries to establish communication - so it ends up thinking it can’t talk to the printer.

With many printers, you could just uncheck "Wait for startup command" in the S3D's communication settings - but that doesn't work here, because then S3D assumes ASCII communication. The Root uses the binary communication protocol.

The command file waits for three seconds, to let me click the connect button, then puts the S3D process to sleep for five seconds, to allow the printer to reset, then wakes it up again, by which time the connection is ready to use. S3D correctly intuits that should use binary communication, and everything is happy.

If you're using Linux or Windows, you will similarly somehow need to pause the Simplify3D process just after it starts to connect. Something like the Mac command file should also work on Linux. I'm not sure how you'd do it on Windows, but I'm sure it must be possible.


### Binary communication

Even though I use USB, the "Export File Format" has to be set to .x3g in the "Scripts" pane of the "FFF Settings" for things to work! Boy, did that take some time to figure out.


### Setting the Z-height

The printer doesn't seem to have a build volume defined in its firmware. I use the "Machine Definition" settings in the "G-Code" pane in S3D's process settings to set this. Note that both the "Build Volume" Z-axis height, _and_ the Z-Axis "Origin Offset" are set to the Z-height of the build volume.

It used to be really complicated to figure this out, but in Simplify3D 4.0.1 (not 4.0.0!), the Jog Controls in the Machine Control panel work, which makes it relatively easy.

With the printer connected (see above), open the "Machine Control Panel" from the "Tools" menu. Make sure the "Jog Controls" pane is selected.  Jog the bed up a bit (this is a little unintuitive - use the "-Z" buttons to move the bed up - think of it as moving the print head down).

Choose "Home All". Next, click "Zero X", "Zero Y, and "Zero Z". Move the print head into the center of the bed, and jog the bed up until it's _just_ touching the nozzle. 

Move around the X and Y axis, and adjust the plate leveling screws until it's uniformly the traditional "business card height" away from the nozzle. The negative of the number in the Z field is then the number I use in the "Build Volume" and "Origin Offset" fields in S3D described above.

This is analogous to how GP3D's instructions suggest you set the Z-height in Germinate.

Curiously, it does seem to drift, so I sometimes find myself adjusting the values in S3D by 0.2mm or so in either direction until the first layer prints well.


### Acknowledgements

Thanks to the folks participating in these forum threads, my journey to getting this to work started with these forum posts:

* http://hardy-parts.xobor.de/t62f38-Simplify-d-fuer-WT.htm (and all of http://hardy-parts.xobor.de/f33-Weistek-ideawerk-dprinter-WT.html, generally)
* http://rootprinting.forumotion.com/t13-root-profile-for-cura (and the rest of http://rootprinting.forumotion.com/ too)
* ...and [this thread on the S3D forums](https://forum.simplify3d.com/viewtopic.php?f=8&t=7023), where my travails were chronicled.



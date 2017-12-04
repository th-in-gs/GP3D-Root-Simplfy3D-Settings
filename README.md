# GP3D Root Simplify3D Settings

This is how I use Simplify3D with my GP3D Root 3D printer. It seems to be a great printer, hobbled by its slightly weird setup and bad software. With S3D working, I'm really happy with it.

Here are a .fff "FFF profile", a .frm firmware configuration file, and a double-clickable .command file, for Mac, to get USB communication working.

If these are useful to you, I'd love to hear from you - jamie@montgomerie.net.

## Three Things of Note!

### Connecting to the printer over USB

I prefer printing over USB (I really can't see the 3D printing world's fascination with sneakernetting around SD cards - what's up with that?)

Unfortunately, the Root appears at first to not be able to talk to S3D - starting communication always fails. Fortunately, that's fixable.

The TL;DR: if you're using a Mac, as I am, double-click the "Stall Simplify3D While Connecting To Printer.command", quickly switch to S3D, open the "Machine Control Panel", and hit 'Connect'. Connection should establish! If it doesn't, try again.

The background: what happens is that the Root resets itself whenever a Connection is established. It’s then unresponsive to serial input for a few seconds while it reboots. It’s during that unresponsive time that S3D tries to establish communication - so it ends up thinking it can’t talk to the printer.

With many printers, you could just uncheck "Wait for startup command" in the S3D's communication settings - but that doesn't work here, because then S3D assumes ASCII communication. The Root uses the binary communication protocol.

The command file waits for three seconds, to let me click the connect button, then puts the S3D process to sleep for five seconds, to allow the printer to reset, then wakes it up again, by which time the connection is ready to use. S3D correctly intuits that should use binary communication, and everything is happy.


### Setting the Z-height

The printer doesn't seem to have a build volume defined in its firmware. I use the "Machine Definition" settings in the "G-Code" pane in S3D's process settings to set this. Note that both the "Build Volume" Z-axis height, _and_ the Z-Axis "Origin Offset" are set to the Z-height of the build volume.

To get the number I'm using - which may vary slightly from what you need - I use ReplicatorG, downloaded from http://www.ideawerk3dprinter.com/12.html, in the "IdeaWerk WT150" section. 

I run ReplicatorG, open the control panel, "Make Current Position Zero", "Enable" the stepper motors, then jog the Z-axis up, move around the X and Y axis, and adjust the plate leveling screws until it's uniformly the traditional "business card height" away from the nozzle. The negative of the number in the Z field is then the number I use in the Z-axis fields in S3D described above.

This is analogous to how GP3D's instructions suggest you set the Z-height in Germinate.

Curiously, it does seem to drift, so I sometimes find myself adjusting the values in S3D by 0.2mm or so in either direction until the first layer prints well.

I wish I could do this all in S3D, but for some reason, its control panel Z-jog controls don't move the bed on the Root. I haven't been able to work out why.

I'd love it if anyone knew a better way to do this.


### Binary communication

Even though I use USB, the "Export File Format" has to be set to .x3g in the "Scripts" pane of the "FFF Settings" for things to work! Boy, did that take some time to figure out.

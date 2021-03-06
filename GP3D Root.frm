setExtruderTempGcode,M104 S$ T#
stabilizeExtruderTempGcode,M109 S$ T#
setBedTempGcode,M140 S$
stabilizeBedTempGcode,M190 S$
reportTempGcode,M105
fanPowerGcode,M106 S$
fanOffGcode,M107
movementOverrideGcode,M220 S$
extrusionOverrideGcode,M221 S$
laserOnGcode,M600 S255
laserOffGcode,M601
syncLaserGcode,M400
initializeSD,M21
listSDfiles,M20
selectSDfile,M23 $
startSDprint,M24
pauseSDprint,M25
reportSDstatus,M27
homeAxisGcode,G28
toolchangeGcode,M108 T$
emergencyStopGcode,M112
enableMotorsGcode,M17
disableMotorsGcode,M18
waitForStartupCommand,1
startupCommand,start
serialAcknowledge,ok
commentChar,;
dwellGcode,G4 P$
macro1name,Macro 1
macro1,
macro2name,Macro 2
macro2,
macro3name,Macro 3
macro3,
allowCommandBuffering,0
serialCacheSize,63
includeLineNumbersAndChecksums,0
flowControlMethod,1
useCommunicationTimeout,1
timeoutMilliseconds,30000
GPXconfig,r2
XstepsPerMM,71.699959
YstepsPerMM,71.699959
ZstepsPerMM,71.699959
AstepsPerMM,100.4709550000
BstepsPerMM,100.4709550000
AaxisHasHBP,0
BaxisHasHBP,0

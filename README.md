# FD-bug
I throw an error and catch it in an actionscript worker. FlashDebugger stops at the throw statement although the error is caught successfully. It is just [a simple try-catch](https://github.com/S-Aoi/FD-bug/blob/master/src/BackgroundWorker.as):
```
try 
{
	throw new Error('will stop here');
}
catch (err:Error)
{
	trace('also be excuted');
}
```

---
title: "Multitrack-recording from SuperCollider to Ableton (on Windows 10)"
date: "2022-05-02"
draft: false
---

Last weekend I managed to get a multitrack routing from TidalCycles/SuperCollider to Ableton in Windows 7 using JACK. For anyone still interested in this, here's a quick tutorial:

What you'll need to do is install [JACK for Windows](https://jackaudio.org/downloads/) first.
Then go `C:\Program Files\JACK2\jack-router` or wherever you installed it to and open the `JackRouter.ini` file in the `win32` (or `win64` folder respectively), which should look like this:

![step 1](/MultitrackAudioToAbletonWin10/01.jpeg)

In there, you should change the 2nd line to the desired number of channels that you want. (I got it working with 8, but when going above 8 I got errors in SuperCollider sometimes.)

Next, launch `C:\Program Files\JACK2\qjackctl\qjackctl.exe` -> `Settings` - under `Driver` choose `portaudio` and under `Advanced` use settings similar to these:

![step 2](/MultitrackAudioToAbletonWin10/02.jpeg)

(Note that "UA25" is my soundcard, so you should choose your sound device or use ASIO4ALL. ASIO is the best choice for getting multi track audio, but you can try the other options in there as well.)

Click `Apply` and then `Okay`.
In `qjackctl` click the Start button with the green arrow.

Then, in `SuperCollider` evaluate these two lines:

```
Server.default.options.inDevice_("ASIO : JackRouter");
Server.default.options.outDevice_("ASIO : JackRouter");
```

and boot with your startup script. (Make sure to assign enough orbits as explained here: [Audio Outputs | Tidal Cycles](http://tidalcycles.org/docs/configuration/AudioConfig/audio_outputs/))

Now in the SC post window it should say:

```
Requested devices: 
In (matching device found): - ASIO : JackRouter  
Out (matching device found): - ASIO : JackRouter
```

Click the `Graph` button in `qjackctl` and you should see something like this:
![step 3](/MultitrackAudioToAbletonWin10/03.jpeg)

Now open up Ableton, go to `Options` -> `Preferences` and choose these settings:
![step 4](/MultitrackAudioToAbletonWin10/04.jpeg)

(Make sure to activate the 8 audio inputs under `Input Config` like in the picture.)

Then go back to `qjackctl` Graph and re-connect the wires there like so:

![step 5](/MultitrackAudioToAbletonWin10/05.jpeg)

...and that's basically it!

![step 6](/MultitrackAudioToAbletonWin10/06.jpeg)

Set up your audio tracks in Ableton and GO!
---
title: "SuperCollider links and resources collection"
date: "2025-03-28"
draft: false
tags:
  - coding
  - SuperCollider
---

## Some great SC projects

- Bhob Rainey's Xynthi, where I'm working on an update on right now, because it doesn't run in SuperCollider 3. You can [help me and send me a pull request](https://github.com/and-kal/XynthiSC3/).

- All the [monome norns](https://norns.community/) scripts are written in SuperCollider (and [Lua](http://www.lua.org/))

- [Airsynth](https://github.com/schollz/airsynth)

- https://patchstorage.com/mm-granulator-synth-with-full-gui/

- [nuPG 1.0](https://github.com/marcinpiet/nuPG_1.0)

- [Ripple](https://web.archive.org/web/20111007041602/http://www.morganpackard.com/Ripple/Ripple.zip) - a free musical environment by Morgan Packard (currently Mac OS only)

- well commented [patches from Daniel Mayer's SuperCollider course](../static/cmaktuell.zip) at TU Berlin

## A bunch of useful SuperCollider links

- [asStream](http://subnaught.org/supercollider/)
- [Catalog of symbolic notations in SuperCollider - SuperCollider 3.2 help files](http://danielnouri.org/docs/SuperColliderHelp/Language/SymbolicNotations.html)
- [Computer Music Journal | MIT Press](https://direct.mit.edu/comj)
- [Dave's Blog | a blog about programming and music processing](https://www.davehofmann.de/)
- [Designing Sound in SuperCollider - Wikibooks, open books for an open world](https://en.wikibooks.org/wiki/Designing_Sound_in_SuperCollider?fbclid=IwAR3ztj0PdqxNzUaSLsuR4atKtwgRcyQtHAj_-318jI_LJheyiVAvorB_q4I)
- [Essays - Gwern.net](https://www.gwern.net/index)
- [GitHub - madskjeldgaard/awesome-supercollider: 💻🎹🎛🔊 A curated list of SuperCollider stuff](https://github.com/madskjeldgaard/awesome-supercollider)
- [How to Program in SuperCollider](http://sc3howto.blogspot.com/)
- [https://theseanco.github.io/howto_co34pt_liveCode/](https://theseanco.github.io/howto_co34pt_liveCode/)
- [Musica Informatica – computer music history and more](https://www.musicainformatica.org/)
- [Operators - SuperCollider 3.2 help files](http://danielnouri.org/docs/SuperColliderHelp/Language/Operators.html)
- [sc-users@lists.bham.ac.uk](https://sc-users.bham.ac.narkive.com/)
- [scsynth](https://scsynth.org/)
- [Supercollider « Coding, Sounds and Colors | A blog about algorithmic experiments in music and visual art. Sort of.](http://www.kimri.org/blog/?cat=2)
- [SuperCollider | Platforms | Patchstorage](https://patchstorage.com/platform/supercollider/)
- [SuperCollider Code](https://sccode.org/)
- [SuperCollider Diary](https://nagasm.org/ASL/SuperCollider/index5.html)
- [SuperCollider JazzMutant Tutorial](https://web.archive.org/web/20060714191322/http://www.jazzmutant.com/workshop_softrelatedissueslist.php?id=supercollider)
- [SuperCollider SS2016 1](https://de.slideshare.net/chikashi1/supercollider-ss2016-1?fbclid=IwAR3pAXgRHZZ06YwqPbmodqaViAa4uS8kbjf7lj2o4Zc3zeq-AUOkpDzRkGE)
- [SuperCollider swiki](https://swiki.hfbk-hamburg.de/MusicTechnology/6)
- [Supercollider Tasks](http://rhoadley.org/courses/tech_resources/supercollider/tasks/BBCut.php)
- [SuperCollider, Real-time and Interactive: course (SC code) | Stelios Manousakis](http://modularbrains.net/portfolio/supercollider-real-time-interactive-course-sc-code/)
- [The SuperCollider Home Page](http://www.audiosynth.com/)
- [TidalCycles Quick Reference compiled and partially rewritten documentation from various sources](https://gist.github.com/mxactvtd/bf3fb357a419c7f063b98dfd9a66cf78)
- [User:Crantila/FSC/Synthesizers/SuperCollider/Basic Programming - Fedora Project Wiki](https://fedoraproject.org/wiki/User:Crantila/FSC/Synthesizers/SuperCollider/Basic_Programming#.22Do_This_While.22)

## bugfixes

### SuperCollider server bootup error on Windows 

Sometimes Windows is blocking SuperCollider from accessing its ports, because of Hyper-V/WSL accessing these ports, too, or something like that, which will result in the following error messages: `ERROR: Primitive '_GetLangPort' failed` or `ERROR: Primitive '_NetAddr_SendMsg' failed`. You can usually fix this by restarting the Windows NAT Driver service. Start an elevated Powershell and run:

```powershell
net stop winnat
net start winnat
```

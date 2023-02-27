---
title: "How I backup and stream movies at home"
date: "2023-01-11"
draft: true
---


## MinIO and OpenMediaVault on RPi 
- I have an old Raspberry Pi 1 with OpenMediaVault on it and an external harddrive with my movies.
- It's directly connected to my router and so functions as a NAS.
- I can put my movies there or download them via FTP, SMB etc..

## Kodi as media center
- For playing and streaming movies I use Kodi, which is running on a Raspberry Pi 3.
- (For organizng movies I use tinyMediaManager by the way.)
- Kodi streams movies via SMB from the NAS.

## NAS with Object Storage
- Next to OMV I will also have [MinIO installed](https://www.alevsk.com/2020/03/build-your-own-private-cloud-at-home-with-a-raspberry-pi-minio/) on the old RPi 1.
- With MinIO I create an Object Storage and put the relevant folder(s) from my external hard drive in there (for example /movies/).

## Mirroring my NAS to the Cloud
- Now that I have an Object Storage on my RPi I can mirror that to some S3-compatible cloud solution (or set up my own cloud). I found that Scaleway offers 75GB of free S3 storage. Not enough for my movie collection, but a good start.
- I will just have mirror my MinIO storage to Scaleway using [mc mirror](https://min.io/docs/minio/linux/reference/minio-mc/mc-mirror.html) (which is similar to rsync).
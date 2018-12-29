# SIP телефония

Влючаем debag 
```
asterisk -rvvvv
sip set debug on
core set debug 5
core set verbose 5
```
* debag
```
<--- SIP read from TLS:192.168.32.239:5060 --->
INVITE sip:89267683777@192.168.32.2 SIP/2.0
Via: SIP/2.0/TLS 192.168.32.239:5060;branch=z9hG4bK-5f305b86
From: "470" <sip:470@192.168.32.2>;tag=84d082c75cd9738ao0
To: <sip:89267683777@192.168.32.2>
Call-ID: 68255d4b-b574bad6@192.168.32.239
CSeq: 101 INVITE
Max-Forwards: 70
Contact: "470" <sip:470@192.168.32.239:5060;transport=tls>
Expires: 240
User-Agent: Cisco/SPA303-7.5.6a
Content-Length: 574
Allow: ACK, BYE, CANCEL, INFO, INVITE, NOTIFY, OPTIONS, REFER, UPDATE
Supported: replaces
Content-Type: application/sdp

v=0
o=- 173522214 173522214 IN IP4 192.168.32.239
s=-
c=IN IP4 192.168.32.239
t=0 0
m=audio 16454 RTP/SAVP 0 2 8 9 18 96 97 98 101
a=rtpmap:0 PCMU/8000
a=rtpmap:2 G726-32/8000
a=rtpmap:8 PCMA/8000
a=rtpmap:9 G722/8000
a=rtpmap:18 G729a/8000
a=rtpmap:96 G726-40/8000
a=rtpmap:97 G726-24/8000
a=rtpmap:98 G726-16/8000
a=rtpmap:101 telephone-event/8000
a=fmtp:101 0-15
a=ptime:30
a=sendrecv
a=crypto:1 AES_CM_128_HMAC_SHA1_32 inline:1NAz9oV2XCcgnmmqFxyCAz+dHX5Zj0A/xtEUcieI
a=crypto:2 AES_CM_128_HMAC_SHA1_80 inline:1NAz9oV2XCcgnmmqFxyCAz+dHX5Zj0A/xtEUcieI

```
ну и так далее
```
<--- Reliably Transmitting (no NAT) to 192.168.32.239:5060 --->
SIP/2.0 401 Unauthorized
Via: SIP/2.0/TLS 192.168.32.239:5060;branch=z9hG4bK-5f305b86;received=192.168.32.239
From: "470" <sip:470@192.168.32.2>;tag=84d082c75cd9738ao0
To: <sip:89267683777@192.168.32.2>;tag=as2d21649d
Call-ID: 68255d4b-b574bad6@192.168.32.239
CSeq: 101 INVITE
Server: FPBX-2.11.0(11.24.0)
Allow: INVITE, ACK, CANCEL, OPTIONS, BYE, REFER, SUBSCRIBE, NOTIFY, INFO, PUBLISH, MESSAGE
Supported: replaces, timer
WWW-Authenticate: Digest algorithm=MD5, realm="asterisk", nonce="39038dc9"
Content-Length: 0

<------------>
<--- SIP read from TLS:192.168.32.239:5060 --->
ACK sip:89267683777@192.168.32.2 SIP/2.0
Via: SIP/2.0/TLS 192.168.32.239:5060;branch=z9hG4bK-5f305b86
From: "470" <sip:470@192.168.32.2>;tag=84d082c75cd9738ao0
To: <sip:89267683777@192.168.32.2>;tag=as2d21649d
Call-ID: 68255d4b-b574bad6@192.168.32.239
CSeq: 101 ACK
Max-Forwards: 70
Contact: "470" <sip:470@192.168.32.239:5060;transport=tls>
User-Agent: Cisco/SPA303-7.5.6a
Content-Length: 0

<------------->
[2018-12-10 17:16:16] VERBOSE[6245] chan_sip.c: --- (10 headers 0 lines) ---
[2018-12-10 17:16:16] VERBOSE[6245] chan_sip.c: 
<--- SIP read from TLS:192.168.32.239:5060 --->
INVITE sip:89267683777@192.168.32.2 SIP/2.0
Via: SIP/2.0/TLS 192.168.32.239:5060;branch=z9hG4bK-36d37f7e
From: "470" <sip:470@192.168.32.2>;tag=84d082c75cd9738ao0
To: <sip:89267683777@192.168.32.2>
Call-ID: 68255d4b-b574bad6@192.168.32.239
CSeq: 102 INVITE
Max-Forwards: 70
Authorization: Digest username="470",realm="asterisk",nonce="39038dc9",uri="sip:89267683777@192.168.32.2",algorithm=MD5,response="4b68e0918a9a35c21eabbc85b29c52f1"
Contact: "470" <sip:470@192.168.32.239:5060;transport=tls>
Expires: 240
User-Agent: Cisco/SPA303-7.5.6a
Content-Length: 574
Allow: ACK, BYE, CANCEL, INFO, INVITE, NOTIFY, OPTIONS, REFER, UPDATE
Supported: replaces
Content-Type: application/sdp

v=0
o=- 173522214 173522214 IN IP4 192.168.32.239
s=-
c=IN IP4 192.168.32.239
t=0 0
m=audio 16454 RTP/SAVP 0 2 8 9 18 96 97 98 101
a=rtpmap:0 PCMU/8000
a=rtpmap:2 G726-32/8000
```


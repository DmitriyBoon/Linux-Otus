# SIP телефония

* sip show channels
```
srv-elastix1*CLI> sip show channels
Peer             User/ANR         Call ID          Format           Hold     Last Message    Expiry     Peer      
XXXXXXXX
XXXXXXXX
10.10.8.130      771              10e15ff17755d60  (g722)           No       Init: INVITE               771       
143 active SIP dialogs
```

* sip show channel 10e15ff17755d60
```
srv-elastix1*CLI> sip show channel 10e15ff17755d60

  * SIP Call
  Curr. trans. direction:  Outgoing
  Call-ID:                10e15ff17755d60d4ab5b8687fa5ab24@192.168.10.3:5060
  Owner channel ID:       SIP/771-0001632b
  Our Codec Capability:   (g722)
  Non-Codec Capability (DTMF):   1
  Their Codec Capability:   (nothing)
  Joint Codec Capability:   (g722)
  Format:                 (g722)
  T.38 support            No
  Video support           No
  MaxCallBR:              384 kbps
  Theoretical Address:    10.10.8.130:57228
  Received Address:       10.10.8.130:57228
  SIP Transfer mode:      open
  Force rport:            Yes
  Audio IP:               192.168.10.3 (local)
  Our Tag:                as0456d5f2
  Their Tag:              fe32a80d
  SIP User agent:         Zoiper r29701
  Username:               771
  Peername:               771
  Original uri:           sip:771@10.10.8.130:57228;rinstance=d1efc20bf7ebd455;transport=UDP
  Caller-ID:              771
  Need Destroy:           No
  Last Message:           Init: INVITE
  Promiscuous Redir:      No
  Route:                  <sip:771@10.10.8.130:57228>
  DTMF Mode:              rfc2833
  SIP Options:            (none)
  Session-Timer:          Inactive
  Transport:              UDP
  Media:                  RTP
```

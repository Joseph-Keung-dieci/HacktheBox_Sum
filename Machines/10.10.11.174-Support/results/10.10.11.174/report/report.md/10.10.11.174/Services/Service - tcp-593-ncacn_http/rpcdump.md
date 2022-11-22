```bash
impacket-rpcdump -port 593 10.10.11.174
```

[/home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp593/tcp_593_rpc_rpcdump.txt](file:///home/parallels/HacktheBox/Machines/10.10.11.174-Support/results/10.10.11.174/scans/tcp593/tcp_593_rpc_rpcdump.txt):

```
Impacket v0.10.0 - Copyright 2022 SecureAuth Corporation

[*] Retrieving endpoint list from 10.10.11.174
Protocol: [MS-NRPC]: Netlogon Remote Protocol
Provider: netlogon.dll
UUID    : 12345678-1234-ABCD-EF00-01234567CFFB v1.0
Bindings:
          ncacn_ip_tcp:10.10.11.174[49684]
          ncalrpc:[NETLOGON_LRPC]
          ncacn_np:\\DC[\pipe\b9ddb0d0c39c8cf9]
          ncacn_http:10.10.11.174[49674]
          ncalrpc:[NTDS_LPC]
          ncalrpc:[OLE4A8F030E837042CAFAE2B863F657]
          ncacn_ip_tcp:10.10.11.174[49668]
          ncacn_ip_tcp:10.10.11.174[49664]
          ncalrpc:[samss lpc]
          ncalrpc:[SidKey Local End Point]
          ncalrpc:[protected_storage]
          ncalrpc:[lsasspirpc]
          ncalrpc:[lsapolicylookup]
          ncalrpc:[LSA_EAS_ENDPOINT]
          ncalrpc:[lsacap]
          ncalrpc:[LSARPC_ENDPOINT]
          ncalrpc:[securityevent]
          ncalrpc:[audit]
          ncacn_np:\\DC[\pipe\lsass]

Protocol: [MS-RAA]: Remote Authorization API Protocol
Provider: N/A
UUID    : 0B1C2170-5732-4E0E-8CD3-D9B16F3B84D7 v0.0 RemoteAccessCheck
Bindings:
          ncalrpc:[NETLOGON_LRPC]
          ncacn_np:\\DC[\pipe\b9ddb0d0c39c8cf9]
          ncacn_http:10.10.11.174[49674]
          ncalrpc:[NTDS_LPC]
          ncalrpc:[OLE4A8F030E837042CAFAE2B863F657]
          ncacn_ip_tcp:10.10.11.174[49668]
          ncacn_ip_tcp:10.10.11.174[49664]
          ncalrpc:[samss lpc]
          ncalrpc:[SidKey Local End Point]
          ncalrpc:[protected_storage]
          ncalrpc:[lsasspirpc]
          ncalrpc:[lsapolicylookup]
          ncalrpc:[LSA_EAS_ENDPOINT]
          ncalrpc:[lsacap]
          ncalrpc:[LSARPC_ENDPOINT]
          ncalrpc:[securityevent]
          ncalrpc:[audit]
          ncacn_np:\\DC[\pipe\lsass]
          ncalrpc:[NETLOGON_LRPC]
          ncacn_np:\\DC[\pipe\b9ddb0d0c39c8cf9]
          ncacn_http:10.10.11.174[49674]
          ncalrpc:[NTDS_LPC]
          ncalrpc:[OLE4A8F030E837042CAFAE2B863F657]
          ncacn_ip_tcp:10.10.11.174[49668]
          ncacn_ip_tcp:10.10.11.174[49664]
          ncalrpc:[samss lpc]
          ncalrpc:[SidKey Local End Point]
          ncalrpc:[protected_storage]
          ncalrpc:[lsasspirpc]
          ncalrpc:[lsapolicylookup]
          ncalrpc:[LSA_EAS_ENDPOINT]
          ncalrpc:[lsacap]
          ncalrpc:[LSARPC_ENDPOINT]
          ncalrpc:[securityevent]
          ncalrpc:[audit]
          ncacn_np:\\DC[\pipe\lsass]

Protocol: N/A
Provider: efssvc.dll
UUID    : 04EEB297-CBF4-466B-8A2A-BFD6A2F10BBA v1.0 EFSK RPC Interface
Bindings:
          ncacn_np:\\DC[\pipe\efsrpc]
          ncalrpc:[LRPC-05dd9120fa0ea3ebac]

Protocol: N/A
Provider: efssvc.dll
UUID    : DF1941C5-FE89-4E79-BF10-463657ACF44D v1.0 EFS RPC Interface
Bindings:
          ncacn_np:\\DC[\pipe\efsrpc]
          ncalrpc:[LRPC-05dd9120fa0ea3ebac]

Protocol: [MS-LSAT]: Local Security Authority (Translation Methods) Remote
Provider: lsasrv.dll
UUID    : 12345778-1234-ABCD-EF00-0123456789AB v0.0
Bindings:
          ncacn_np:\\DC[\pipe\b9ddb0d0c39c8cf9]
          ncacn_http:10.10.11.174[49674]
          ncalrpc:[NTDS_LPC]
          ncalrpc:[OLE4A8F030E837042CAFAE2B863F657]
          ncacn_ip_tcp:10.10.11.174[49668]
          ncacn_ip_tcp:10.10.11.174[49664]
          ncalrpc:[samss lpc]
          ncalrpc:[SidKey Local End Point]
          ncalrpc:[protected_storage]
          ncalrpc:[lsasspirpc]
          ncalrpc:[lsapolicylookup]
          ncalrpc:[LSA_EAS_ENDPOINT]
          ncalrpc:[lsacap]
          ncalrpc:[LSARPC_ENDPOINT]
          ncalrpc:[securityevent]
          ncalrpc:[audit]
          ncacn_np:\\DC[\pipe\lsass]

Protocol: [MS-DRSR]: Directory Replication Service (DRS) Remote Protocol
Provider: ntdsai.dll
UUID    : E3514235-4B06-11D1-AB04-00C04FC2DCD2 v4.0 MS NT Directory DRS Interface
Bindings:
          ncacn_np:\\DC[\pipe\b9ddb0d0c39c8cf9]
          ncacn_http:10.10.11.174[49674]
          ncalrpc:[NTDS_LPC]
          ncalrpc:[OLE4A8F030E837042CAFAE2B863F657]
          ncacn_ip_tcp:10.10.11.174[49668]
          ncacn_ip_tcp:10.10.11.174[49664]
          ncalrpc:[samss lpc]
          ncalrpc:[SidKey Local End Point]
          ncalrpc:[protected_storage]
          ncalrpc:[lsasspirpc]
          ncalrpc:[lsapolicylookup]
          ncalrpc:[LSA_EAS_ENDPOINT]
          ncalrpc:[lsacap]
          ncalrpc:[LSARPC_ENDPOINT]
          ncalrpc:[securityevent]
          ncalrpc:[audit]
          ncacn_np:\\DC[\pipe\lsass]

Protocol: N/A
Provider: sysntfy.dll
UUID    : C9AC6DB5-82B7-4E55-AE8A-E464ED7B4277 v1.0 Impl friendly name
Bindings:
          ncalrpc:[OLE4A8F030E837042CAFAE2B863F657]
          ncacn_ip_tcp:10.10.11.174[49668]
          ncacn_ip_tcp:10.10.11.174[49664]
          ncalrpc:[samss lpc]
          ncalrpc:[SidKey Local End Point]
          ncalrpc:[protected_storage]
          ncalrpc:[lsasspirpc]
          ncalrpc:[lsapolicylookup]
          ncalrpc:[LSA_EAS_ENDPOINT]
          ncalrpc:[lsacap]
          ncalrpc:[LSARPC_ENDPOINT]
          ncalrpc:[securityevent]
          ncalrpc:[audit]
          ncacn_np:\\DC[\pipe\lsass]
          ncalrpc:[LRPC-1a51b39f9e524fd138]
          ncalrpc:[LRPC-aa16c966f2d9f16098]
          ncalrpc:[IUserProfile2]
          ncalrpc:[LRPC-82f6c797b7d7448c6a]
          ncalrpc:[senssvc]

Protocol: [MS-SAMR]: Security Account Manager (SAM) Remote Protocol
Provider: samsrv.dll
UUID    : 12345778-1234-ABCD-EF00-0123456789AC v1.0
Bindings:
          ncacn_ip_tcp:10.10.11.174[49664]
          ncalrpc:[samss lpc]
          ncalrpc:[SidKey Local End Point]
          ncalrpc:[protected_storage]
          ncalrpc:[lsasspirpc]
          ncalrpc:[lsapolicylookup]
          ncalrpc:[LSA_EAS_ENDPOINT]
          ncalrpc:[lsacap]
          ncalrpc:[LSARPC_ENDPOINT]
          ncalrpc:[securityevent]
          ncalrpc:[audit]
          ncacn_np:\\DC[\pipe\lsass]

Protocol: [MS-RSP]: Remote Shutdown Protocol
Provider: wininit.exe
UUID    : D95AFE70-A6D5-4259-822E-2C84DA1DDB0D v1.0
Bindings:
          ncacn_ip_tcp:10.10.11.174[49665]
          ncalrpc:[WindowsShutdown]
          ncacn_np:\\DC[\PIPE\InitShutdown]
          ncalrpc:[WMsgKRpc07E920]

Protocol: N/A
Provider: winlogon.exe
UUID    : 76F226C3-EC14-4325-8A99-6A46348418AF v1.0
Bindings:
          ncalrpc:[WindowsShutdown]
          ncacn_np:\\DC[\PIPE\InitShutdown]
          ncalrpc:[WMsgKRpc07E920]
          ncalrpc:[WMsgKRpc07FC91]

Protocol: N/A
Provider: N/A
UUID    : D09BDEB5-6171-4A34-BFE2-06FA82652568 v1.0
Bindings:
          ncalrpc:[csebpub]
          ncalrpc:[LRPC-9e0fd3ffa7c0e8c107]
          ncalrpc:[LRPC-dba754d1e42910aa07]
          ncalrpc:[LRPC-c476c755994e8e7176]
          ncalrpc:[actkernel]
          ncalrpc:[umpo]
          ncalrpc:[LRPC-dba754d1e42910aa07]
          ncalrpc:[LRPC-c476c755994e8e7176]
          ncalrpc:[actkernel]
          ncalrpc:[umpo]
          ncalrpc:[LRPC-c476c755994e8e7176]
          ncalrpc:[actkernel]
          ncalrpc:[umpo]
          ncalrpc:[LRPC-9d1f5ff151e6e67a19]

Protocol: N/A
Provider: N/A
UUID    : 697DCDA9-3BA9-4EB2-9247-E11F1901B0D2 v1.0
Bindings:
          ncalrpc:[LRPC-9e0fd3ffa7c0e8c107]
          ncalrpc:[LRPC-dba754d1e42910aa07]
          ncalrpc:[LRPC-c476c755994e8e7176]
          ncalrpc:[actkernel]
          ncalrpc:[umpo]

Protocol: N/A
Provider: N/A
UUID    : 9B008953-F195-4BF9-BDE0-4471971E58ED v1.0
Bindings:
          ncalrpc:[LRPC-dba754d1e42910aa07]
          ncalrpc:[LRPC-c476c755994e8e7176]
          ncalrpc:[actkernel]
          ncalrpc:[umpo]

Protocol: N/A
Provider: nsisvc.dll
UUID    : 7EA70BCF-48AF-4F6A-8968-6A440754D5FA v1.0 NSI server endpoint
Bindings:
          ncalrpc:[LRPC-3eee60dde80482e47e]

Protocol: N/A
Provider: dhcpcsvc6.dll
UUID    : 3C4728C5-F0AB-448B-BDA1-6CE01EB0A6D6 v1.0 DHCPv6 Client LRPC Endpoint
Bindings:
          ncalrpc:[dhcpcsvc6]
          ncalrpc:[dhcpcsvc]

Protocol: N/A
Provider: dhcpcsvc.dll
UUID    : 3C4728C5-F0AB-448B-BDA1-6CE01EB0A6D5 v1.0 DHCP Client LRPC Endpoint
Bindings:
          ncalrpc:[dhcpcsvc]

Protocol: N/A
Provider: gpsvc.dll
UUID    : 2EB08E3E-639F-4FBA-97B1-14F878961076 v1.0 Group Policy RPC Interface
Bindings:
          ncalrpc:[LRPC-c82cc85c48b77c9265]

Protocol: [MS-EVEN6]: EventLog Remoting Protocol
Provider: wevtsvc.dll
UUID    : F6BEAFF7-1E19-4FBB-9F8F-B89E2018337C v1.0 Event log TCPIP
Bindings:
          ncacn_ip_tcp:10.10.11.174[49666]
          ncacn_np:\\DC[\pipe\eventlog]
          ncalrpc:[eventlog]

Protocol: N/A
Provider: nrpsrv.dll
UUID    : 30ADC50C-5CBC-46CE-9A0E-91914789E23C v1.0 NRP server endpoint
Bindings:
          ncalrpc:[LRPC-dfa1dda72f1a7cdd30]
          ncalrpc:[DNSResolver]

Protocol: N/A
Provider: N/A
UUID    : 3A9EF155-691D-4449-8D05-09AD57031823 v1.0
Bindings:
          ncacn_ip_tcp:10.10.11.174[49667]
          ncalrpc:[ubpmtaskhostchannel]
          ncacn_np:\\DC[\PIPE\atsvc]
          ncalrpc:[LRPC-bd9b5f81a9cf31c1ea]

Protocol: [MS-TSCH]: Task Scheduler Service Remoting Protocol
Provider: schedsvc.dll
UUID    : 86D35949-83C9-4044-B424-DB363231FD0C v1.0
Bindings:
          ncacn_ip_tcp:10.10.11.174[49667]
          ncalrpc:[ubpmtaskhostchannel]
          ncacn_np:\\DC[\PIPE\atsvc]
          ncalrpc:[LRPC-bd9b5f81a9cf31c1ea]

Protocol: [MS-TSCH]: Task Scheduler Service Remoting Protocol
Provider: taskcomp.dll
UUID    : 378E52B0-C0A9-11CF-822D-00AA0051E40F v1.0
Bindings:
          ncacn_np:\\DC[\PIPE\atsvc]
          ncalrpc:[LRPC-bd9b5f81a9cf31c1ea]

Protocol: [MS-TSCH]: Task Scheduler Service Remoting Protocol
Provider: taskcomp.dll
UUID    : 1FF70682-0A51-30E8-076D-740BE8CEE98B v1.0
Bindings:
          ncacn_np:\\DC[\PIPE\atsvc]
          ncalrpc:[LRPC-bd9b5f81a9cf31c1ea]

Protocol: N/A
Provider: schedsvc.dll
UUID    : 0A74EF1C-41A4-4E06-83AE-DC74FB1CDD53 v1.0
Bindings:
          ncalrpc:[LRPC-bd9b5f81a9cf31c1ea]

Protocol: N/A
Provider: N/A
UUID    : 7F1343FE-50A9-4927-A778-0C5859517BAC v1.0 DfsDs service
Bindings:
          ncacn_np:\\DC[\PIPE\wkssvc]
          ncalrpc:[LRPC-d06b2e3146bd59e152]

Protocol: N/A
Provider: N/A
UUID    : EB081A0D-10EE-478A-A1DD-50995283E7A8 v3.0 Witness Client Test Interface
Bindings:
          ncalrpc:[LRPC-d06b2e3146bd59e152]

Protocol: N/A
Provider: N/A
UUID    : F2C9B409-C1C9-4100-8639-D8AB1486694A v1.0 Witness Client Upcall Server
Bindings:
          ncalrpc:[LRPC-d06b2e3146bd59e152]

Protocol: N/A
Provider: MPSSVC.dll
UUID    : 2FB92682-6599-42DC-AE13-BD2CA89BD11C v1.0 Fw APIs
Bindings:
          ncalrpc:[LRPC-727aef21c5efa23b06]
          ncalrpc:[LRPC-f1b9705755b56ce2ef]
          ncalrpc:[LRPC-0841eea75c9dcc6a98]
          ncalrpc:[LRPC-35e4fc5dc4e57fa2d0]

Protocol: N/A
Provider: N/A
UUID    : F47433C3-3E9D-4157-AAD4-83AA1F5C2D4C v1.0 Fw APIs
Bindings:
          ncalrpc:[LRPC-f1b9705755b56ce2ef]
          ncalrpc:[LRPC-0841eea75c9dcc6a98]
          ncalrpc:[LRPC-35e4fc5dc4e57fa2d0]

Protocol: N/A
Provider: MPSSVC.dll
UUID    : 7F9D11BF-7FB9-436B-A812-B2D50C5D4C03 v1.0 Fw APIs
Bindings:
          ncalrpc:[LRPC-0841eea75c9dcc6a98]
          ncalrpc:[LRPC-35e4fc5dc4e57fa2d0]

Protocol: N/A
Provider: BFE.DLL
UUID    : DD490425-5325-4565-B774-7E27D6C09C24 v1.0 Base Firewall Engine API
Bindings:
          ncalrpc:[LRPC-35e4fc5dc4e57fa2d0]

Protocol: N/A
Provider: N/A
UUID    : A500D4C6-0DD1-4543-BC0C-D5F93486EAF8 v1.0
Bindings:
          ncalrpc:[LRPC-a5ecb7ae4b06933f39]
          ncalrpc:[LRPC-9d1f5ff151e6e67a19]

Protocol: N/A
Provider: N/A
UUID    : 3473DD4D-2E88-4006-9CBA-22570909DD10 v5.1 WinHttp Auto-Proxy Service
Bindings:
          ncalrpc:[2f457c2c-1011-4847-a617-9e8e03acc2f3]
          ncalrpc:[LRPC-e18e29db9ddab85c2f]

Protocol: N/A
Provider: N/A
UUID    : C49A5A70-8A7F-4E70-BA16-1E8F1F193EF1 v1.0 Adh APIs
Bindings:
          ncalrpc:[OLE269B72C5272D38642F7A30384E3B]
          ncalrpc:[TeredoControl]
          ncalrpc:[TeredoDiagnostics]
          ncalrpc:[LRPC-20eb2d4c503fc5c246]

Protocol: N/A
Provider: N/A
UUID    : C36BE077-E14B-4FE9-8ABC-E856EF4F048B v1.0 Proxy Manager client server endpoint
Bindings:
          ncalrpc:[TeredoControl]
          ncalrpc:[TeredoDiagnostics]
          ncalrpc:[LRPC-20eb2d4c503fc5c246]

Protocol: N/A
Provider: N/A
UUID    : 2E6035B2-E8F1-41A7-A044-656B439C4C34 v1.0 Proxy Manager provider server endpoint
Bindings:
          ncalrpc:[TeredoControl]
          ncalrpc:[TeredoDiagnostics]
          ncalrpc:[LRPC-20eb2d4c503fc5c246]

Protocol: N/A
Provider: iphlpsvc.dll
UUID    : 552D076A-CB29-4E44-8B6A-D15E59E2C0AF v1.0 IP Transition Configuration endpoint
Bindings:
          ncalrpc:[LRPC-20eb2d4c503fc5c246]

Protocol: N/A
Provider: N/A
UUID    : 0D3C7F20-1C8D-4654-A1B3-51563B298BDA v1.0 UserMgrCli
Bindings:
          ncalrpc:[LRPC-d3b5dd4ebd5cf9bd3e]
          ncalrpc:[OLE39E898449622DBCDAF844F1127F5]

Protocol: N/A
Provider: N/A
UUID    : B18FBAB6-56F8-4702-84E0-41053293A869 v1.0 UserMgrCli
Bindings:
          ncalrpc:[LRPC-d3b5dd4ebd5cf9bd3e]
          ncalrpc:[OLE39E898449622DBCDAF844F1127F5]

Protocol: N/A
Provider: N/A
UUID    : 3F787932-3452-4363-8651-6EA97BB373BB v1.0 NSP Rpc Interface
Bindings:
          ncalrpc:[LRPC-5c1aef6dc67ae35043]
          ncalrpc:[OLEAB540D32DF1BE43AF894C4D57AAF]

Protocol: N/A
Provider: N/A
UUID    : 1A0D010F-1C33-432C-B0F5-8CF4E8053099 v1.0 IdSegSrv service
Bindings:
          ncalrpc:[LRPC-0b79c29d46df1d0606]

Protocol: N/A
Provider: srvsvc.dll
UUID    : 98716D03-89AC-44C7-BB8C-285824E51C4A v1.0 XactSrv service
Bindings:
          ncalrpc:[LRPC-0b79c29d46df1d0606]

Protocol: [MS-PCQ]: Performance Counter Query Protocol
Provider: regsvc.dll
UUID    : DA5A86C5-12C2-4943-AB30-7F74A813D853 v1.0 RemoteRegistry Perflib Interface
Bindings:
          ncacn_np:\\DC[\PIPE\winreg]

Protocol: [MS-RRP]: Windows Remote Registry Protocol
Provider: regsvc.dll
UUID    : 338CD001-2244-31F1-AAAA-900038001003 v1.0 RemoteRegistry Interface
Bindings:
          ncacn_np:\\DC[\PIPE\winreg]

Protocol: N/A
Provider: IKEEXT.DLL
UUID    : A398E520-D59A-4BDD-AA7A-3C1E0303A511 v1.0 IKE/Authip API
Bindings:
          ncalrpc:[LRPC-bd98a08b58c663b530]

Protocol: N/A
Provider: sysmain.dll
UUID    : B58AA02E-2884-4E97-8176-4EE06D794184 v1.0
Bindings:
          ncalrpc:[LRPC-4759dbe94a914826b8]

Protocol: [MS-SCMR]: Service Control Manager Remote Protocol
Provider: services.exe
UUID    : 367ABB81-9844-35F1-AD32-98F038001003 v2.0
Bindings:
          ncacn_ip_tcp:10.10.11.174[49679]

Protocol: N/A
Provider: N/A
UUID    : F3F09FFD-FBCF-4291-944D-70AD6E0E73BB v1.0
Bindings:
          ncalrpc:[LRPC-9f706e59f8c087f738]

Protocol: [MS-CMPO]: MSDTC Connection Manager:
Provider: msdtcprx.dll
UUID    : 906B0CE0-C70B-1067-B317-00DD010662DA v1.0
Bindings:
          ncalrpc:[LRPC-ec26dc203ab6381dd4]
          ncalrpc:[OLEECB79F79900466C08A655BCF0968]
          ncalrpc:[LRPC-654dd2f11be55d54d3]
          ncalrpc:[LRPC-654dd2f11be55d54d3]
          ncalrpc:[LRPC-654dd2f11be55d54d3]

Protocol: [MS-DNSP]: Domain Name Service (DNS) Server Management
Provider: dns.exe
UUID    : 50ABC2A4-574D-40B3-9D66-EE4FD5FBA076 v5.0
Bindings:
          ncacn_ip_tcp:10.10.11.174[49700]

Protocol: N/A
Provider: N/A
UUID    : A111F1C5-5923-47C0-9A68-D0BAFB577901 v1.0 NetSetup API
Bindings:
          ncalrpc:[LRPC-c5761b5d6cc4e6f963]

[*] Received 228 endpoints.


```

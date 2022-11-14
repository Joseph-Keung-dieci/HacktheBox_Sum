```bash
nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 3268 --script="banner,(ldap* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp3268/tcp_3268_ldap_nmap.txt" -oX "/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp3268/xml/tcp_3268_ldap_nmap.xml" 10.10.10.172
```

[/home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp3268/tcp_3268_ldap_nmap.txt](file:///home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp3268/tcp_3268_ldap_nmap.txt):

```
# Nmap 7.93 scan initiated Mon Nov 14 11:26:13 2022 as: nmap -vv --reason -Pn -T4 --min-rate=1000 -sV -p 3268 "--script=banner,(ldap* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp3268/tcp_3268_ldap_nmap.txt -oX /home/parallels/HacktheBox/OSCP-like/AD-Monteverde/results/10.10.10.172/scans/tcp3268/xml/tcp_3268_ldap_nmap.xml 10.10.10.172
Nmap scan report for 10.10.10.172
Host is up, received user-set (0.029s latency).
Scanned at 2022-11-14 11:26:14 AEDT for 17s

PORT     STATE SERVICE REASON  VERSION
3268/tcp open  ldap    syn-ack Microsoft Windows Active Directory LDAP (Domain: MEGABANK.LOCAL, Site: Default-First-Site-Name)
| ldap-rootdse: 
| LDAP Results
|   <ROOT>
|       domainFunctionality: 7
|       forestFunctionality: 7
|       domainControllerFunctionality: 7
|       rootDomainNamingContext: DC=MEGABANK,DC=LOCAL
|       ldapServiceName: MEGABANK.LOCAL:monteverde$@MEGABANK.LOCAL
|       isGlobalCatalogReady: TRUE
|       supportedSASLMechanisms: GSSAPI
|       supportedSASLMechanisms: GSS-SPNEGO
|       supportedSASLMechanisms: EXTERNAL
|       supportedSASLMechanisms: DIGEST-MD5
|       supportedLDAPVersion: 3
|       supportedLDAPVersion: 2
|       supportedLDAPPolicies: MaxPoolThreads
|       supportedLDAPPolicies: MaxPercentDirSyncRequests
|       supportedLDAPPolicies: MaxDatagramRecv
|       supportedLDAPPolicies: MaxReceiveBuffer
|       supportedLDAPPolicies: InitRecvTimeout
|       supportedLDAPPolicies: MaxConnections
|       supportedLDAPPolicies: MaxConnIdleTime
|       supportedLDAPPolicies: MaxPageSize
|       supportedLDAPPolicies: MaxBatchReturnMessages
|       supportedLDAPPolicies: MaxQueryDuration
|       supportedLDAPPolicies: MaxDirSyncDuration
|       supportedLDAPPolicies: MaxTempTableSize
|       supportedLDAPPolicies: MaxResultSetSize
|       supportedLDAPPolicies: MinResultSets
|       supportedLDAPPolicies: MaxResultSetsPerConn
|       supportedLDAPPolicies: MaxNotificationPerConn
|       supportedLDAPPolicies: MaxValRange
|       supportedLDAPPolicies: MaxValRangeTransitive
|       supportedLDAPPolicies: ThreadMemoryLimit
|       supportedLDAPPolicies: SystemMemoryLimitPercent
|       supportedControl: 1.2.840.113556.1.4.319
|       supportedControl: 1.2.840.113556.1.4.801
|       supportedControl: 1.2.840.113556.1.4.473
|       supportedControl: 1.2.840.113556.1.4.528
|       supportedControl: 1.2.840.113556.1.4.417
|       supportedControl: 1.2.840.113556.1.4.619
|       supportedControl: 1.2.840.113556.1.4.841
|       supportedControl: 1.2.840.113556.1.4.529
|       supportedControl: 1.2.840.113556.1.4.805
|       supportedControl: 1.2.840.113556.1.4.521
|       supportedControl: 1.2.840.113556.1.4.970
|       supportedControl: 1.2.840.113556.1.4.1338
|       supportedControl: 1.2.840.113556.1.4.474
|       supportedControl: 1.2.840.113556.1.4.1339
|       supportedControl: 1.2.840.113556.1.4.1340
|       supportedControl: 1.2.840.113556.1.4.1413
|       supportedControl: 2.16.840.1.113730.3.4.9
|       supportedControl: 2.16.840.1.113730.3.4.10
|       supportedControl: 1.2.840.113556.1.4.1504
|       supportedControl: 1.2.840.113556.1.4.1852
|       supportedControl: 1.2.840.113556.1.4.802
|       supportedControl: 1.2.840.113556.1.4.1907
|       supportedControl: 1.2.840.113556.1.4.1948
|       supportedControl: 1.2.840.113556.1.4.1974
|       supportedControl: 1.2.840.113556.1.4.1341
|       supportedControl: 1.2.840.113556.1.4.2026
|       supportedControl: 1.2.840.113556.1.4.2064
|       supportedControl: 1.2.840.113556.1.4.2065
|       supportedControl: 1.2.840.113556.1.4.2066
|       supportedControl: 1.2.840.113556.1.4.2090
|       supportedControl: 1.2.840.113556.1.4.2205
|       supportedControl: 1.2.840.113556.1.4.2204
|       supportedControl: 1.2.840.113556.1.4.2206
|       supportedControl: 1.2.840.113556.1.4.2211
|       supportedControl: 1.2.840.113556.1.4.2239
|       supportedControl: 1.2.840.113556.1.4.2255
|       supportedControl: 1.2.840.113556.1.4.2256
|       supportedControl: 1.2.840.113556.1.4.2309
|       supportedControl: 1.2.840.113556.1.4.2330
|       supportedControl: 1.2.840.113556.1.4.2354
|       supportedCapabilities: 1.2.840.113556.1.4.800
|       supportedCapabilities: 1.2.840.113556.1.4.1670
|       supportedCapabilities: 1.2.840.113556.1.4.1791
|       supportedCapabilities: 1.2.840.113556.1.4.1935
|       supportedCapabilities: 1.2.840.113556.1.4.2080
|       supportedCapabilities: 1.2.840.113556.1.4.2237
|       subschemaSubentry: CN=Aggregate,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|       serverName: CN=MONTEVERDE,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=MEGABANK,DC=LOCAL
|       schemaNamingContext: CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|       namingContexts: DC=MEGABANK,DC=LOCAL
|       namingContexts: CN=Configuration,DC=MEGABANK,DC=LOCAL
|       namingContexts: CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|       namingContexts: DC=DomainDnsZones,DC=MEGABANK,DC=LOCAL
|       namingContexts: DC=ForestDnsZones,DC=MEGABANK,DC=LOCAL
|       isSynchronized: TRUE
|       highestCommittedUSN: 77900
|       dsServiceName: CN=NTDS Settings,CN=MONTEVERDE,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=MEGABANK,DC=LOCAL
|       dnsHostName: MONTEVERDE.MEGABANK.LOCAL
|       defaultNamingContext: DC=MEGABANK,DC=LOCAL
|       currentTime: 20221114002621.0Z
|_      configurationNamingContext: CN=Configuration,DC=MEGABANK,DC=LOCAL
| ldap-search: 
|   Context: DC=MEGABANK,DC=LOCAL
|     dn: DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: domain
|         objectClass: domainDNS
|         distinguishedName: DC=MEGABANK,DC=LOCAL
|         instanceType: 5
|         whenCreated: 2020/01/02 22:05:15 UTC
|         whenChanged: 2022/11/14 00:22:17 UTC
|         subRefs: DC=ForestDnsZones,DC=MEGABANK,DC=LOCAL
|         subRefs: DC=DomainDnsZones,DC=MEGABANK,DC=LOCAL
|         subRefs: CN=Configuration,DC=MEGABANK,DC=LOCAL
|         uSNCreated: 4099
|         uSNChanged: 77851
|         name: MEGABANK
|         objectGUID: 41195d74-6f66-9846-ba78-67509841f4d0
|         replUpToDateVector: \x02\x00\x00\x00\x00\x00\x00\x00\x0B\x00\x00\x00\x00\x00\x00\x00\x0F{\xA0:\xC3/1O\x86J\xDD\xEC\xA2\xD3\\xC5\x05p\x00\x00\x00\x00\x00\x00x\x0C\x1F\x14\x03\x00\x00\x00G\x91IB\xB5M\xD7M\x83\x16x5\xF7(^\xC0\x110\x01\x00\x00\x00\x00\x008\x1B\x82\x19\x03\x00\x00\x000#\xF5C%\x8E\xC6L\xBFKl\x1A\xD0s\xA9\xB2\x10 \x01\x00\x00\x00\x00\x00I\xD0j\x19\x03\x00\x00\x003\xA0\x84H\xAB\xEA\x83D\xB2\xF1	\xF6\xEF0\x8Ex
|         \xC0\x00\x00\x00\x00\x00\x00\xB1\xF3\x1F\x14\x03\x00\x00\x00LE4U2C!C\xA9\x0B\xE9\xAE\xCFU\x86\x1C\x0C\xE0\x00\x00\x00\x00\x00\x00\x15\xCD#\x14\x03\x00\x00\x00eS2XR\xA9\A\xADpF\xD4S\xEF\xEAX	\xB0\x00\x00\x00\x00\x00\x00\x07\xE7\x1F\x14\x03\x00\x00\x00^\xFD\xEBv\x1F\xD5\x9AL\x8Eq)\xA6\x87[\x8D\xCB\x0E\x00\x01\x00\x00\x00\x00\x00M\xCE\xB2\x16\x03\x00\x00\x00\x87?\x16\x90n=\xFFG\xAC\x94\x0F\xEFKz
|         \x8E\x07\x90\x00\x00\x00\x00\x00\x00\xE4\x16\x1F\x14\x03\x00\x00\x00\x0F\x9F\xF7\xE4\xCE\xE3ZD\xAB	:\x88\xCF\xC9\x04\xC9\x06\x80\x00\x00\x00\x00\x00\x009\x13\x1F\x14\x03\x00\x00\x00\xA7_I\xF0\x03\xAAbK\xBC7\x87\x176#r\xA7\x0B\xD0\x00\x00\x00\x00\x00\x00\xBA\x99#\x14\x03\x00\x00\x00IB\xC3\xF8h\x07AO\x8E\x01c\xEC\xEC\x848!\x0F\x10\x01\x00\x00\x00\x00\x00c=h\x19\x03\x00\x00\x00
|         objectSid: 1-5-21-391775091-850290835-3566037492
|         wellKnownObjects: B:32:6227F0AF1FC2410D8E3BB10615BB5B0F:CN=NTDS Quotas,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:F4BE92A4C777485E878E9421D53087DB:CN=Microsoft,CN=Program Data,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:09460C08AE1E4A4EA0F64AEE7DAA1E5A:CN=Program Data,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:22B70C67D56E4EFB91E9300FCA3DC1AA:CN=ForeignSecurityPrincipals,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:18E2EA80684F11D2B9AA00C04F79F805:CN=Deleted Objects,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:2FBAC1870ADE11D297C400C04FD8D5CD:CN=Infrastructure,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:AB8153B7768811D1ADED00C04FD8D5CD:CN=LostAndFound,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:AB1D30F3768811D1ADED00C04FD8D5CD:CN=System,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:A361B2FFFFD211D1AA4B00C04FD7D83A:OU=Domain Controllers,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:AA312825768811D1ADED00C04FD8D5CD:CN=Computers,DC=MEGABANK,DC=LOCAL
|         wellKnownObjects: B:32:A9D1CA15768811D1ADED00C04FD8D5CD:CN=Users,DC=MEGABANK,DC=LOCAL
|         objectCategory: CN=Domain-DNS,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         gPLink: [LDAP://CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=MEGABANK,DC=LOCAL;0]
|         dSCorePropagationData: 1601/01/01 00:00:00 UTC
|         masteredBy: CN=NTDS Settings,CN=MONTEVERDE,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         msDs-masteredBy: CN=NTDS Settings,CN=MONTEVERDE,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         msDS-IsDomainFor: CN=NTDS Settings,CN=MONTEVERDE,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dc: MEGABANK
|     dn: CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: container
|         cn: Users
|         description: Default container for upgraded user accounts
|         distinguishedName: CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:05:21 UTC
|         whenChanged: 2020/01/02 22:05:21 UTC
|         uSNCreated: 5660
|         uSNChanged: 5660
|         name: Users
|         objectGUID: ed111f21-9bda-7848-99e3-7822fc4a7877
|         objectCategory: CN=Container,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:44:45 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 18:12:17 UTC
|     dn: CN=krbtgt,CN=Users,DC=MEGABANK,DC=LOCAL
|     dn: CN=Domain Computers,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Domain Computers
|         description: All workstations and servers joined to the domain
|         distinguishedName: CN=Domain Computers,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12330
|         uSNChanged: 12332
|         name: Domain Computers
|         objectGUID: 937ca011-951-e941-9524-39c7b398c570
|         objectSid: 1-5-21-391775091-850290835-3566037492-515
|         sAMAccountName: Domain Computers
|         sAMAccountType: 268435456
|         groupType: -2147483646
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Domain Controllers,CN=Users,DC=MEGABANK,DC=LOCAL
|     dn: CN=Schema Admins,CN=Users,DC=MEGABANK,DC=LOCAL
|     dn: CN=Enterprise Admins,CN=Users,DC=MEGABANK,DC=LOCAL
|     dn: CN=Cert Publishers,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Cert Publishers
|         description: Members of this group are permitted to publish certificates to the directory
|         distinguishedName: CN=Cert Publishers,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12342
|         memberOf: CN=Denied RODC Password Replication Group,CN=Users,DC=MEGABANK,DC=LOCAL
|         uSNChanged: 12344
|         name: Cert Publishers
|         objectGUID: de18261-4a56-a347-89c3-c7b08f4bcbe4
|         objectSid: 1-5-21-391775091-850290835-3566037492-517
|         sAMAccountName: Cert Publishers
|         sAMAccountType: 536870912
|         groupType: -2147483644
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Domain Admins,CN=Users,DC=MEGABANK,DC=LOCAL
|     dn: CN=Domain Users,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Domain Users
|         description: All domain users
|         distinguishedName: CN=Domain Users,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12348
|         memberOf: CN=Users,CN=Builtin,DC=MEGABANK,DC=LOCAL
|         uSNChanged: 12350
|         name: Domain Users
|         objectGUID: c4506690-510-7a4d-a186-689b5c56a5e0
|         objectSid: 1-5-21-391775091-850290835-3566037492-513
|         sAMAccountName: Domain Users
|         sAMAccountType: 268435456
|         groupType: -2147483646
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Domain Guests,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Domain Guests
|         description: All domain guests
|         distinguishedName: CN=Domain Guests,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12351
|         memberOf: CN=Guests,CN=Builtin,DC=MEGABANK,DC=LOCAL
|         uSNChanged: 12353
|         name: Domain Guests
|         objectGUID: ccdaeba2-7b14-4645-a79d-8c486f9ae279
|         objectSid: 1-5-21-391775091-850290835-3566037492-514
|         sAMAccountName: Domain Guests
|         sAMAccountType: 268435456
|         groupType: -2147483646
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Group Policy Creator Owners,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Group Policy Creator Owners
|         description: Members in this group can modify group policy for the domain
|         member: CN=Administrator,CN=Users,DC=MEGABANK,DC=LOCAL
|         distinguishedName: CN=Group Policy Creator Owners,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12354
|         memberOf: CN=Denied RODC Password Replication Group,CN=Users,DC=MEGABANK,DC=LOCAL
|         uSNChanged: 12391
|         name: Group Policy Creator Owners
|         objectGUID: 4dd43e89-5026-74b-9f53-30509bd833
|         objectSid: 1-5-21-391775091-850290835-3566037492-520
|         sAMAccountName: Group Policy Creator Owners
|         sAMAccountType: 268435456
|         groupType: -2147483646
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=RAS and IAS Servers,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: RAS and IAS Servers
|         description: Servers in this group can access remote access properties of users
|         distinguishedName: CN=RAS and IAS Servers,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12357
|         uSNChanged: 12359
|         name: RAS and IAS Servers
|         objectGUID: fcef610-a49-74b-a6c7-362dba8e5370
|         objectSid: 1-5-21-391775091-850290835-3566037492-553
|         sAMAccountName: RAS and IAS Servers
|         sAMAccountType: 536870912
|         groupType: -2147483644
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Allowed RODC Password Replication Group,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Allowed RODC Password Replication Group
|         description: Members in this group can have their passwords replicated to all read-only domain controllers in the domain
|         distinguishedName: CN=Allowed RODC Password Replication Group,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12402
|         uSNChanged: 12404
|         name: Allowed RODC Password Replication Group
|         objectGUID: e34c6bea-785f-3e45-b24c-913b73b96bd
|         objectSid: 1-5-21-391775091-850290835-3566037492-571
|         sAMAccountName: Allowed RODC Password Replication Group
|         sAMAccountType: 536870912
|         groupType: -2147483644
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Denied RODC Password Replication Group,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Denied RODC Password Replication Group
|         description: Members in this group cannot have their passwords replicated to any read-only domain controllers in the domain
|         member: CN=Read-only Domain Controllers,CN=Users,DC=MEGABANK,DC=LOCAL
|         member: CN=Group Policy Creator Owners,CN=Users,DC=MEGABANK,DC=LOCAL
|         member: CN=Domain Admins,CN=Users,DC=MEGABANK,DC=LOCAL
|         member: CN=Cert Publishers,CN=Users,DC=MEGABANK,DC=LOCAL
|         member: CN=Enterprise Admins,CN=Users,DC=MEGABANK,DC=LOCAL
|         member: CN=Schema Admins,CN=Users,DC=MEGABANK,DC=LOCAL
|         member: CN=Domain Controllers,CN=Users,DC=MEGABANK,DC=LOCAL
|         member: CN=krbtgt,CN=Users,DC=MEGABANK,DC=LOCAL
|         distinguishedName: CN=Denied RODC Password Replication Group,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12405
|         uSNChanged: 12433
|         name: Denied RODC Password Replication Group
|         objectGUID: 4ad977-df81-ce48-accc-d5feeae17880
|         objectSid: 1-5-21-391775091-850290835-3566037492-572
|         sAMAccountName: Denied RODC Password Replication Group
|         sAMAccountType: 536870912
|         groupType: -2147483644
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Read-only Domain Controllers,CN=Users,DC=MEGABANK,DC=LOCAL
|     dn: CN=Enterprise Read-only Domain Controllers,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Enterprise Read-only Domain Controllers
|         description: Members of this group are Read-Only Domain Controllers in the enterprise
|         distinguishedName: CN=Enterprise Read-only Domain Controllers,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12429
|         uSNChanged: 12431
|         name: Enterprise Read-only Domain Controllers
|         objectGUID: 74255fc-bd98-7145-8058-3bb3eeb6f9c
|         objectSid: 1-5-21-391775091-850290835-3566037492-498
|         sAMAccountName: Enterprise Read-only Domain Controllers
|         sAMAccountType: 268435456
|         groupType: -2147483640
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Cloneable Domain Controllers,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Cloneable Domain Controllers
|         description: Members of this group that are domain controllers may be cloned.
|         distinguishedName: CN=Cloneable Domain Controllers,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12440
|         uSNChanged: 12442
|         name: Cloneable Domain Controllers
|         objectGUID: 2fdb2eb6-8111-6942-8124-b51d1132667
|         objectSid: 1-5-21-391775091-850290835-3566037492-522
|         sAMAccountName: Cloneable Domain Controllers
|         sAMAccountType: 268435456
|         groupType: -2147483646
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Protected Users,CN=Users,DC=MEGABANK,DC=LOCAL
|         objectClass: top
|         objectClass: group
|         cn: Protected Users
|         description: Members of this group are afforded additional protections against authentication security threats. See http://go.microsoft.com/fwlink/?LinkId=298939 for more information.
|         distinguishedName: CN=Protected Users,CN=Users,DC=MEGABANK,DC=LOCAL
|         instanceType: 4
|         whenCreated: 2020/01/02 22:06:03 UTC
|         whenChanged: 2020/01/02 22:06:03 UTC
|         uSNCreated: 12445
|         uSNChanged: 12447
|         name: Protected Users
|         objectGUID: f06bf3ed-bada-bf4b-b4c1-3a86a31061f1
|         objectSid: 1-5-21-391775091-850290835-3566037492-525
|         sAMAccountName: Protected Users
|         sAMAccountType: 268435456
|         groupType: -2147483646
|         objectCategory: CN=Group,CN=Schema,CN=Configuration,DC=MEGABANK,DC=LOCAL
|         dSCorePropagationData: 2020/01/03 12:35:51 UTC
|         dSCorePropagationData: 2020/01/02 22:06:03 UTC
|         dSCorePropagationData: 1601/01/01 00:04:17 UTC
|     dn: CN=Key Admins,CN=Users,DC=MEGABANK,DC=LOCAL
| 
| 
|_Result limited to 20 objects (see ldap.maxobjects)
Service Info: Host: MONTEVERDE; OS: Windows; CPE: cpe:/o:microsoft:windows

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Mon Nov 14 11:26:31 2022 -- 1 IP address (1 host up) scanned in 17.69 seconds

```

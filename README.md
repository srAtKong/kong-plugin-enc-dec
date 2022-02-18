[![Build Status][badge-travis-image]][badge-travis-url]

Kong plugin - JWE Enc Dec
=========================

This repository contains a very simple skeleton for Kong Custom Plugin for Encryption/Decryption

This plugin is designed to work with the
[`kong-pongo`](https://github.com/Kong/kong-pongo) 

Please check out those repos `README` files for usage instructions.

## Parameters

The plugin can be applied against a service or a route:

```
curl -i -X POST http://kong:8001/services/{service}/plugins \
  --data "name=jwe-enc-dec" 
```

OR

```
curl -i -X POST http://kong:8001/routes/{route}/plugins \
  --data "name=jwe-enc-dec" 
```


| form parameter         | default   | description                                                      |
| ---                    | ---       | ---                                                              |
| `name`                 |           | The name of the plugin to use, in this case: `jwe-enc-dec` |
| `config.request_auth_header`   | Authorization | Request header to lookup JWE |
| `config.upstream_auth_header`   | Authorization| Upstream header to populate decrypted JWE |
| `config.response_auth_header`   | Authorization| Response header to lookup plaintext |
| `config.downstream_auth_header`   | Authorization| Downstream header to populate JWE |


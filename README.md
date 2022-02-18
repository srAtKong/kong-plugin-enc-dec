[![Build Status][badge-travis-image]][badge-travis-url]

Kong plugin - JWE Enc Dec
=========================

This repository contains a very simple skeleton for Kong Custom Plugin for Encryption/Decryption

The encryption/decryption module is not implemented and stubbed out

This plugin is designed to work with the
[`kong-pongo`](https://github.com/Kong/kong-pongo) 

Please check out those repos `README` files for usage instructions.

## Parameters

| form parameter         | default   | description                                                      |
| ---                    | ---       | ---                                                              |
| `name`                 |           | The name of the plugin to use, in this case: `jwe-enc-dec` |
| `config.request_auth_header`   | Authorization | Request header to lookup JWE |
| `config.upstream_auth_header`   | Authorization| Upstream header to populate decrypted JWE |
| `config.response_auth_header`   | Authorization| Response header to lookup plaintext |
| `config.downstream_auth_header`   | Authorization| Downstream header to populate JWE |

## Usage
1. Create a service with host "httpbin.org/anything"
2. Create a route to the service
3. Apply the plugin to the service/route
4. Test

Send a request to the route with some ciphertext for the Auth header. 

Examine the response to view the upstream request and response where the Auth header is decrupted and encrypted

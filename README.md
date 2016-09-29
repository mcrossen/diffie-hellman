# Diffie-Hellman

A project in cryptography for CS 465 (Computer Security) at BYU. Although Ruby contains a Diffie-Hellman module in the OpenSSL library, I was still required to implement my own.

## Usage
An executable has been provided in the bin/ directory. To run it, do the following:
```bash
./bin/diffie-hellman
```
It will display its public key and prime modulus which can be given to the other correspondent.

## Testing
Some unit tests have also been provided to prove functionality. To run them, do the following:
```bash
sudo gem install rake
rake
```
These tests are automatically performed by travis-ci as well. The current status of those tests is shown here: [![Build Status](https://travis-ci.org/mcrossen/diffiehellman.svg?branch=master)](https://travis-ci.org/mcrossen/diffiehellman)

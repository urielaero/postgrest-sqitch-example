#! /bin/bash
mkdir -p bin
cd bin
curl -L https://github.com/PostgREST/postgrest/releases/download/v5.2.0/postgrest-v5.2.0-ubuntu.tar.xz | tar -xJ
curl -L https://github.com/aviaviavi/curl-runnings/releases/download/0.10.0/curl-runnings-0.10.0.tar.gz | tar -xz

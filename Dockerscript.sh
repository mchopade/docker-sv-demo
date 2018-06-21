#!/bin/bash
docker run --name tomcatserver -p 8081:8080 $0 -d

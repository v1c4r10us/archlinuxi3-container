#!/bin/bash
docker build -t myarch .
docker run -it -d -p 8081:8081 -v ./data:/home/z3r0/data  --name archi3 myarch bash -c "vncserver :1"
docker exec -d archi3 bash -c  "novnc --listen 8081 --vnc localhost:5901"

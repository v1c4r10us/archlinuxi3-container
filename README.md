
```bash
_______             ______ __________                            _____________
___    |_______________  /____  /__(_)__________  _____  __      ___(_)_|__  /
__  /| |_  ___/  ___/_  __ \_  /__  /__  __ \  / / /_  |/_/________  /___/_ < 
_  ___ |  /   / /__ _  / / /  / _  / _  / / / /_/ /__>  < _/_____/  / ____/ / 
/_/  |_/_/    \___/ /_/ /_//_/  /_/  /_/ /_/\__,_/ /_/|_|        /_/  /____/  
                                                                              
```
# Intro
Running archlinux with i3wm on docker environment, with main tools for developers

# Features
+ i3
+ noVNC
+ yay
+ firefox
+ LazyVim

# Instructions

1. Build the Dockerfile
```bash
$ docker build -t myarch .
```
2. Run the container exposing port for noVNC connection
```bash
$ docker run -it -d -p 8081:8081 --name archi3 myarch bash -c "vncserver :1"
```
3. Exec command for enable GUI 
```bash
$ docker exec -d archi3 bash -c "novnc --listen 8081 --vnc localhost:5901"
```
4. Enjoy your environment!

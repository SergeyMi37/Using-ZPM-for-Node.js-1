Inspired by ZPM managing Python modules I moved the idea forward to do the same for  
my examples with IRIS Native API for Node.js.  
And that worked perfect after getting all pieces in place.  
With Node.js you face the challenge to install additional __required__ components  
need to be installed with sufficien privileges using npm. This step is covered in Dockerfile.  
But all your .js code is handled by __ZPM.__   

The logic is the same as with my other examples. So there is not much surprise.  

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation 

Clone/git pull this repo into any local directory
```
$ git clone https://github.com/rcemper/Using-ZPM-for-Node.js 
```

Open the terminal in this directory and run:
```
$ docker-compose build
```
this may take some time to complete

Run the IRIS container with this project:
```
$ docker-compose up -d
```

## How to Test it

Using IRIS terminal:
```
$ docker-compose exec iris iris session iris "##class(rccjs.WSockNodeJs).Run()"


*** Welcome to WebSocket by Node.js Native API Demo ***


Known Hosts (*=Exit) [1]:
1  ws://echo.websocket.org/
2  --- server 2 ----
3  --- server 3 ----
select (1): 1 ==> ws://echo.websocket.org/
#
Enter text to get echoed from WebSocketClient Service
Terminate with * at first position
or get generated text by %
or append new text with @

1    hello this is connected over
2    IRIS Native API for Node.js
3    -----------------
4    *

Select action for WebClient Service
New EchoServer (E), New Text(N), Send+Listen(S)
Show Log (L), Exit+Stop WsClient(X) [S] :s
%%%%%%%%%%%%%%%%%%%%%%%%%%

******* 3 Replies *******
1    hello this is connecte over 
2    IRIS Native API for Node.js 
3    ----------------- 

Select action for WebClient Service
New EchoServer (E), New Text(N), Send+Listen(S)
Show Log (L), Exit+Stop WsClient(X) [S] :L
%%%%%%%%%%%%%%%%%%%%%%%%%%

platform = linux: ubuntu

        *****************************
        *** no IRIS host defined ****
        Connect to IRIS on: localhost
Successfully connected to InterSystems IRIS.
        *** wait 3sec for request ***
        ******* Startup done ********

        *** wait 3sec for request ***
        *** wait 3sec for request ***
        *** wait 3sec for request ***
        *** wait 3sec for request ***
        echoserver:  ws://echo.websocket.org/
        ** Lines to process: 3 **
        ********* next turn *********
        * WebSocket Client connected *
        ****** Client is ready ******
Line: 1 text> 'hello this is connecte over '
Received: 1 > 'hello this is connecte over '
Line: 2 text> 'IRIS Native API for Node.js '
Received: 2 > 'IRIS Native API for Node.js '
Line: 3 text> '----------------- '
Received: 3 > '----------------- '

        ******* lines sent: 3 ******
        *** replies received: 3 ****

        *** wait 3sec for request ***
        *** wait 3sec for request ***

Select action for WebClient Service
New EchoServer (E), New Text(N), Send+Listen(S)
Show Log (L), Exit+Stop WsClient(X) [S] :x
%%%%%%%%%%%%%%%%%%%%%%%%%%
```

[Article in DC](https://community.intersystems.com/post/using-zpm-nodejs)

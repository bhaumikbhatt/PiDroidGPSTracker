PiDroidGPSTracker
=================

For the #CUITPHackathon organized at the University of Colorado at Boulder on 11/15/2014, our team built a GPS tracker using a Raspberry Pi and an Android device.

Team members: Bhaumik Bhatt, Gavin Joseph, Sanket Nasre and Vishal Nagaonkar. Thanks to Prof. Joe McManus for organizing the Hackathon and guidance on the project.

Instructables link: http://www.instructables.com/id/PiDroidGPSTracker/

Spinning our minds over uses of the Raspberry Pi mini-computer, we decided to create a GPS tracker for the CU Night Ride Service, which provide cars for students to get around in the evening/night. The idea behind it being able to track all the cab drivers using their phones, so the student can locate the cabs over a map and get an idea of it's cab's location. We decided to plot the GPS co-ordinates of the Android device and use the Google Maps API to plot that location for a cab on a website which will show it on the map. We used the Raspberry Pi as a web-server to host the website and update it with the cab's location website every 5 seconds to refresh the GPS co-ordinates.

1) The cab driver will possess an Android phone which will fetch the GPS coordinates every 5 seconds and send it over to the Raspberry Pi web server through a TCP socket connection.

2) The web server will then update the HTML file with the new GPS co-ordinates and update it on the webpage.

Files description:

The server-socket.py file acts as a TCP server listening on port no. 12345 and receives data from the Android phone (client) and writes it to a file, which is file2 in our case.

The file droidgpspush.py file sits on the Android device and sends network data and GPS co-ordinates, of which, Latitude and Longitude are later parsed by the Raspberry Pi server using parsedata.sh file.

The file, 'file2' received from the server-socket.py will have a lot of redundant data which will need to be removed. This will be done by parsedata.sh file which uses a linux golf command - a one liner. Later, we have infinite_index.sh file that runs the write_index.sh file every 10 seconds and update the html web page with the latest obtained location from 'file'.

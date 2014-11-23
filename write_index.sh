#!/bin/bash
while read line
do
    echo '<!DOCTYPE html><html><head><script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false"> </script><script>'
    echo 'var myCenter=new google.maps.LatLng('
    echo $line
    echo ' )'
    echo 'var marker;function initialize(){var mapProp = {  center:myCenter,  zoom:15,  mapTypeId:google.maps.MapTypeId.ROADMAP  };'
    echo 'var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);'
    echo 'marker=new google.maps.Marker({   position:myCenter,   animation:google.maps.Animation.BOUNCE   });'
    echo 'marker.setMap(map);} google.maps.event.addDomListener(window, "load", initialize);'
    echo 'setTimeout(function(){ window.location.reload(1); }, 10000); </script>'
    echo ' </head> <body><div id="googleMap" style="width:1024px;height:780px;"></div> </body> </html>'
done 

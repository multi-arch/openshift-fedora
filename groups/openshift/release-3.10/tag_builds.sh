#!/bin/bash

arch=$(uname -m)
# do this to remove \n in for loop
saveIFS=$IFS
IFS=$'\n'
for i in  $(docker images | grep -v latest | grep -i origin | grep -v origin-release); do
	newname=`echo $i | awk '{ print $1}' | sed 's/openshift\//docker.io\/jeffdyoung\/f28-/g'`
	testname=`echo $i | awk '{ print $1}' | sed 's/openshift\//test\/f28-/g'`
	imageid=`echo $i | awk '{ print $3}'`
	docker tag $imageid $newname":v3.10-"$arch 
	#echo $testname":v3.10" 
	docker tag $imageid $newname":v3.10" 
	docker tag $imageid $newname":v3.10.0" 
done
#undo \n hack
IFS=$saveIFS

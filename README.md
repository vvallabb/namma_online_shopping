nammaonlineportal
=================

namma online portal is a java based online shopping portal. 


Set up:
-------

mvn archetype:generate -DgroupId=com.nammashoppingportal.app -DartifactId=nammashoppingportal -DarchetypeArtifactId=maven-archetype-webapp

Eclipse
=========

To Convert Maven Based Web Application To Support Eclipse IDE
mvn eclipse:eclipse -Dwtpversion=2.0

To set the M2_REPO
Goto Eclipe -> Preferences -> Java -> Build Path -> Classpath Variables
It will be generally In windows, "..\users\.m2\repository"
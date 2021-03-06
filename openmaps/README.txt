OpenMapJS - README

1. Configuration
----------------
The file config.json contains the following settings:
- url: Endpoint's URL. It must be an interface which receives SPARQL; 
for example, the default URL in Parliament is: 
http://localhost:8080/parliament/sparql

If you want to see instant results, you can upload to Parliament the 
following RDF (generated by RDF4GeoKettle Project):  
https://mega.nz/#!YEJnzb6K!21H2Hq_cih3B2hMPo3j9vJi6N-IU1Wlcd3KEjjNj1Fk

- maxResults: It is the maximum number of results used in the application. 
In other words, its the LIMIT field in a SPARQL query.

2. Use 
------
After a correct configuration (config.json), the html file should be working 
with a web interface.

The interface is integrated by a sidebar and the map. In particular, the 
sidebar puts on view all the subclasses of geosparl:Feature stored in the 
endpoint. Furthermore, each item can be enabled/disabled according you want 
to see in the map. In addition, each feature can be clicked to see which 
Latitude/Longitude and label corresponds to that point. 

3. Limits
---------
The map has been tested with Parliament (v2.7.9 and 2.7.10) Endpoint only. 
However, tests were performed with Marmotta+GeoSPARQL-module but they were 
lacking of inference, so future test will be carried out when Marmotta 
includes that characteristic. 

This application is compatible only with GeoSPARQL, any other geographical 
standard is not recognized.

4. RDF4GeoKeetle Project
------------------------
It is a project to perform a ETL-transformation for RDF generation using 
custom GeoKettle plugins. As a result, RDF4GeoKeetle was employed to 
generate the RDFs used in Geo Linked Data Ecuador. In addition, all the 
resulted RDFs can be displayed in a map through OpenMapJS. 

Overall, OpenMapJS is used as a free and open (you can put your logos, 
customize the css, modify he javascript, etc. according to the license) 
alternative to Map4RDF without the engagement of an application server.

5. License
----------
This project is under GNU/LGPL v3 License.

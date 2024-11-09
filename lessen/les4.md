# Les 4


## REST
REpresentational State Transfer

Roy Fielding

## HTTP 
### Request
* Method (1 regel)
* Headers (meerdere regels) optioneel
* Body (na 1 lege regel) optioneel

```
GET /products
Accept: text/html
```
```
POST /products
Content-Type: application/x-www-urlencoded

title=new&price=100
```

### Response
* Status (1 regel)
* Headers (meerdere regels) optioneel
* Body (na 1 lege regel) optioneel

```
HTTP/1.1 200 OK
Content-Type: text/html

<html>
<!-- html page -->
</html>
```

## REST principes
* client en server gescheiden
* stateless
* cacheable
* unform interface

## Postman
Tool waarmee je een request volledig zelf kunt configureren

Ideaal voor testen/debuggen van een webservice 

Opdracht: Oefenen met Postman (op chess/notes, of 'hacken' van een site)

## Volledige plaatje

## Node
Gebruiken om server geschreven in javascript te draaien

## Express
Webserver 

Routeert request en stuurt response

Opdracht: Collection en details zonder DB
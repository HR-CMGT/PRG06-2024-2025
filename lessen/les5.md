# Les 5

## MongoDB

*MongoDB* is een NoSQL-database die gegevens opslaat in documenten, in plaats van in tabellen zoals bij relationele
databases. Gegevens worden opgeslagen als een soort JSON.

## Mongoose

De module *Mongoose* is een object-document mapper (ODM) voor *MongoDB*. Hiermee kunnen we vanuit JavaScript
communiceren met de database.
Ook kunnen we in Mongoose modellen (schema's) maken voor objecten in de ongestructureerde database.

// TODO: opdracht seeder

## POST en PUT

json / www-urlencoded
(nog extra uitleg over json?)

### POST overloading

## Checker

// TODO: Opdracht POST, PUT, DELETE

## Status Codes

HTTP-statuscodes bestaan uit drie cijfers. Het eerste cijfer is de serie, en geeft aan in hoeverre de server er in
geslaagd is aan het request te voldoen. De laatste twee cijfers zijn voor meer gedetailleerde informatie. 00 wordt
gebruikt als er geen details zijn, of er geen specifieke code bestaat voor de details.

Een volledig overzich van alle statuscodes kan je vinden
op [Wikipdia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

### 2xx – Succes

Statuscodes in de 2xx-serie geven aan dat het request succesvol is verwerkt door de server.

- **200 OK**  
  Het request is geslaagd en de server heeft een response gestuurd.

- **201 Created**  
  Er is een nieuwe resource aangemaakt. Dit wordt gebruikt bij een POST-request.

### 4xx – Clientfout

Statuscodes in de 4xx-serie geven aan dat er iets mis is met het request van de client waardoor de server het request
niet kan verwerken.

- **401 Unauthorized**  
  De server kan het request niet verwerken omdat je niet ingelogd bent wat je wel had moeten zijn..

- **404 Not Found**  
  De resource bestaat niet op de server.

### 5xx – Serverfout

Statuscodes in de 5xx-serie geven aan dat de server een interne fout heeft ondervonden bij het verwerken van het
request. Het request is wel correct, de gebruiker kan hier zelf dus niets aan doen.

- **500 Internal Server Error**  
  Er is een algemene fout op de server opgetreden. Meest frustrerende fout: er is een probleem op de server, en je weet
  niet eens wat..

- **503 Service Unavailable**  
  De server is overbelast, of tijdelijk uit de lucht voor onderhoud.

## Server

Screen, rechten, mongo

## Postman vervolg?

## URI (kan ook in les 4)

## Meer over headers
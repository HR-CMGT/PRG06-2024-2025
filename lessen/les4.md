# Les 4

## Volledige plaatje

// TODO: idem les 1, maar nu back-end focus

## REST

*REST* (REpresentational State Transfer) is een architectuur stijl voor het ontwerpen van webapplicaties, waarbij gebruik
wordt gemaakt van reguliere webtechnieken.
Het idee achter REST is dat systemen via stateless communicatie communiceren, waarbij de server geen informatie over de
client bewaart tussen verzoeken. In een RESTful applicatie wordt het HTTP protocol volledig benut.

## HTTP

### Request

Een HTTP-verzoek bestaat uit drie onderdelen:

- **Method** (1 regel): De actie die de client op de server wil uitvoeren.
- **Headers** (meerdere regels): Optioneel, worden gebruikt om extra informatie mee te geven, zoals content-type of
  authenticatie.
- **Body** (na een lege regel): Optioneel, wordt gebruikt voor de data die de client naar de server stuurt.

```
GET /products
Accept: text/html
```

```
POST /products
Content-Type: application/x-www-form-urlencoded

title=new&price=100
```

### Response

- **Status** (1 regel): Geeft aan of het verzoek succesvol was of niet, bijvoorbeeld `200 OK` of `404 Not Found`.
- **Headers** (meerdere regels): Optioneel, kunnen informatie bevatten zoals het type van de content in de body.
- **Body** (na een lege regel): Optioneel, bevat de data die de server naar de client terugstuurt.

```
HTTP/1.1 200 OK
Content-Type: text/html

<html>
<!-- html page -->
</html>
```

## REST principes

- **Client en server gescheiden**: De client en de server kunnen onafhankelijk van elkaar worden ontwikkeld. Er is
  geen kennis over de implementatie noodzakelijk om te kunnen communiceren.
- **Stateless**: Elke request staat op zichzelf; de server houdt geen informatie bij over het request (voor de
  client).
- **Cacheable**: Als gevolg van de stateless architectuur kunnen veel responses gecacht worden.
- **Uniforme interface**: De communicatie tussen de client en se server gaat via HTTP, en is daardoor gestandariseerd.

## HTTP Methods

In les 2 hebben we naar de meest gebruikte methods gekeken. Voor de implementatie van een webservice kijken we naar nog
een paar andere headers:

| Methode | Doel                                                                                   | CRUD   |
| ------- | -------------------------------------------------------------------------------------- | ------ |
| GET     | Iets ophalen van de webservice (collectie of detail resource)                          | Read   |
| PUT     | Een detail resource aanpassen (volledige resource moet gestuurd worden                 | Update |
| PATCH   | Een detail resource aanpassen (alleen aanpassing hoeft gestuurd te worden)             | Update |
| DELETE  | Een detail resource verwijderen                                                        | Delete |
| OPTIONS | Opvragen welke methods toegestaan zijn voor een resource (response met `Allow`-header) |        |
| POST    | Een nieuwe resource toevoegen aan een colletie                                         | Create |

<!--
| HEAD    | Alleen de headers van iets ophalen van een resource                                    | Read   |
-->

Bij de implementatie van deze methods, moet je rekening houden met twee eigenschappen:

* **safe**: een method is safe als er geen wijzingen op de server gedaan worden
* **idempotent**: een method is idempotent als het niet uitmaakt of je de method één of meerdere keren uitvoert

| Method  | Safe | Idempotent |
| ------- | ---- | ---------- |
| GET     | Ja   | Ja         |
| HEAD    | Ja   | Ja         |
| PUT     | Nee  | Ja         |
| PATCH   | Nee  | Ja         |
| DELETE  | Nee  | Ja*        |
| OPTIONS | Ja   | Ja         |
| POST    | Nee  | Nee        |

*is afhankelijk van de implementatie

## REST client

Een *REST client* is een tool die het mogelijk maakt om verzoeken naar een server te sturen en de respons te ontvangen,
zonder dat hier een webbrowser voor nodig is.

* Een REST client communiceert rechtstreeks met een webservice;
* Je kunt zelf kunt instellen welke HTTP-methode je gebruikt, en kunt naast `GET` of `POST`, ook alle andere methoden
  gebruiken;
* Ook heb je volledige controle over de headers van het request, en kun je de response headers uitlezen.

Een REST client is de ideale tool voor het testen en debuggen van een webservice.

Opdracht: Oefenen met Postman (op chess/notes, of 'hacken' van een site)

### Postman

Tijdens deze cursus maken we gebruik van Postman, maar er zijn ook andere REST clients.

## Opdrachten

// TODO: Kan ook met Chess

* Installeer Postman
* Tip: als je een account maakt bij Postman kan je je requests opslaan om later her te gebruiken. Dat is heel handig als
  je straks je eigen service moet debuggen
* Haal met GET de collectie https://docent.cmi.hro.nl/bootb/demo/notes/ op
* Haal een detail resource op om de indeling te zien
* Maak nu een nieuwe note aan (als JSON)
* Maak nog een nieuwe note aan (nu als x-www-form-urlencoded)
* Pas je note aan (PUT)
* Verwijder je note weer (DELETE)

## Webserver

Een *webserver* is een programma dat luistert naar requests op een specifieke poort (meestal poort 80 voor HTTP of poort
443 voor HTTPS). Het ontvangt de requests van clients, verwerkt deze, en stuurt een response
terug. Deze response kan een HTML-pagina, JSON-data, of een andere soort response zijn.

De webserver:

* Luistert naar request van de client
* Routeert het request naar de juiste resource of endpoint
* Verwerkt het request (ophalen van data, uitvoeren actie op de server)
* Stuurt response naar de client

Voorbeelden van webservers zijn *Apache* en *Nginx*. Maar de node module *Express* die we gebruiken bij deze cursus is
ook een webserver.

## Node

Gebruiken om server geschreven in javascript te draaien

## Express

Webserver die de requests afhandelt. Het routeert een request op basis van de URI naar de javascript functie van de
webservice, zodat deze de gevraagde actie uit kan voeren en bijbehordende response kan sturen.

// TODO technieken:

* import en Express appserver maken
* app laten luisteren
* method + routering (met parameter)
* index of app?

## Opdrachten

Installatie
Hello world

Hier nog even in 1 bestand? En in les 5 netjes verdelen?

// TODO: eventueel al OPTIONS

## Opdrachten

Opdracht: Collection en details zonder DB

## Server

Uitleg VPS
Inloggen, installeren node, sudo, ftp, npm / package.json

## Opdrachten

Op server draaien hello world collectie en details zonder db




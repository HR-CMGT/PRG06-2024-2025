# Les 4

## Volledige plaatje

// TODO: idem les 1, maar nu back-end focus

## REST

*REST* (REpresentational State Transfer) is een architectuur stijl voor het ontwerpen van webapplicaties, waarbij
gemaakt wordt van reguliere webtechnieken.
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
Content-Type: application/x-www-urlencoded

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

| Methode | Safe | Idempotent |
|---------|------|------------|
| GET     | Ja   | Ja         |
| HEAD    | Ja   | Ja         |
| PUT     | Nee  | Ja         |
| PATCH   | Nee  | Ja         |
| DELETE  | Nee  | Ja*        |
| OPTIONS | Ja   | Ja         |
| POST    | Nee  | Nee        |

*is afhankelijk van de implementatie

## POST Overloading

## Postman

Tool waarmee je een request volledig zelf kunt configureren

Ideaal voor testen/debuggen van een webservice

Opdracht: Oefenen met Postman (op chess/notes, of 'hacken' van een site)

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
een webserver.

## Node

Gebruiken om server geschreven in javascript te draaien

## Express

Webserver die de requests afhandelt. Het routeert een request op basis van de URI naar de javascript functie van de
webservice, zodat deze de gevraagde actie uit kan voeren en bijbehordende response kan sturen.

// TODO technieken:

* import en Express appserver maken
* app laten luisteren
* method + routering (met parameter)

Hier nog even in 1 bestand? En in les 5 netjes verdelen?

// TODO: eventueel al OPTIONS

Opdracht: Collection en details zonder DB

## Server

Inloggen, installeren node, sudo, ftp, npm / package.json
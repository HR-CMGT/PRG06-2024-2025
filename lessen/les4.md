# Les 4

- [Les 4](#les-4)
    - [Client/server model](#clientserver-model)
    - [REST](#rest)
    - [HTTP](#http)
        - [Request](#request)
        - [Response](#response)
    - [REST principes](#rest-principes)
    - [HTTP Methods](#http-methods)
    - [REST client](#rest-client)
        - [Postman](#postman)
            - [Opdracht 4.1](#opdracht-41)
    - [Webserver](#webserver)
    - [Node](#node)
    - [Express](#express)
        - [Opdracht 4.2](#opdracht-42)
        - [Opdracht 4.3](#opdracht-43)
    - [Server](#server)
        - [Shared hosting](#shared-hosting)
        - [VPS](#vps)
        - [Ubuntu](#ubuntu)
            - [Opdracht 4.4](#opdracht-44)

<br><br>

## Client/server model

<a href="images/fullpicture.svg" target="_blank">
  <img src="images/fullpicture.svg" alt="De volledige stack" width="70%">
</a>

| Tools     | Doel                                                                     |
|-----------|--------------------------------------------------------------------------|
| PhpStorm  | Voor ontwikkeling van zowel de front- als de backend                     |
| node      | JavaScript runtime op de backend.                                        |
| npm       | Packetmanager voor zowel front- als backend, om modules te installeren.  |
| vite      | Build-tool voor de front-end.                                            |
| ssh       | Remote terminal verbinding met de Ubuntu server waar de back-end draait. |
| FileZilla | FTP-client om bestanden over te zetten naar de back-end.                 |

- Onderdelen: Front-end, Back-end, Client, Server, Webserver, db/MongoDB
- Tools: PHPStorm, node, npm, vite, ssh, filezilla
- Modules: Express, Mongoose, React, Fetch, Tailwind
- Communicatie: HTTP

## REST

*REST* (REpresentational State Transfer) is een architectuur stijl voor het ontwerpen van webapplicaties, waarbij
gebruik
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
GET /products HTTP/1.1
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
- **Uniforme interface**: De communicatie tussen de client en de server gaat via HTTP, en is daardoor gestandariseerd.

[Extra uitleg over REST](https://medium.com/@bvsahane89/mastering-rest-apis-uniform-interface-in-rest-50b23062156f)

## HTTP Methods

In les 2 hebben we naar de meest gebruikte methods gekeken. Voor de implementatie van een webservice kijken we naar nog
een paar andere headers:

| Methode | Doel                                                                                   | CRUD   |
|---------|----------------------------------------------------------------------------------------|--------|
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
|---------|------|------------|
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

### Postman

Tijdens deze cursus maken we gebruik van Postman, maar er zijn ook andere REST clients.

#### Opdracht 4.1

<!-- Omdat de notes een eenvoudigere indeling hebben waarschijnlijk het beste om daarmee te doen -->

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

Express is de webserver die de requests afhandelt. Het routeert een request op basis van de URI naar de
JavaScript-functie van de webservice, zodat deze de gevraagde actie kan uitvoeren en de bijbehorende response kan
sturen.

**Voorbeeld**

```javascript
import express from 'express';

const app = express();

app.get('/', (req, res) => {
    res.send('Hello World!');
});

app.listen(process.env.EXPRESS_PORT, () => {
    console.log(`Server is listening on port ${process.env.EXPRESS_PORT}`);
});
```

Je kunt routes aan de app toevoegen voor een url, met en zonder parameters. Elke route is een functie met een `req`(
uest)
en een `res`(ponse) object. Het request kan je bijvoorbeeld gebruiken om parameters of headers van het request op te
vragen. Het response object om informatie aan de response toe te voegen en deze te verzenden.

**Voorbeeld:**

```javascript

app.get('/products/', (req, res) => {
    res.send('Alle producten');
});

app.get('/products/:id', (req, res) => {
    const productId = req.params.id;
    res.send(`Alleen product met id: ${productId}`);
});

```

#### Opdracht 4.2

* Volg [de installatie voor lokaal](../guides/installatie-week2.md)
* Maak het bestand `index.js` aan

* Maak het bestand `.env` aan
* Pas het run-script in `package.json` aan om te zorgen dat je `.env` wordt geladen

```
"scripts": {
    "dev": "node --env-file=.env --watch index.js"
  },
```

* Maak de 'Hello World' met Express
* Gebruik `.env` om het poort-nummer van je Express app te configureren
* Pas hem daarna aan om JSON terug te sturen.

#### Opdracht 4.3

* Maak een array met JSON objecten aan (tip: gebruik de array die je in les 1 hebt gemaakt)
* Maak een route voor het weergeven van de collectie
* Maak een route voor een detail uit de collectie

<!-- OPTIONS toevoegen? -->

## Server

Om een website of webservice te hosten, heb je een *server* (de computer) nodig die verbonden is met het internet. Op
deze server draait een *webserver* (het programma) dat luistert naar inkomende requests en de juiste responses
terugstuurt. Het nadeel van een aparte server voor elke website is dat dit veel resources kost.

### Shared hosting

Bij *shared hosting* worden meerdere websites op één webserver gehost, waardoor je meerdere websites op dezelfde
computer kunt zetten, zoals bijvoorbeeld op de student-spaces. Het nadeel hiervan is dat je geen volledige controle over
de server hebt en afhankelijk bent van wat de host aanbiedt. Daarnaast kan de performance van een website op dezelfde
server de prestaties van jouw website beïnvloeden.

### VPS

Een *Virtual Private Server (VPS)* is een virtuele machine (programma) op een fysieke server. In tegenstelling tot
shared
hosting krijg je bij een VPS volledige controle over jouw eigen omgeving, inclusief het besturingssysteem en de software
die je installeert. Ook kan het gebruik van resources (CPU en geheugen) per VPS ingesteld worden.

### Ubuntu

De VPS die we gebruiken draait op *Ubuntu*, een veelgebruikte versie van Linux. Je kunt hierop inloggen met *SSH* en
bestanden uploaden bestanden met *SFTP* (bijv. FileZilla).

In terminal/powershell:

```
ssh username@ip-address
```

Daarna log je in met je wachtwoord (cursus beweegt niet). Als je klaar bent log je uit met `exit` of CTRL-D.

Op de server installeer je de benodigde tools en libraries waarvoor `sudo` (superuser-rechten) nodig is. Omdat we met
`npm` werken, hoef je de `node_modules` niet te uploaden, omdat de benodigde modules automatisch
worden geïnstalleerd op basis van het bestand `package.json`.

#### Opdracht 4.4

* Volg [de installatie voor de server](../guides/installatie-week2.md)
* Login op je server met sftp, en zet je 'hello world' over zonder node_modules
* Login op je server met ssh en installeer de node modules (`npm install`)
* Start het project, en test of het werkt met een browser





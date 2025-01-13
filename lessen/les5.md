# Les 5

## MongoDB

*MongoDB* is een NoSQL-database die gegevens opslaat in documenten, in plaats van in tabellen zoals bij relationele
databases. Gegevens worden opgeslagen als JSON. De database zelf is ongestructureerd.

## Mongoose

De module *Mongoose* is een object-document mapper (ODM) voor *MongoDB*, vergelijkbaar met *Eloquent* in Laravel.
Hiermee kun je
vanuit JavaScript communiceren met de database. Daarnaast kun je in Mongoose modellen (schema's) maken voor objecten in
de ongestructureerde database.

```javascript
mongoose.connect('mongodb://127.0.0.1:27017/myapp');
```

### Schema

Een schema in *Mongoose* definieert de structuur van documenten in een MongoDB-collectie, vergelijkbaar met een model in
MVC.

**Voorbeeld:**

```javascript
import mongoose from 'mongoose';

const productSchema = new mongoose.Schema({
    name: {type: String, required: true},
    description: {type: String, required: true},
    price: {type: Number, required: true},
    inStock: {type: Boolean, default: true}
});

const Product = mongoose.model('Product', productSchema);

export default Product;
```

#### Opdracht 5.1

[Installatiehandleiding les 5](../guides/installatie-week2.md)

* Installeer MongoDB en Mongoose (op je laptop)
* Laat je app verbinden met de database
* Maak een Schema voor een note of spot, afhankelijk van de webservice die je vorige week in je React-applicatie hebt
  gebruikt (kijk naar een detail voor de juiste indeling)
  https://mongoosejs.com/docs/guide.html
* Maak een endpoint `/notes` of `/spots`
* Return de lijst als JSON (nu uiteraard nog leeg)
* Installeer fakerjs
* Maak een endpoint `/seed` voor een `POST` request
* Maak 10 fake items aan op dit endpoint en plaats ze in de database
* Voeg toe dat je ook een detail resource op kunt vragen
* Verplaats voor het overzicht je routes naar een `Router` in een apart
  bestand: https://expressjs.com/en/5x/api.html#router

https://fakerjs.dev/api/

## POST en PUT

Met `POST` en `PUT` worden gegevens naar de webservice gestuurd. Deze gegevens kunnen worden verzonden in twee formaten:

- **JSON**: Een gestructureerd dataformaat dat veel wordt gebruikt.
- **application/x-www-form-urlencoded**: Een oudere standaard, vaak gebruikt bij HTML-formulieren.

Om deze gegevens in een Express-applicatie te verwerken, zijn er middleware-functies zoals `express.json()` en
`express.urlencoded()` nodig.

**Voorbeeld:**

```javascript
import express from 'express';

const app = express();

// Middleware voor JSON-gegevens
app.use(express.json());

// Middleware voor www-urlencoded-gegevens
app.use(express.urlencoded({extended: true}));

app.post('/products', (req, res) => {
    // Toegang tot de ontvangen gegevens
    console.log(req.body);
    res.send('Gegevens ontvangen');
});

app.listen(8000, () => {
    console.log('Server luistert op poort 8000');
});
```

<!-- extra uitleg over json (structuur en datatypes) ? -->

#### Opdracht 5.2

* Laat je seed de database eerst leeg maken voor er nieuwe items worden aangemaakt (als je dat nog niet gedaan had)
* Voeg een parameter 'amount' toe aan je seed die als x-www-formurlencoded of JSON meegestuurd kan worden, waarmee je
  kunt kiezen met hoeveel items je webservice gevuld wordt
* Implementeer POST voor je webservice
* (Optioneel) Voeg een parameter 'reset' toe aan je seed waarmee je bepaald of je de database eerst leeg maakt of niet

## Status Codes

HTTP-statuscodes bestaan uit drie cijfers. Het eerste cijfer is de serie, en geeft aan in hoeverre de server er in
geslaagd is aan het request te voldoen. De laatste twee cijfers zijn voor meer gedetailleerde informatie. 00 wordt
gebruikt als er geen details zijn, of er geen specifieke code bestaat voor de details.

Een volledig overzicht van alle statuscodes kan je vinden
op [Wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

### 2xx – Succes

Statuscodes in de 2xx-serie geven aan dat het request succesvol is verwerkt door de server.

- **200 OK**  
  Het request is geslaagd en de server heeft een response gestuurd.

- **201 Created**  
  Er is een nieuwe resource aangemaakt. Dit wordt gebruikt bij een POST-request.

### 4xx – Clientfout

Statuscodes in de 4xx-serie geven aan dat er iets mis is met het request van de client waardoor de server het request
niet kan verwerken.

- **400 Bad Request**  
  Het request van de client is ongeldig, bijvoorbeeld door een syntaxfout of ontbrekende gegevens.

- **401 Unauthorized**  
  De server kan het request niet verwerken omdat je niet ingelogd bent wat je wel had moeten zijn.

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

### MongoDB

De Mongoose-module, die via npm wordt geïnstalleerd, is slechts een ODM (Object Document Mapper). Om een
database te hebben waarmee Mongoose kan communiceren, moet MongoDB zelf ook op de server worden geïnstalleerd.
Het is het handigst om deze als service te installeren zodat hij altijd actief is.

### Screen

Om een Express-project te laten draaien, ook als je de SSH-verbinding verbreekt, kun je gebruik maken van het
hulpprogramma screen. Hiermee kun je een proces starten in een virtuele sessie die blijft draaien op de server, zelfs
als je de verbinding verbreekt. Start een screen sessie met `screen`. Je kunt nu je Express project starten, en de
screen sessie verlaten (Ctrl+A en dan D), en uitloggen.
Als je later opnieuw inlogt kan je terugkeren naar de screen sessie, met: `screen -r`.

<!--
* verdeling van de lessen nalopen (lijkt wel erg veel in deze les, misschien kan mongo naar 4? Of anders PUT naar 6?)

// TODO technieken:


Ook uitschrijven, of tijdens de les behandelen?
* find met try/catch 
* headers in express sturen
* middleware (ook gebruiken om item aan request toe te voegen?)
* save en ValidationError of beter gewoon checken van lege velden?
-->

#### Opdracht 5.3

[Installatiehandleiding les 5](../guides/installatie-week2.md)

* Installeer MongoDB op de server
* Zet je app op de server en test met Postman
* Implementeer PUT en DELETE
* Voeg de juiste statuscodes toe (denk hierbij ook na over de scenarios als er iets misgaat!)

# Les 5

## MongoDB

*MongoDB* is een NoSQL-database die gegevens opslaat in documenten, in plaats van in tabellen zoals bij relationele
databases. Gegevens worden opgeslagen als JSON. De database zelf is ongestructureerd.

## Mongoose

De module *Mongoose* is een object-document mapper (ODM) voor *MongoDB*, net als *Eloquent* in Laravel. Hiermee kun je
vanuit JavaScript communiceren met de database. Daarnaast kun je in Mongoose modellen (schema's) maken voor objecten in
de ongestructureerde database.

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

* Installeer Mongodb en Mongoose
* Laat je app verbinden met de database
  https://mongoosejs.com/docs/connections.html
* Maak een Schema voor een note of puzzel (kijk naar een detail voor de juiste indeling)
  https://mongoosejs.com/docs/guide.html
* Maak een endpoint /notes of /chesspuzzel
* Return de lijst als JSON (nu uiteraard nog leeg)
* Installeer fakerjs
* Maak een endpoint `/seed`
* Maak 10 fake items aan op dit endpoint en plaats ze in de database
* Voeg toe dat je ook een detail resource op kunt vragen

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

app.post('/submit', (req, res) => {
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

* Implementeer POST voor je webservice

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

## URI

*URI* staat voor **Uniform Resource Identifier** en verwijst naar een resource (identifier). In veel gevallen gebruiken
we de term *URI* in de context van webservices, omdat het
om het identificeren van een resource gaat. Omdat de identifier ook de locatie aangeeft is de URI ook een **URL** (
Uniform
Resource Locator).

### Opbouw

```
scheme://host/path?query#fragment
```

- **scheme**: Het protocol waarmee de resource benaderd kan worden (bijvoorbeeld `http`, `https`).
- **host**: Het domein of IP-adres van de server waar de resource zich bevindt (bijvoorbeeld `www.example.com`).
- **port** (optioneel): De poortnummer op de server waarmee de client verbinding maakt (standaard is dit 80 voor HTTP en
  443 voor HTTPS).
- **path**: Het pad naar de specifieke resource op de server (bijvoorbeeld `/products/1`).
- **query** (optioneel): Een reeks parameters voor de resource (
  bijvoorbeeld `?category=books`).
- **fragment** (optioneel): Een verwijzing naar een specifiek deel van de resource (bijvoorbeeld `#section2`).

**Voorbeeld**

```
https://www.example.com/products/1?category=books#section2
```

<!--
In dit geval:

- Het **scheme** is `https`,
- De **host** is `www.example.com`,
- Het **path** is `/products/1`,
- De **query** is `?category=books`,
- Het **fragment** is `#section2`.
-->

## Headers

Headers worden gebruikt in de webservice om extra informatie mee te geven over een request of response. Bijvoorbeeld, de
`Accept`-header laat de service weten welk dataformaat de client verwacht in de response.

**Voorbeeld**

```javascript

app.get('/example', (req, res) => {
    // Check Accept header
    const acceptHeader = req.headers['accept'];

    console.log(`Client accepteert: ${acceptHeader}`);

    if (acceptHeader.includes('application/json')) {
        res.json({message: 'Dit is een JSON-response'});
    } else {
        res.status(400).send('Illegal format');
    }
});

```

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

* Implementeer PUT en DELETE
* Voeg de juiste statuscodes toe
* Implementeer OPTIONS
* Installeer MongoDB op je server
* Upload je project naar de server en test het net Postman
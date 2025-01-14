# Les 6

## URI

*URI* staat voor *Uniform Resource Identifier* en verwijst naar een resource (identifier). In veel gevallen gebruiken
we de term *URI* in de context van webservices, omdat het
om het identificeren van een resource gaat. Omdat de identifier ook de locatie aangeeft is de URI ook een *URL* (
Uniform
Resource Locator).

### Opbouw

```
scheme://host/path?query
```

- **scheme**: Het protocol waarmee de resource benaderd kan worden (bijvoorbeeld `http`, `https`).
- **host**: Het domein of IP-adres van de server waar de resource zich bevindt (bijvoorbeeld `www.example.com`).
- **port** (optioneel): De poortnummer op de server waarmee de client verbinding maakt (standaard is dit 80 voor HTTP en
  443 voor HTTPS).
- **path**: Het pad naar de specifieke resource op de server (bijvoorbeeld `/products/1`).
- **query** (optioneel): Een reeks parameters voor de resource (
  bijvoorbeeld `?category=books`).

<!--
- **fragment** (optioneel): Een verwijzing naar een specifiek deel van de resource (bijvoorbeeld `#section2`).
-->
**Voorbeeld**

```
https://www.example.com/products/1?category=books
```

<!--
In dit geval:

- Het **scheme** is `https`,
- De **host** is `www.example.com`,
- Het **path** is `/products/1`,
- De **query** is `?category=books`,
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

#### Opdracht 6.1

* Zorg dat alleen requests met een Accept-header voor `application/json` worden geaccepteerd, gebruik hiervoor
  middleware: https://expressjs.com/en/guide/using-middleware.html
* Implementeer OPTIONS

## HATEOAS

*HATEOAS* staat voor *Hypermedia As The Engine Of Application State* en is niet alleen een hele lelijke term, maar ook
een belangrijk concept binnen REST. Het
houdt in dat een client niet alle endpoints hoeft te kennen maar door de server geholpen wordt door middel van
hypermedia (links). De client kan hierdoor op basis van de huidige toestand van de applicatie, ontdekken welke acties
mogelijk zijn door de links te volgen die door de server worden aangeboden.

De server stuurt in een response dus niet alleen de gevraagde data, maar ook een set van links die de
client verder kan volgen.

### HAL (Hypertext Application Language)

*HAL* is een standaard voor het representeren van HATEOAS-links. Een heel belangrijke link die in elke resource aanwezig
moet zijn is de link naar `self`. Andere links zijn context-afhankelijk.

**Voorbeeld:**

```json
{
  "product": {
    "id": 1,
    "name": "Product A",
    "price": 100,
    "_links": {
      "self": {
        "href": "/products/1"
      },
      "next": {
        "href": "/products/2"
      },
      "related": {
        "href": "/categories/1"
      }
    }
  }
}
```

## Links toevoegen

Links zijn geen 'echt' onderdeel van je model omdat ze dynamisch gegenereerd (en mogelijk later veranderd) kunnen worden
door de server. Je voegt links daarom zelf toe aan de resource.

Je kunt Mongoose dynamisch laten *transformeren* tijdens de output, om links aan je detail resources toe te voegen.

```javascript
const MySchema = new Schema({
    // hier je schema
}, {
    toJSON: {
        virtuals: true,
        versionKey: false,
        transform: (doc, ret) => {

            ret._links = {
                self: {
                    href: `https://link_naar_self`
                },
                collection: {
                    href: `http://link_naar_collectie`
                }
            }

            delete ret._id
        }
    }
});
```

## Checker

Voor deze cursus hebben we een script dat op een aantal punten checkt of een webservice aan (onze) standaarden voldoet.

#### Opdracht 6.2

* Voeg links naar self en collection toe aan je detail resources
* Maak een JSON object aan met de volgende structuur voor je collection

```json
{
  "items": [
    {},
    {},
    {}
  ],
  "_links": {
    "self": {
      "href": "http://..."
    },
    "collection": {
      "href": "http://..."
    }
  }
}
```

* Update je project op de server
* Controleer je webservice met de checker

## CORS

*Cross-Origin Resource Sharing* (CORS) is een mechanisme voor *access control* waarmee je kunt beheren welke domeinen
toegang hebben tot de resources van je webserver. En kunt documenteren wat er mogelijk is in een webapplicatie.

Een *origin* bestaat uit het protocol (`http` of `https`), de domeinnaam (bijv.
`example.com`) en het poort-nummer (bijv. `:3000` of `:8000`). Het pad op de server is er geen onderdeel van.

| `http(s)://subdomain.example.com:port` | `/path/to/resource` |
|----------------------------------------|---------------------|
| **origin**                             | **geen origin**     |

### Headers

Hier zijn enkele van de meest gebruikte CORS-gerelateerde headers:

- `Access-Control-Allow-Origin`: Bepaalt welke sites (origins) toegang hebben tot de resource. Gebruik `*` om alle
  origins toe te staan.
- `Access-Control-Allow-Methods`: Geeft de HTTP-methoden aan die toegestaan zijn voor een resource (zoals `GET`, `POST`,
  `PUT`, enz.).
- `Access-Control-Allow-Headers`: Specificeert welke headers de client mag gebruiken in het request.

<!--
Dit lijkt niet nodig voor Authentication
- `Access-Control-Allow-Credentials`: Geeft aan of de client credentials, waaronder cookies, mag verzenden met het
  request.
-->

### Preflight

Een *preflight request* wordt uitgevoerd om te controleren of een cross-origin request toegestaan is op de server. Dit
gebeurt door eerst een `OPTIONS` request te sturen naar de resource voordat het daadwerkelijke request wordt verzonden.
Een preflight is niet nodig als het request aan de volgende voorwaarden voldoet:

- De HTTP-methode is `GET` of `POST`
- Er zijn geen bijzondere headers zoals `Authentication`
- Er worden geen custom headers gebruikt, zoals `x-requested-with`
- Er zijn geen aangepaste waarden voor standaard headers, zoals `Accept: application/json`
- Het `Content-Type` van het request is een van de volgende:
    - `application/x-www-form-urlencoded`
    - `multipart/form-data`
    - `text/plain`

**Let op** Omdat OPTIONS gebruikt wordt door preflights mogen er geen eisen aan het request gesteld worden. Dus
bijvoorbeeld geen Authorization of Accept header.

### Implementatie

Bij het opzetten van CORS in een RESTful webservice moet je met de volgende zaken rekening houden:

- In elke response moeten de toegestane origins worden aangegeven.
- Elke resource moet de toegestane headers specificeren.
- Een `OPTIONS` request moet, naast de standaard `Allow` header, ook de CORS-specifieke `Access-Control-Allow-Methods`
  header
  bevatten.
  NB. Een preflight wordt altijd zonder headers gestuurd, dus let op dat je geen eisen aan het request stelt (zoals een
  Accept-header).

#### Opdracht 6.3

* Voeg CORS toe
* Check of je OPTIONS ook zonder Accept-header werkt
* Ga verder met je project op basis van de feedback van de checker

#### Opdracht 6.4

Huiswerk: Denk na over een onderwerp voor je eigen full stack project

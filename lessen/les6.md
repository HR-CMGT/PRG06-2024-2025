# Les 6

## HATEOAS

*HATEOAS* staat voor **Hypermedia As The Engine Of Application State** en is niet alleen een hele lelijke term, maar ook
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

### Zelf toevoegen van de link aan de resource

Collection object maken met items en _links
Model omzetten naar JSON om bewerkbaar te maken

### Virtuals

Schema gebruiken om virtuals toe te voegen aan detail is nog netter

## Checker

Voor deze cursus hebben we een script dat op een aantal punten checkt of een webservice aan (onze) standaarden voldoet.

## Opdracht

* Collection structuur aanpassen, en links toevoegen

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

* Link naar self en collection toevoegen aan de details m.b.v. virtuals
* Update je project op de server
* Kijk wat de checker van je webservice vindt

## CORS

**Cross-Origin Resource Sharing** (CORS) is een mechanisme voor *access control* waarmee je kunt beheren welke domeinen
toegang hebben tot de resources van je webserver. En kunt documenteren wat er mogelijk is in een webapplicatie.

Een *origin* bestaat uit het protocol (`http` of `https`), de domeinnaam (bijv.
`example.com`) en het poort-nummer (bijv. `:3000` of `:8000`). Het pad op de server is er geen onderdeel van.

| `http(s)://subdomain.example.com:port` | `/path/to/resource` |
|----------------------------------------|---------------------|
| **origin**                             | **geen origin**     |

### Headers

Hier zijn enkele van de meest gebruikte CORS-gerelateerde headers:

- `Access-Control-Allow-Origin`: Bepaalt welke sites (origins) toegang hebben tot de resource.
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

#### Opdrachten

* CORS toevoegen
* Checker afmaken

Huiswerk: nadenken over eigen full stack project (onderwerp)

# Les 7

Een webservice is bedoeld om gegevens te ontvangen en versturen. Het kan goed zijn om kritisch te kijken of je niet
te veel gegevens verstuurd.

* Verhoogt de snelheid (voor de gebruiker)
* Vergroot de performance (van je service)
* En bespaart daarnaast bandbreedte

## Beperken gegevens in de collection

Als je het volledige resultaat voor elke detailresource uit de database laat zien in de collectie, zoals we tot nu toe
gedaan hebben, toon je ook veel niet-relevante gegevens. Door alleen de gegevens te tonen die noodzakelijk zijn om te
kunnen kiezen of een gebruiker geïnteresseerd is in de resource, kan de index een stuk kleiner worden. De gebruiker kan
vervolgens zelf de details voor de voor hem relevante resources opvragen.

// TODO: Voorbeeld toevoegen?

## Pagination

Een andere manier om de collectie te verkleinen is *pagination*.
Pagination is het verdelen van een collection in kleinere stukken (pagina's). Dit is goed voor de performance van je
webservice omdat je minder data hoeft te verwerken en te versturen. Ook
verbetert het het gebruiksgemak van je service omdat iemand kan kiezen om alleen het deel op te halen dat hij nodig
heeft. Bij pagination hoort ook navigatie, vergelijkbaar met de navigatie onderaan een blog, om de gebruiker te helpen
door de collectie te bladeren..

Voorbeeld van een gepagineerde response:

```json
{
  "items": [
    ...eerste_6_items_uit_de_collectie...
  ],
  "_links": [
    ...links_waaronder_link_naar_self...
  ],
  "pagination": {
    "currentPage": 1,
    "currentItems": 6,
    "totalPages": 2,
    "totalItems": 12,
    "_links": {
      "first": {
        "page": 1,
        "href": "http://example.com/?page=1&limit=6"
      },
      "last": {
        "page": 2,
        "href": "http://example.com/?page=2&limit=6"
      },
      "previous": null,
      "next": {
        "page": 2,
        "href": "http://example.com/?page=2&limit=6"
      }
    }
  }
}
```

## Caching

*Caching* is het bewaren van een kopie van iets dat tijd kost om te maken of op te halen. Als je dit dan een tweede keer
nodig hebt kan je het direct uit je *cache* halen.
Doordat een RESTful architectuur stateless is, past caching hier erg goed bij omdat een zelfde request altijd dezelfde
response moet geven, zolang er niets veranderd is op de server.
Je kunt de gebruiker hierbij helpen door aan te geven hoe lang een resource gecacht kan worden.

Bijvoorbeeld: Een uur ```Cache-Control: max-age=3600```, of nooit ```Cache-Control: no-cache```

Een andere manier om de gebruiker te helpen is door een *conditional request* te implementeren in je service.
Hiervoor kijk je naar de request header `If-Modified-Since`.

### Voorbeeld

**Request**

```
GET /products/1
If-Modified-Since: Mon, 6 Jan 2025 09:01:45 GMT
```

**Response**

```
HTTP/1.1 200 OK
Content-Type: application/json
Last-Modified: Mon, 7 Jan 2025 10:15:09 GMT

[Hier de body met te resource]
```

of (als er geen wijzigingen waren)

```
HTTP/1.1 304 Not Modified
Last-Modified Mon, 6 Jan 2025 09:01:45 GMT
```

<!--
Etag, Age en Expires worden ook gebruikt, maar zijn niet verplicht https://developer.mozilla.org/en-US/docs/Web/HTTP/Conditional_requests
Alleen Last-Modified is de meest basic manier, maar vind ik ook de meest inituitieve manier en het beste bij REST passen, omdat hier de client zelf niet hoeft te rekenen of hashes te bewaren, enkel de datum wanneer het request gedaan is
-->

### Mappenstructuur

### Controller

## Opdracht

* Werken aan eindopdracht

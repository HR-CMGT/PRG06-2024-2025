# Les 6

## HATEOAS

*HATEOAS* staat voor **Hypermedia As The Engine Of Application State** en is niet alleen een hele lelijke term, maar ook
een belangrijk concept binnen REST. Het
houdt in dat een client niet alle endpoints hoeft te kennen maar door de server geholpen wordt, door middel van
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

## Virtuals

## CORS en OPTIONS

## Pagination


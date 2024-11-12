# Les 7

## Pagination

*Pagination*, het verdelen van een collection in kleinere stukken (pagina's), is goed voor de performance van je
webservice omdat je minder data hoeft te verwerken en te versturen. Ook
verbetert het het gebruiksgemak van je service omdat iemand kan kiezen om alleen het deel op te halen dat hij nodig
heeft. Bij pagination hoort ook de bijbehorende navigatie, vergelijkbaar met de navigatie onderaan een blog.

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

## Controller toevoegen

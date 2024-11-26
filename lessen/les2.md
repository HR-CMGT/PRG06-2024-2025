# Les 2

## Request / Response

Het *client-servermodel* is een structuur waarin de client (bijvoorbeeld een browser) verzoeken stuurt
naar de server. De server verwerkt deze verzoeken en stuurt de nodige informatie terug naar de client (bijvoorbeeld een
webpagina).

Een webbrowser is de bekendste versie van een client, maar bij deze cursus gebruiken we ook twee andere clients.

### REST client

Een *REST client* is een tool die het mogelijk maakt om verzoeken naar een server te sturen en de respons te ontvangen,
zonder dat hier een webbrowser voor nodig is.

Voordelen hiervan zijn:

* dat een REST client rechtstreeks kan communiceren met een webservice;
* je in een REST client zelf kunt instellen welke HTTP-methode je gebruikt, zoals `GET` of `POST`, maar ook alle andere
  methoden;
* je volledige controle en inzicht hebt in de headers van het request en de response.

// TODO: Postman nu al gebruiken of pas in les 4?

### Fetch API

De *Fetch API* is ook een client. Hiermee kan je HTTP-verzoeken te doen vanuit JavaScript om data op te halen
en versturen naar een server.
Je hebt hierbij ook volledige controle over het request om te kunnen communiceren met een webservice.

// TODO: async

// TODO: omzetten naar await! + try catch uitleggen?

#### Voorbeeld GET

```javascript
fetch('https://api.example.com/products/1', {
    method: 'GET',
    headers: {
        'Accept': 'application/json'
    }
})
    .then(response => response.json())
    .then(data => {
        console.log(data);
    });
```

#### Voorbeeld POST

```javascript
fetch('https://api.example.com/products', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        name: 'Voorbeeldproduct',
        description: 'Dit is een voorbeeld productbeschrijving'
    })
})
    .then(response => response.json())
    .then(data => {
        console.log(data);
    });
```

// TODO: collectie en detail resource uitleggen

## Methods

In HTTP forulieren kan je alleen GET en POST gebruiken, maar er zijn er meer (zoals we bij Laravel al gezien hebben).
De Fetch API ondersteunt alle methoden, en daar maken we gebruik van als we communiceren met een RESTful webservice.

// TODO: Woord RESTful hier al noemen?

| Methode | Doel                                                          | CRUD   | 
|---------|---------------------------------------------------------------|--------|
| GET     | Iets ophalen van de webservice (collectie of detail resource) | Read   |
| PUT     | Een detail resource aanpassen                                 | Update |
| DELETE  | Een detail resource verwijderen                               | Delete |
| POST    | Een nieuwe resource toevoegen aan een colletie                | Create |

## API

### Chess

### Notes

## React Lifecycle

### Pseudo-DOM

React maakt gebruik van een *pseudo-DOM*, of virtuele DOM, om updates efficiënt door te voeren. Als een component zijn
`state` of `props` verandert, creëert React eerst een nieuwe versie van de DOM in het
geheugen. Daarna vergelijkt React de virtuele DOM met de echte DOM en past alleen de verschillen toe. Hierdoor
worden onnodige updates voorkomen, wat zorgt voor betere prestaties.

### useState (herhaling)

Met de `useState`-hook kan je een reactive variabele aanmaken. Aanpassingen van de state-variabele via de setter zorgen
ervoor dat React het component opnieuw rendert.

### useEffect

`useEffect` is een andere hook in React waarmee je functies kunt uitvoeren als een component voor het eerst laadt
of wanneer data verandert. Dit is handig voor bijvoorbeeld het ophalen van de content vanuit een webservice.

```javascript
import React, {useState, useEffect} from 'react';

function ProductComponent() {
    const [product, setProduct] = useState(null);

    useEffect(() => {
        fetch('https://api.example.com/products/1')
            .then(response => response.json())
            .then(data => setProduct(data));
    }, []); // Lege array zorgt ervoor dat useEffect alleen bij de eerste render wordt uitgevoerd.

    return (
        <div>
            {product ? (
                <div>
                    <h1>{product.name}</h1>
                    <p>{product.description}</p>
                </div>
            ) : (
                <p>Product laden...</p>
            )}
        </div>
    );
}

export default ProductComponent;
```

// TODO: tweede parameter van useEffect

Allemaal in dezelfde API,... let op: dit wordt rommelig ;-)

Opdracht: lijst tonen

Opdracht: detail tonen

Opdracht: nieuwe resource aanmaken
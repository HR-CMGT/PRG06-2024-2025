# Les 2

## Request / Response

Het *client-servermodel* is een structuur waarin de client (bijvoorbeeld een browser) verzoeken stuurt
naar de server. De server verwerkt deze verzoeken en stuurt de nodige informatie terug naar de client (bijvoorbeeld een
webpagina).

Een webbrowser is de bekendste versie van een client, maar bij deze cursus gebruiken we ook twee andere clients.

## REST client

Een *REST client* is een tool die het mogelijk maakt om verzoeken naar een server te sturen en de respons te ontvangen,
zonder dat hier een webbrowser voor nodig is. We kijken hier verder naar in les 4.

## Fetch API

De *Fetch API* is ook een client. Hiermee kan je HTTP-verzoeken te doen vanuit JavaScript om data op te halen
en versturen naar een server.
Je hebt hierbij ook volledige controle over het request om te kunnen communiceren met een webservice.

### async ... await

Om te zorgen dat een UI altijd *responsive* blijft, mag JavaScript nooit geblokkeerd worden. Functies die dit zouden
kunnen doen doordat ze lang kunnen duren, zoals `fetch`, zijn daarom *asynchroon*. Dit betekent dat de applicatie niet
wacht tot de functie klaar is, maar door gaat met de rest van het programma. Dit geeft echter een probleem als (een deel
van) je programma afhankelijk is van het resultaat van de asynchrone functie. De oplossing hiervoor is het keyword
`await`. Als je dit voor de asynchrone functie zet wacht het programma tot de functie klaar is. Om te voorkomen dat de
uitvoering van JavaScript hierdoor geblokkeerd wordt, mag je `await` alleen gebruiken in een functie die je met het
keyword `async` zelf asynchroon wordt: binnen de functie wordt er dan gewacht, maar de rest van je programma wacht niet
meer op deze functie!

```javascript
async function getData() {
    await fetch
...
    // dit wordt pas uitgevoerd nadat fetch klaar is
    // doe iets met het resultaat
}

getData();
// dit wordt uitgevoerd voor getData klaar is
```

### try ... catch

Naast dat er functies die een programma kunnen blokkeren, zijn er ook functies die kunnen crashen omdat er tijdens de
uitvoering iets mis gaat. Het gaat hier niet om fouten in het programma zelf, maar problemen die op kunnen treden
tijdens uitvoering, zoals het ontbreken van een internetverbinding of het uitlezen van een corrupt JSON bestand. We
noemen dit soort fouten *runtime errors* of *exceptions*. Als je hier niks tegen doet crasht je programma, maar je kunt
dit voorkomen door de code die dit kan veroorzaken in een `try`, `catch` blok te zetten. In de `catch` kan je dan
bepalen wat je
programma doet als de fout optreedt.

```javascript
try {
    // hier zet je code waarin een runtime error kan optreden
} catch (error) {
    // hier zet je code die uitgevoerd moet worden in geval dat iets mis gaat. 
    // de parameter eroor bevat nu de error die opgetreden is, wat handig is als er meerdere dingen in de try 
    // staan die fout kunnen gaan
    console.log(error.message);
}
```

### Voorbeeld GET

```javascript
async function fetchProduct() {
    try {
        const response = await fetch('https://api.example.com/products/1', {
            method: 'GET',
            headers: {
                'Accept': 'application/json'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Er is een fout opgetreden:', error);
    }
}

fetchProduct();
```

### Voorbeeld POST

```javascript
async function createProduct() {
    try {
        const response = await fetch('https://api.example.com/products', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: 'Voorbeeldproduct',
                description: 'Dit is een voorbeeld productbeschrijving'
            })
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Er is een fout opgetreden:', error);
    }
}

createProduct();
```

## Collection

De collection is het belangrijkste *endpoint* van de webservice die we gaan gebruiken. Je kunt hier een lijst ophalen
van de beschikbare items. Ook kan je hier nieuwe items toevoegen aan de webservice.

## Detail

In de collectie vind je links naar de details van een item. Via die link kan je niet alleen de details ophalen, maar ook
aanpassen en het item verwijderen.

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

## Voorbeeld webservices

### Chess

### Notes

## React Lifecycle

### Pseudo-DOM

React maakt gebruik van een *pseudo-DOM*, of virtuele DOM, om updates efficiënt door te voeren. Als een component zijn
`state` of `props` verandert, creëert React eerst een nieuwe versie van de DOM in het
geheugen. Daarna vergelijkt React de virtuele DOM met de echte DOM en past alleen de verschillen toe. Hierdoor
worden onnodige updates voorkomen, wat zorgt voor betere prestaties.

### Hooks

React heeft verschillende *hooks* waarmee je kunt verbinden ('aan kunt haken') bij het framework. Een voorbeeld van een
hook, is `useState`. Je herkent hooks aan het voorvoegsel `use`.

### useState (herhaling)

// TODO: dit staat ook al in week 1, nalopen
// TODO: toevoegen setter kan ook als prop doorgegeven worden 'lifting state up'

Met de `useState`-hook kan je een reactive variabele aanmaken. Aanpassingen van de state-variabele via de setter zorgen
ervoor dat React het component opnieuw rendert.

// TODO: syntax zelf uitleggen of linken naar React documentatie.

### useEffect

`useEffect` is een andere hook in React waarmee je functies kunt uitvoeren als een component voor het eerst laadt
of wanneer data verandert. Dit is handig voor bijvoorbeeld het ophalen van de content vanuit een webservice.

// TODO: tweede parameter van useEffect

```javascript
import React, {useState, useEffect} from 'react';

function ProductComponent() {
    const [product, setProduct] = useState(null);

    useEffect(() => {
        async function fetchProduct() {
            try {
                const response = await fetch('https://api.example.com/products/1');
                const data = await response.json();
                setProduct(data);
            } catch (error) {
                console.error('Fout bij het ophalen van het product:', error);
            }
        }

        fetchProduct();
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

#### Opdracht

lijst tonen

#### Opdracht

detail tonen

## Forms

State variabelen / generieke handler

#### Opdracht

nieuwe resource aanmaken

// Allemaal in dezelfde API,... let op: dit wordt rommelig ;-)

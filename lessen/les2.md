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

De *Fetch API* is ook een client. Hiermee kan je HTTP-verzoeken doen vanuit JavaScript om data op te halen
en te versturen naar een server.
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

Naast dat er functies zijn die een programma kunnen blokkeren, zijn er ook functies die kunnen crashen omdat er tijdens
de
uitvoering iets mis gaat. Het gaat hier niet om fouten in het programma zelf, maar problemen die op kunnen treden
tijdens uitvoering, zoals het ontbreken van een internetverbinding of het uitlezen van een corrupt JSON bestand. We
noemen dit soort fouten *runtime errors* of *exceptions*. Als je hier niks tegen doet crasht je programma, maar je kunt
dit voorkomen door de code die dit kan veroorzaken in een `try`, `catch` blok te zetten. In de `catch` kan je dan
bepalen wat je
programma moet doen als de fout optreedt.

```javascript
try {
    // hier zet je code waarin een runtime error kan optreden
} catch (error) {
    // hier zet je code die uitgevoerd moet worden in geval dat iets mis gaat. 
    // de parameter "error" bevat nu de error die opgetreden is, wat handig is als er meerdere dingen in de try 
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

In HTML-formulieren kan je als method alleen GET en POST gebruiken, maar er bestaan er meer (zoals we bij Laravel al
gezien hebben).
De Fetch API ondersteunt alle methoden en daar maken we gebruik van als we communiceren met een webservice.

| Methode | Doel                                                          | CRUD   |
|---------|---------------------------------------------------------------|--------|
| GET     | Iets ophalen van de webservice (collectie of detail resource) | Read   |
| PUT     | Een detail resource aanpassen                                 | Update |
| DELETE  | Een detail resource verwijderen                               | Delete |
| POST    | Een nieuwe resource toevoegen aan een collectie               | Create |

## Voorbeeld webservices

**Let op:** Beide webservices verwachten dat je bij een request een Accept-header (`Accept: application/json`)
meestuurt.

### Chess Spots

https://prg06-node-express.antwan.eu/spots/

### Notes

https://notes.basboot.nl/notes

## React Lifecycle

### Pseudo-DOM

React maakt gebruik van een *pseudo-DOM*, of virtuele DOM, om updates efficiënt door te voeren. Als een component zijn
`state` of `props` verandert, creëert React eerst een nieuwe versie van de DOM in het
geheugen. Daarna vergelijkt React de virtuele DOM met de echte DOM en past alleen de verschillen aan. Hierdoor
worden onnodige updates aan de echte DOM voorkomen, wat zorgt voor betere prestaties.

### Hooks

React heeft verschillende *hooks* waarmee je kunt verbinden ('aan kunt haken') bij het framework. Een voorbeeld van een
hook, is `useState`. Je herkent hooks aan het voorvoegsel `use`.

### useState (herhaling)

Met de `useState`-hook kan je een reactive variabele aanmaken. Aanpassingen van de state-variabele via de setter zorgen
ervoor dat React het component opnieuw rendert.

https://react.dev/reference/react/useState

### useEffect

`useEffect` is een andere hook in React waarmee je functies kunt uitvoeren als een component voor het eerst laadt
of wanneer data verandert. Dit is handig voor bijvoorbeeld het ophalen van de content vanuit een webservice.

```javascript
// functie f wordt bij elke render van het component uitgevoerd
useEffect(f);
// functie f wordt alleen bij de eerste render van het component uitgevoerd
useEffect(f, [])
// functie f wordt bij de eerste render van het component, en bij een verandering van variabele v
useEffect(f, [v])
```

https://react.dev/reference/react/useEffect

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

#### Opdracht 2.1: Lijst tonen

Implementeer een React-component dat data ophaalt uit een
webservice ([zie voorbeeld webservices](#voorbeeld-webservices)) en een lijst toont. Gebruik `fetch` om de gegevens
op te halen en toon de lijst in een `<ul>`.

- Haal een collectie van items op.
- Gebruik een `useEffect`-hook om de fetch te doen bij het laden van het component.
- Gebruik een `useState`-hook om de opgehaalde data op te slaan.
- Toon een loading-indicator terwijl de data wordt opgehaald (optioneel).

#### Opdracht 2.2: Netter maken

Vervang de `<ul>` door een `<article>` in een apart component. Geef via de props alleen het id door aan het component.

## Forms

In React worden formulieren vaak beheerd met behulp van een state-object, in plaats van aparte state variabelen. Dit
object slaat de waarden van de
invoervelden op en wordt bijgewerkt naarmate de gebruiker gegevens invoert. Hierdoor kan je een generieke *handler*
maken voor
de invoer van alle formuliervelden, in plaats van een aparte handler voor elk veld.

```javascript
import React, {useState} from 'react';

function FormComponent() {
    const [formData, setFormData] = useState({
        name: '',
        email: '',
    });

    // Generieke handler voor het bijwerken van de state
    const handleInputChange = (event) => {
        const {name, value} = event.target;
        setFormData({
            ...formData,
            [name]: value,
        });
    };

    const handleSubmit = (event) => {
        event.preventDefault();
        console.log('Formulier verzonden:', formData);
    };

    return (
        <form onSubmit={handleSubmit}>
            <div>
                <label htmlFor="name">Naam:</label>
                <input
                    type="text"
                    id="name"
                    name="name"
                    value={formData.name}
                    onChange={handleInputChange}
                />
            </div>
            <div>
                <label htmlFor="email">E-mailadres:</label>
                <input
                    type="email"
                    id="email"
                    name="email"
                    value={formData.email}
                    onChange={handleInputChange}
                />
            </div>
            <button type="submit">Verzenden</button>
        </form>
    );
}

export default FormComponent;

```

#### Opdracht 2.3: Nieuwe resource

Implementeer het toevoegen van een nieuwe resource via een formulier. Het formulier is
een apart component dat je onder de bestaande collectie plaatst. Zorg ervoor dat de collectie opnieuw wordt
gerenderd nadat de nieuwe resource is toegevoegd.

- Maak een apart formuliercomponent waarin de gebruiker de gegevens van een nieuwe resource kan invoeren.
- Gebruik `useState` in het formuliercomponent om de invoer van de gebruiker in een object bij te houden.
- Gebruik `fetch` om een `POST`-verzoek te versturen naar een RESTful webservice om de nieuwe resource aan te maken.
- Zorg ervoor dat de collectie opnieuw wordt opgehaald of bijgewerkt via *lifted state* nadat de `POST` is
  uitgevoerd.

<!-- // Allemaal in dezelfde API,... let op: dit wordt rommelig ;-) -->

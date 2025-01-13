# Les 9

## Context API

De Context API in React is een alternatief voor het doorgeven van props, vooral wanneer je dezelfde data wilt delen met
meerdere componenten of met componenten die diep genest zijn.

* `createContext` Hiermee maak je een context aan, die fungeert als een container voor de gedeelde data. Je kunt een
  standaardwaarde meegeven.
* `<ContextComponent.Provider>` maakt de context beschikbaar in de JSX-structuur, om de waarde door te geven aan de
  onderliggende componenten.

Door een object te gebruiken in de context kan je eenvoudig meerdere gegevens delen binnen je app, waaronder state
variabelen en setters.

https://react.dev/reference/react/createContext

<!--
* eigenlijk alleen interessant als je reactive variabelen in de context stopt
-->

<!--

### Use cases

- server state centraal?
- loginstatus / jwt

-->

## Foutafhandeling

We hebben `try` en `catch` gebruikt om fouten af te handelen bij een `fetch`. Een statuscode 400 of 500 wordt door
`fetch` echter niet gezien als een `Error` omdat het versturen van het request en ontvangen van een response gelukt is.
Door zelf een foutmelding te `throw`en, kan je je app alsnog laten weten dat er iets mis is met het request.

```javascript
async function fetchProduct() {
    try {
        const response = await fetch('https://api.example.com/products/1', {
            method: 'GET',
            headers: {
                'Accept': 'application/json'
            }
        });

        // create exception
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Er is een fout opgetreden:', error);
    }
}

fetchProduct();

```

Je kunt ook na de fetch, de status-code meteen afghandelen.

```javascript
async function fetchProduct() {
    let response;
    try {
        response = await fetch('https://api.example.com/products/1', {
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

    // check response code (eg 403)
    if (response?.ok) {
        console.log('Use the response here!');
    } else {
        console.log(`HTTP Response Code: ${response?.status}`)
    }
}

fetchProduct();
```

<!--
zou misschien een alternatief extra onderdeel kunnen zijn.
-->

### 404

De meest voorkomende use case hiervoor is waarschijnlijk de 404, als iemand een verkeerde URL voor een detail-pagina
gebruikt.

#### Opdracht 9.1

Ga verder met je eindopdracht
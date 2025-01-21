# Les 9

## Context API

De Context API in React is een alternatief voor het doorgeven van props, vooral wanneer je dezelfde data wilt delen met
meerdere componenten of met componenten die diep genest zijn.

* `createContext` Hiermee maak je een context Component aan, die fungeert als een container voor de gedeelde data. Je
  kunt een
  standaardwaarde meegeven.
* `<NaamVanJouwContextComponent.Provider>` maakt de context beschikbaar in de JSX-structuur, als value kan je meegeven
  wat er in de context moet zitten.
* `useContext` vist de value uit de context op in het component als deze beschikbaar is.

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

## Foutafhandeling in React

Foutafhandeling is een belangrijk onderdeel voor de gebruikersvriendelijkheid van een applicatie. Bij front-end routing
in React en het gebruik van een webservice via fetch kunnen fouten op verschillende manieren optreden, en zullen we die
ook op verschillende manieren moeten oplossen.

### Verkeerde URLs

Met `createBrowserRouter` kun je een standaardcomponent (`errorElement`) instellen voor ongeldige routes (een
404-pagina). Dit handelt dan automatisch alle niet bestaande URLs af.

### Fouten bij communiceren met de webservice

Bij het laden van data via fetch kan er een probleem ontstaan als de server een foutstatus teruggeeft (bijvoorbeeld 404
als het id in de URL niet bestaat). Dit zijn geen technische fouten, omdat request en response succesvol
waren. Daarom beschouwt fetch deze niet als fouten, en wordt de `catch` niet uitgevoerd.
Je kunt er in dit geval voor kiezen om zelf een `Error` the `throw`en, die je dan in je app kunt afhandelen om de
gebruiker te laten weten wat er mis gegaan is.

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

Of je kunt na de fetch, de status-code meteen af laten handelen.

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

#### Opdracht 9.1

Ga verder met je eindopdracht
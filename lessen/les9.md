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
Om ervoor te zorgen dat je applicatie dit toch als een fout ziet, kan je zelf een `Error` 'throwen' waardoor de
catch uitgevoerd wordt, zodat je app verbindingsfouten en request-fouten op dezelfde manier kan afhandelen, en de
gebruiker kan laten zien wat er mis gegaan is.

```javascript
async function fetchProduct(id) {
    try {
        const response = await fetch(`https://api.example.com/products/${id}`, {
            method: 'GET',
            headers: {
                'Accept': 'application/json'
            }
        });

        // throw exception
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        console.log(data);

        // data can now be used for the app (eg. return product / setProduct)
    } catch (error) {
        console.error('Er is een fout opgetreden:', error);
        // error can now be used in the app (eg. return error message instead of product / navigate to error page)
    }
}

fetchProduct();

```

## Publiceren React App

Een React applicatie bestaat uit HTML, CSS en Javascript (en eventuele assets zoals plaatjes). Om deze live te zetten
heb je een webserver nodig, zoals Apache, Nginx of Express met static routes, waarmee je statische bestanden kunt
serveren.

### Live zetten

Als je het build script (`npm run build`) draait, genereert vite de statische bestanden waaruit de applicatie bestaat,
en plaatst deze in de map `dist`. Als je de inhoud hiervan op je webserver zet staat je app 'live'.

### Front-end routing

Om front-end routing te laten werken, moet de back-end routing zorgen dat de requests altijd naar `index.html` gaan,
tenzij het bestand echt bestaat:

De logica in de back-end routing is:

* Bestaat het bestand echt, routeer dan niet (anders werken je plaatjes en CSS niet meer)
* In alle andere gevallen, routeer naar `index.html`

De configuratie van routering verschilt per webserver.

#### Opdracht 9.1

Ga verder met je eindopdracht
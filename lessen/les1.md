# Les 1

<!--

// TODO: styling voor alle lessen nalopen

# Les X
## Onderwerp
### Subkopje bij onderwerp
#### Lesopdracht

`code-term`
*andere terminologie* (alleen eerste keer)
**om iets te benadrukken**

JavaScript, javascript?
html, HTML

-->

In deze cursus (Full Stack Web Development) leer je een webapplicatie te bouwen met een reactive front-end en een
RESTful back-end. De front-end en back-end zijn dus gescheiden applicaties. We maken gebruik van de **MERN** stack:
**R**eact voor de dynamische front-end en **N**ode.js, **E**xpress, en **M**ongoDB voor de back-end en dataopslag.

Aan het einde van de cursus kun je zelfstandig een Full Stack webapplicatie
opzetten, beveiligen en hosten op een
server.

## Overzicht cursus

### Week 1

Oefenen reactive front-end

### Week 2

Oefenen RESTful back-end

### Week 3

Eindopdracht en verdieping

### Week 4

Zelfstandig afronden eindopdracht

## Web development cursussen tot nu toe

| Cursus       | Kenmerken                                              |
|--------------|--------------------------------------------------------|
| FED          | Geen logica op de backend en front-end                 |
| PRG2 en PRG5 | Alle logica op de backend, geen logica op de front-end |
| PRG3 en PRG6 | Data-logica op de backend, UI-logica op de front-end   |

Tijdens deze cursus ligt de focus op:

* Reactive front-end (UI)
* RESTful back-end (Data)
* Communicatie (HTTP)
* Installatie op de server

## Volledige plaatje

<a href="images/fullpicture.svg" target="_blank">
  <img src="images/fullpicture.svg" alt="De volledige stack" width="70%">
</a>

| Tools     | Doel                                                                     |
|-----------|--------------------------------------------------------------------------|
| PHPStorm  | Voor ontwikkeling van zowel de front- als de backend                     |
| node      | JavaScript runtime op de backend.                                        |
| npm       | Packetmanager voor zowel front- als backend, om modules te installeren.  |
| vite      | Build-tool voor de front-end.                                            |
| ssh       | Remote terminal verbinding met de Ubuntu server waar de back-end draait. |
| FileZilla | FTP-client om bestanden over te zetten naar de back-end.                 |

// TODO: Blur REST backend / weekindeling in plaatje?

- Onderdelen: Front-end, Back-end, Client, Server, Webserver, db/MongoDB
- Tools: PHPStorm, node, npm, vite, ssh, filezilla
- Modules: Express, Mongoose, React, Fetch, Tailwind(?)
- Communicatie: HTTP

## Reactive frameworks

* React maakt gebruik van een virtuele DOM, of pseudo-DOM, om efficiënt te renderen. Hierdoor worden in de echte DOM
  alleen updates gedaan op plekken waar in de pseudo-DOM vastgesteld is dat ze veranderd zijn.
* Het framework is *event-driven*; componenten reageren op events en passen de interface aan.
* Bij veranderingen in data wordt de rendering automatisch getriggerd, wat zorgt voor een *reactieve*
  gebruikerservaring.

## React project

Voor een React project heb je onderstaande tools nodig.

### Node

*Node.js* maakt het mogelijk om JavaScript buiten de browser te draaien. Voor nu is het alleen nodig om de *package
manager* te gebruiken. Het draaien van volledige serverfunctionaliteit in JavaScript komt bij de back-end.

### Npm

*Node Package Manager (npm)* is een beheertool voor JavaScript-pakketten. Hiermee kun je eenvoudig modules (node
packages) installeren en verwijderen.

| Onderdeel    | Uitleg                                                                                                                |
|--------------|-----------------------------------------------------------------------------------------------------------------------|
| package.json | Bevat projectinformatie en een lijst van benodigde dependencies en scripts                                            |
| run scripts  | Hiermee kun je npm-commando's definiëren in package.json voor het draaien van opdrachten zoals `npm start`            |
| type=module  | Is een instelling van je project waardoor je de ES6 `import` syntax kunt gebruiken in plaats van het oudere `require` |

### Vite

*Vite* is een ontwikkeltool waarmee je de React-app met live updates (hot-reloading) kunt ontwikkelen en later kunt
builden (of 'bundelen') voor productie.

### Tailwind

*Tailwind* is een CSS-framework dat gebruik maakt van voorgedefinieerde CSS-classes om styling aan je app toe te voegen.
Op deze manier kan je alle styling direct in het component toevoegen. Dit maakt de herbruikbaarheid van componenten nog
makkelijker omdat het compleet is met logica en vormgeving.

### React

En natuurlijk hebben we *React* zelf nodig om de gebruikersinterface te bouwen. :-)

## React

Een react app is een single page web applicatie. Opgebouwd uit componenten. Er is data binding door middel van (state)
variabelen. Dit betekent dat een verandering van een variabele zorgt voor automatische re-rendering van (delen van) de
pagina.
Dit is wat we bedoelen als we zeggen dat een applicatie *reactive* is.

// TODO: Hello world https://tailwindcss.com/docs/guides/vite

### Components

Functie die html returnt
Hergebruik, overzicht, losse bestanden

// TODO: Vergelijk Laravel (zowel componenten als props).

### JSX

Omdat componenten bedoeld zijn om html terug te geven, wordt er geen gebruik gemaakt van gewoon JavaScript, maar van
JSX. Dit is een mix van JavasScript en HTML. Je kunt gewoon JavaScript schrijven zoals je gewend bent, maar op plekken
waar een string verwacht wordt kan je ook HTML schrijven zonder aanhalingstekens te gebruiken.

Er zijn wel een paar dingen waar je rekening mee moet houden:

* Er mag maar één root element zijn. Om dit makkelijker te maken bestaat er een leeg element `<>`, dat je kunt gebruiken
  als
  je meerdere root elementen hebt.
* Tags moeten **altijd** afgesloten worden. Ook tags waarvan we dat nu niet gewend zijn zoals `<img>`. Het is het netst
  om dit soort elementen *self-closing* te maken: `<img />`.
* Omdat JavaScript `class` en `for` al gebruikt, gebruik je in JSX `className` en `htmlFor` voor deze attributen.

* Binnen de HTML kan je JavaScript gebruiken binnen accolades `{ javascript }`, het resultaat daarvan wordt gebruikt in
  de HTML.

// TODO: Ook nog iets toevoegen over {"jhg"}?

<!-- //TODO: camelcasing van css staat er nu niet ivm Tailwind -->

### State

Met de functie `useState` maak je een state variabele en een bijbehorende *setter* aan. Als je deze setter gebruikt om
de state variabele aan te passen, triggert dit React om op alle plekken waar de variabele gebruikt wordt de app opnieuw
te renderen.
De setter kan je zowel met een vaste waarde aanroepen, als met een functie die de huidige waarde aanpast.

### Voorbeeld JSX en State

```javascript

function App() {
    const [count, setCount] = useState(0);

    setCount(10); // dit zet de waarde van count direct op 10

    return (
        <>
            <header>
                <a href="" target="_blank">
                    <img src="logo.png" className="logo" alt="Logo"/>
                </a>
            </header>
            <h1>Hello World</h1>
            <main className="card">
                <label htmlFor="name">Name</label>
                <input id="name" name="name"/>
                <button onClick={() => setCount((n) => n + 1) /* dit maakt de waarde van count 1 hoger */}>
                    count is {count}
                </button>
            </main>
        </>
    )
}
```

// TODO: ik heb in de buttonfunctie de naam count expres niet gebruikt, maakt dit duidelijker of juist minder duidelijk
wat er gebeurt?

### Props

Waarden doorgeven aan component, als dit state variabelen zijn blijven die reactive en wordt component dus ook opnieuw
gerenderd bij verandering

<!-- Destructuring of `props.value`? => destructuring, omdat React docs dit doen. Uitleg hierover doen we bij PRG7 -->

```javascript
function List({items}) {
    const list = items.map(product =>
        <li key={product.id}>
            {product.title}
        </li>
    );

    return (
        <ul>
            {list}
        </ul>
    );
}
```

#### Opdracht

Installatie

#### Opdracht

Array met objecten maken en tonen mbv component, stylen met tailwind, subcomponenten

// TODO: VPS check. Uitleg VPS in les 4, hier wel een check of iedereen zijn/haar inloggegevens heeft.

https://react.dev/learn/writing-markup-with-jsx
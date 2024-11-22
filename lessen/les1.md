# Les 1

In deze cursus (Full Stack Web Development) leer je een webapplicatie te bouwen met een reactive front-end en een
RESTful back-end. De front-end en back-end zijn dus gescheiden applicaties. We maken gebruik van de **MERN** stack:
**R**eact voor de dynamische front-end en **N**ode.js, **E**xpress, en **M**ongoDB voor de back-end en dataopslag.

Aan het einde van de cursus kun je zelfstandig een Full Stack webapplicatie
opzetten<!--, beveiligen als het past dit toevoegen in week 3--> en hosten op een
server.

## Overzicht cursus

#### Week 1

Oefenen reactive front-end

#### Week 2

Oefenen RESTful back-end

#### Week 3

Eindopdracht en verdieping

#### Week 4

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
| npm       | Packetmanager voor zowel front- als backend om modules te installeren.   |
| vite      | Build-tool voor de front-end.                                            |
| ssh       | Remote terminal verbinding met de Ubunto server waar de back-end draait. |
| FileZilla | FTP-client om bestanden over te zetten naar de back-end.                 |

// TODO: check of volledig met Antwan / Blur REST backend? / Samenvattend plaatje reactive <-> restful websevice? node
ook bij tools?

- Onderdelen: Front-end, Back-end, Client, Server, Webserver, db/MongoDB
- Tools: PHPStorm, node, npm, vite, ssh, filezilla
- Modules: Express, Mongoose, React, Fetch, Tailwind(?)
- Communicatie: HTTP

## Reactive frameworks

* React maakt gebruik van een virtuele DOM, of pseudo-DOM, om efficiënt te renderen.
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

*Vite* is een ontwikkeltool waarmee je de React-app efficiënt kunt ontwikkelen en later kunt bouwen (of 'bundelen') voor
productie. Het biedt hot-reloading en project builds.

### Tailwind

*Tailwind* is een CSS-framework dat gebruik maakt van voorgedefinieerde CSS-classes om styling aan je app toe te voegen.
Op deze manier kan je alle styling direct in het component toevoegen.

### React

En natuurlijk hebben we *React* zelf nodig om de gebruikersinterface te bouwen. :-)

## React

Single page. Opgebouwd uit componenten. Data binding van variabelen. Verandering in variabele zorgt voor automatische
rendering van (delen van) de pagina -> Reactive.

### Hello world

https://tailwindcss.com/docs/guides/vite
Check: template blank?

### JSX

Opdracht: installatie node/npm, eerste project aanmaken

State toch hier al doen? Is wel makkelijker voor uitleggen reactive principe

### Components

Hergebruik, overzicht, losse bestanden

TODO: Vergelijk Laravel (zowel componenten als props).

### Props

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

Opdracht: array met objecten maken en tonen mbv component, stylen met tailwind

## VPS aanvragen

Nodig vanaf week 2

Standaard aanvragen voor alle reguliere tweedejaars

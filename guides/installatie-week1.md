# Installatie Front-end

## Les 1

Check of node en npm de juiste versie hebben:

`node -v` versie 20 of 22

`npm -v` versie 10

* Installeer node/npm indien nodig:
  https://nodejs.org/en/download
  (Scroll naar beneden voor installer van een prebuilt versie)

<!--
* vite project met react aanmaken
  https://vite.dev/guide/
  `npm create vite@latest`
  React - Javascript
* npm install -->

Maak een nieuw React project aan:

* React met Vite en Tailwind
  https://tailwindcss.com/docs/guides/vite
  Na stap 1 kan je verder gaan in PHPStorm. Als je klaar is App.css niet meer nodig en kun je deze verwijderen (evenals
  de import ervan).

Disable warnings over prop types in `eslint.config.js`:

```
"rules": {
    "react/prop-types": 0
  }
```

## Les 3

React Router

* Voeg React router toe aan je project:
  `npm install react-router`

## Les 8/9

JSON web tokens

* Voeg een JWT decoder toe aan je project:
  `npm install jwt-decode`

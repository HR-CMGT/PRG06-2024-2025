# Les 8

## Context API

Alternatief voor props

Handig als je dezelfde data met veel componenten wilt delen, of wilt delen met componenten diep in de 'tree'.

* createContext maakt ContextComponent met default waarde
* maak beschikbaar via JSX ContextComponent.Provider, je kunt hier de defaultwaarde overschrijven
* waarde kan samengesteld zijn (object) waardoor je veel variabelen in 1x kunt doorsturen, of bijv een state + setter
  door wilt geven
* eigenlijk alleen interessant als je reactive variabelen in de context stopt

### Use cases

- server state centraal?
- loginstatus / jwt

## Foutafhandeling

Is denk ik leuk om toe te voegen, en zou misschien zelfs een alternatief extra onderdeel kunnen zijn.

### 404

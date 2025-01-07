# Les 9

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
Is denk ik leuk om toe te voegen, en zou misschien zelfs een alternatief extra onderdeel kunnen zijn.
-->

### 404

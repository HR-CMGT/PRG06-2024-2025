# Installatie & Deployment React + Vite

- [Installatie \& Deployment React + Vite](#installatie--deployment-react--vite)
  - [Introductie](#introductie)
    - [Let op voor je aan de slag gaat!](#let-op-voor-je-aan-de-slag-gaat)
  - [Installatie](#installatie)
  - [Configuratie webserver](#configuratie-webserver)
  - [Deployen nieuwe versie](#deployen-nieuwe-versie)
  - [NIET DOEN: Domein met SSL Certificaat](#niet-doen-domein-met-ssl-certificaat)

## Introductie

Om je project op een onlineomgeving te krijgen ga je werken met een VPS. Als team heb je deze aangevraagd via school,
maar je kunt ook een eigen serveromgeving gebruiken.

Deze handleiding werkt met Ubuntu (v22.04 of v24.04) om de noodzakelijke tools te installeren, en te zorgen dat je een
werkende webserver hebt waar je Laravel project kan draaien.

### Let op voor je aan de slag gaat!

> - Je moet voor de stappen hieronder je logingegevens paraat hebben van de aanvraag voor de VM
> - Als je gegevens (zoals je wachtwoord) wilt kopiëren en plakken op Windows in Powershell moet je jouw rechtermuisknop
>   gebruiken om te plakken
> - Als er gevraagd wordt om een fingerprint toe te voegen moet je met "yes" antwoorden (dit wordt 2 keer gevraagd in
>   het proces)
> - Als er geen feedback komt vanuit de gedraaide commands is dat een goed teken. Als er wel feedback is, dan is dit
>   vaak een foutmelding.
> - Als je grote fouten krijgt, roep dan een technische docent erbij

## Installatie

Download de zip en pak deze uit in een voor jou logische map op jouw laptop. Open je Terminal (mac) of Powershell
(Windows) en navigeer naar de map waar je de bestanden hebt gedownload. Als je in de goede map staat kun je de bestanden
verkregen via docent uploaden naar jullie server. Draai het volgende commando en vervang `<user>` en `<ip>` met je eigen
gegevens (`<>` tekens moeten hier niet meer staan na het aanpassen naar je eigen gegevens):

```bash
scp nginx.conf install_tools.sh configure_webserver.sh deploy.sh <user>@<ip>:~/
```

Log nu in op de server via:

```bash
ssh <user>@<ip>
```

> Vanaf nu ben je ingelogd op de server en voer je de commando's dus uit op de server en niet meer op je eigen laptop.

Valideer dat het uploaden van de bestanden goed is gegaan door het volgende commando te draaien:

```bash
ls -al
```

Je zou nu de scripts moeten zien die je eerder op je eigen laptop hebt uitgepakt. Klopt dit? Dan kun je verder. Om de
scripts te kunnen draaien moet je ze qua rechten aanpassen zodat ze 'executable' zijn:

```bash
chmod u+x install_tools.sh configure_webserver.sh deploy.sh
```

Run nu het eerste script als volgt:

```bash
./install_tools.sh
```

Hiermee worden alle noodzakelijke tools geïnstalleerd op de server. Het commando`sudo` geeft je meer rechten dan een
gewone gebruiker, maar zoals bekend 'with great powers, comes great responsibility'. Daarom moet je 1 keer opnieuw je
wachtwoord invullen om te controleren of je echt zelf nog achter de computer zit. Na voltooiing heb je het volgende
geïnstalleerd:

- Een aantal basispakketten voor webcommunicatie
- Git
- Nginx (webserver)
- NVM (met Node LTS & NPM)
- SSH key

> Test of je installatie goed is gegaan door naar http://\<jouwip> te gaan in de browser. Als je nu een nginx
> startpagina ziet, is het goed gegaan en kun je door naar de volgende stap.

## Configuratie webserver

In plaats van de default nginx startpagina wil je uiteraard je eigen GitHub project hier zien.

Hiervoor moet je de SSH key van de server (die in de vorige stap is aangemaakt) toevoegen aan jouw GitHub project
deployment keys, zodat de server namens jou op GitHub kan inloggen

- Draai `cat ~/.ssh/id_rsa.pub` op de server om jouw key te kunnen zien
- Kopieer deze key (dus de hele output van het commando)
- Ga naar GitHub.com en open jouw repository
  - Ga naar **Settings** en daarbinnen naar **Deploy keys**
  - Voeg een nieuwe toe en plak hier jouw gekopieerde key
  - Geef als titel `hr-vm-tle2_1`
  - Laat het vinkje voor write access uitstaan

Run nu het volgende script. Let op, dit doe je **ZONDER** sudo (vul je wachtwoord in voor `sudo` wanneer hier tussendoor
om wordt gevraagd). Je krijgt 3 vragen waarvan de uitleg onder het commando staat:

```bash
./configure_webserver.sh
```

- Vraag 1: Vul hier je SSH (!!) GitHub link in (ziet eruit als `git@GitHub.com:<username>/<repo>.git`)
- Vraag 2: De naam van je project ZONDER spaties of hoofdletters (bv: my-react-project)
- Vraag 3: De naam die in de titel van je website komt te staan (bv: My React Project)

> Na het draaien van dit script kun je opnieuw naar http://\<jouwip> gaan in de browser. Je zou hier nu je React
> applicatie werkend moeten zien draaien! 🚀

## Deployen nieuwe versie

Wanneer je een nieuwe release wilt doen op de server (lees: de nieuwe versie uit de main branch online zetten), kun je
dit doen door in te loggen via SSH en in je home folder (de map die wordt geopend na inloggen met ssh) `./deploy.sh` te
draaien. De nieuwe versie van je project zou nu zichtbaar moeten zijn op http://\<jouwip>
<br>
Zit je niet meer in de home folder? Voer dan `cd ~` uit om naar de home folder te gaan.

> Heb je meer nodig in je deployment flow dan kun je het deploy script natuurlijk aanpassen. Denk hierbij aan extra
> artisan commando's omdat je bijvoorbeeld een db:seed wilt doen.

## NIET DOEN: Domein met SSL Certificaat

De website draait nu op `http://\<jouwip>` en is door iedereen (binnen Nederland i.v.m. beveiliging in de Hogeschool
firewall) te bezoeken. De stap om ook echt een domeinnaam (hr.nl, mijn-website.nl, etc.) toe te voegen slaan we voor nu
over.

> **DIT DOEN WE OM DE KLANT TE BESCHERMEN EN GEEN WILDGROEI AAN DOMEINEN TE KRIJGEN DIE HELEMAAL NIET VAN EEN ECHTE
> OPDRACHTGEVER ZIJN**

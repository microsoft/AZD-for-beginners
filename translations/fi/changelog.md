<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-21T15:23:04+00:00",
  "source_file": "changelog.md",
  "language_code": "fi"
}
-->
# Muutosloki - AZD Aloittelijoille

## Johdanto

Tämä muutosloki dokumentoi kaikki merkittävät muutokset, päivitykset ja parannukset AZD Aloittelijoille -tietovarastossa. Noudatamme semanttisen versionhallinnan periaatteita ja ylläpidämme tätä lokia auttaaksemme käyttäjiä ymmärtämään, mitä versioiden välillä on muuttunut.

## Oppimistavoitteet

Tarkastelemalla tätä muutoslokia voit:
- Pysyä ajan tasalla uusista ominaisuuksista ja sisällön lisäyksistä
- Ymmärtää parannuksia olemassa olevassa dokumentaatiossa
- Seurata virhekorjauksia ja tarkistuksia tarkkuuden varmistamiseksi
- Seurata oppimateriaalien kehitystä ajan myötä

## Oppimistulokset

Muutoslokia tarkasteltuasi pystyt:
- Tunnistamaan uudet oppimiseen tarkoitetut sisällöt ja resurssit
- Ymmärtämään, mitkä osiot on päivitetty tai parannettu
- Suunnittelemaan oppimispolkusi ajankohtaisimpien materiaalien perusteella
- Antamaan palautetta ja ehdotuksia tulevia parannuksia varten

## Versiohistoria

### [v3.8.0] - 2025-11-19

#### Edistynyt dokumentaatio: Seuranta, turvallisuus ja monen agentin mallit
**Tämä versio lisää kattavat A-tason oppitunnit Application Insights -integraatiosta, autentikointimalleista ja monen agentin koordinoinnista tuotantokäyttöön.**

#### Lisätty
- **📊 Application Insights -integraatio-opetus**: sijainnissa `docs/pre-deployment/application-insights.md`:
  - AZD-keskeinen käyttöönotto automaattisella provisioinnilla
  - Täydelliset Bicep-mallit Application Insightsille + Log Analyticsille
  - Toimivat Python-sovellukset mukautetulla telemetrialla (yli 1 200 riviä)
  - AI/LLM-seurantamallit (Azure OpenAI -token/kustannusseuranta)
  - 6 Mermaid-kaaviota (arkkitehtuuri, hajautettu jäljitys, telemetriavirta)
  - 3 käytännön harjoitusta (hälytykset, hallintapaneelit, AI-seuranta)
  - Kusto-kyselyesimerkkejä ja kustannusten optimointistrategioita
  - Live-metriikoiden suoratoisto ja reaaliaikainen virheenkorjaus
  - 40–50 minuutin oppimisaika tuotantovalmiilla malleilla

- **🔐 Autentikointi- ja turvallisuusmallien oppitunti**: sijainnissa `docs/getting-started/authsecurity.md`:
  - 3 autentikointimallia (yhteysmerkkijonot, Key Vault, hallinnoitu identiteetti)
  - Täydelliset Bicep-infrastruktuurimallit turvallisiin käyttöönottoihin
  - Node.js-sovelluskoodi Azure SDK -integraatiolla
  - 3 täydellistä harjoitusta (hallinnoidun identiteetin käyttöönotto, käyttäjän määrittämä identiteetti, Key Vault -kierto)
  - Turvallisuuden parhaat käytännöt ja RBAC-konfiguraatiot
  - Vianetsintäopas ja kustannusanalyysi
  - Tuotantovalmiit salasanattomat autentikointimallit

- **🤖 Monen agentin koordinointimallien oppitunti**: sijainnissa `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinointimallia (sekventiaalinen, rinnakkainen, hierarkkinen, tapahtumapohjainen, konsensus)
  - Täydellinen orkestrointipalvelun toteutus (Python/Flask, yli 1 500 riviä)
  - 3 erikoistunutta agenttitoteutusta (Tutkija, Kirjoittaja, Toimittaja)
  - Service Bus -integraatio viestijonotukseen
  - Cosmos DB -tilanhallinta hajautetuille järjestelmille
  - 6 Mermaid-kaaviota, jotka näyttävät agenttien vuorovaikutukset
  - 3 edistynyttä harjoitusta (aikakatkaisujen käsittely, uudelleenyrittojen logiikka, piirin katkaisija)
  - Kustannuserittely ($240–565/kuukausi) optimointistrategioilla
  - Application Insights -integraatio seurantaan

#### Parannettu
- **Ennen käyttöönottoa -luku**: Sisältää nyt kattavat seuranta- ja koordinointimallit
- **Aloitusluku**: Parannettu ammattimaisilla autentikointimalleilla
- **Tuotantovalmius**: Täydellinen kattavuus turvallisuudesta havaittavuuteen
- **Kurssin rakenne**: Päivitetty viittaamaan uusiin oppitunteihin luvuissa 3 ja 6

#### Muutettu
- **Oppimisen eteneminen**: Parempi integraatio turvallisuuden ja seurannan välillä koko kurssissa
- **Dokumentaation laatu**: Johdonmukaiset A-tason standardit (95–97 %) uusissa oppitunneissa
- **Tuotantomallit**: Täydellinen end-to-end-kattavuus yrityskäyttöönottoihin

#### Parannettu
- **Kehittäjäkokemus**: Selkeä polku kehityksestä tuotannon seurantaan
- **Turvallisuusstandardit**: Ammattimaiset mallit autentikointiin ja salaisuuksien hallintaan
- **Havaittavuus**: Täydellinen Application Insights -integraatio AZD:n kanssa
- **AI-työkuormat**: Erikoistunut seuranta Azure OpenAI:lle ja monen agentin järjestelmille

#### Vahvistettu
- ✅ Kaikki oppitunnit sisältävät täydellisen toimivan koodin (ei pelkkiä katkelmia)
- ✅ Mermaid-kaaviot visuaaliseen oppimiseen (yhteensä 19 kolmessa oppitunnissa)
- ✅ Käytännön harjoitukset vahvistusvaiheilla (yhteensä 9)
- ✅ Tuotantovalmiit Bicep-mallit, jotka voidaan ottaa käyttöön `azd up` -komennolla
- ✅ Kustannusanalyysi ja optimointistrategiat
- ✅ Vianetsintäoppaat ja parhaat käytännöt
- ✅ Tietotaitotarkistukset vahvistuskomentoineen

#### Dokumentaation arviointitulokset
- **docs/pre-deployment/application-insights.md**: - Kattava seurantakäsikirja
- **docs/getting-started/authsecurity.md**: - Ammattimaiset turvallisuusmallit
- **docs/pre-deployment/coordination-patterns.md**: - Edistyneet monen agentin arkkitehtuurit
- **Uusi sisältö kokonaisuudessaan**: - Johdonmukaiset korkealaatuiset standardit

#### Tekninen toteutus
- **Application Insights**: Log Analytics + mukautettu telemetria + hajautettu jäljitys
- **Autentikointi**: Hallinnoitu identiteetti + Key Vault + RBAC-mallit
- **Monen agentin järjestelmät**: Service Bus + Cosmos DB + Container Apps + orkestrointi
- **Seuranta**: Live-metriikat + Kusto-kyselyt + hälytykset + hallintapaneelit
- **Kustannusten hallinta**: Näytteenottostrategiat, säilytyskäytännöt, budjettikontrollit

### [v3.7.0] - 2025-11-19

#### Dokumentaation laadun parannukset ja uusi Azure OpenAI -esimerkki
**Tämä versio parantaa dokumentaation laatua koko tietovarastossa ja lisää täydellisen Azure OpenAI -käyttöönottoesimerkin GPT-4-chat-käyttöliittymällä.**

#### Lisätty
- **🤖 Azure OpenAI Chat -esimerkki**: Täydellinen GPT-4-käyttöönotto toimivalla toteutuksella sijainnissa `examples/azure-openai-chat/`:
  - Täydellinen Azure OpenAI -infrastruktuuri (GPT-4-mallin käyttöönotto)
  - Python-komentorivichat-käyttöliittymä keskusteluhistorialla
  - Key Vault -integraatio turvalliseen API-avaimen säilytykseen
  - Token-käytön seuranta ja kustannusarviointi
  - Nopeusrajoitukset ja virheenkäsittely
  - Kattava README, jossa 35–45 minuutin käyttöönotto-opas
  - 11 tuotantovalmiita tiedostoja (Bicep-mallit, Python-sovellus, konfiguraatio)
- **📚 Dokumentaatioharjoitukset**: Lisätty käytännön harjoituksia konfiguraatio-oppaaseen:
  - Harjoitus 1: Moniympäristön konfiguraatio (15 minuuttia)
  - Harjoitus 2: Salaisuuksien hallinnan harjoitus (10 minuuttia)
  - Selkeät onnistumiskriteerit ja vahvistusvaiheet
- **✅ Käyttöönoton vahvistus**: Lisätty vahvistusosio käyttöönotto-oppaaseen:
  - Terveystarkistusmenetelmät
  - Onnistumiskriteerien tarkistuslista
  - Odotetut tulokset kaikille käyttöönotto-komennoille
  - Pikaohje vianetsintään

#### Parannettu
- **examples/README.md**: Päivitetty A-tason laatuun (93 %):
  - Lisätty azure-openai-chat kaikkiin asiaankuuluviin osioihin
  - Päivitetty paikallisten esimerkkien määrä 3:sta 4:ään
  - Lisätty AI-sovellusesimerkkien taulukkoon
  - Integroitu välitason käyttäjien pika-aloitukseen
  - Lisätty Azure AI Foundry -mallipohjien osioon
  - Päivitetty vertailumatriisi ja teknologian löytöosio
- **Dokumentaation laatu**: Parannettu B+ (87 %) → A- (92 %) koko docs-kansiossa:
  - Lisätty odotetut tulokset kriittisiin komentoesimerkkeihin
  - Sisällytetty vahvistusvaiheet konfiguraatiomuutoksiin
  - Parannettu käytännön oppimista käytännön harjoituksilla

#### Muutettu
- **Oppimisen eteneminen**: Parempi integraatio AI-esimerkeille välitason oppijoille
- **Dokumentaation rakenne**: Toiminnallisempia harjoituksia selkeillä tuloksilla
- **Vahvistusprosessi**: Selkeät onnistumiskriteerit lisätty keskeisiin työnkulkuihin

#### Parannettu
- **Kehittäjäkokemus**: Azure OpenAI -käyttöönotto vie nyt 35–45 minuuttia (vs. 60–90 monimutkaisille vaihtoehdoille)
- **Kustannusten läpinäkyvyys**: Selkeät kustannusarviot ($50–200/kuukausi) Azure OpenAI -esimerkille
- **Oppimispolku**: AI-kehittäjillä on selkeä aloituspiste azure-openai-chatin kanssa
- **Dokumentaatiostandardit**: Johdonmukaiset odotetut tulokset ja vahvistusvaiheet

#### Vahvistettu
- ✅ Azure OpenAI -esimerkki täysin toimiva `azd up` -komennolla
- ✅ Kaikki 11 toteutustiedostoa syntaktisesti oikein
- ✅ README-ohjeet vastaavat todellista käyttöönoton kokemusta
- ✅ Dokumentaatiolinkit päivitetty yli 8 sijainnissa
- ✅ Esimerkkien hakemisto heijastaa tarkasti 4 paikallista esimerkkiä
- ✅ Ei päällekkäisiä ulkoisia linkkejä taulukoissa
- ✅ Kaikki navigointiviittaukset oikein

#### Tekninen toteutus
- **Azure OpenAI -arkkitehtuuri**: GPT-4 + Key Vault + Container Apps -malli
- **Turvallisuus**: Hallinnoitu identiteetti valmis, salaisuudet Key Vaultissa
- **Seuranta**: Application Insights -integraatio
- **Kustannusten hallinta**: Token-seuranta ja käyttöoptimointi
- **Käyttöönotto**: Yksi `azd up` -komento täydelliseen asennukseen

### [v3.6.0] - 2025-11-19

#### Suuri päivitys: Container App -käyttöönottoesimerkit
**Tämä versio esittelee kattavat, tuotantovalmiit konttisovellusten käyttöönottoesimerkit Azure Developer CLI:n (AZD) avulla, täydellä dokumentaatiolla ja integraatiolla oppimispolkuun.**

#### Lisätty
- **🚀 Container App -esimerkit**: Uudet paikalliset esimerkit sijainnissa `examples/container-app/`:
  - [Pääopas](examples/container-app/README.md): Täydellinen yleiskatsaus konttien käyttöönottoon, pika-aloitus, tuotanto ja edistyneet mallit
  - [Yksinkertainen Flask-API](../../examples/container-app/simple-flask-api): Aloittelijaystävällinen REST API, jossa skaalaus nollaan, terveystarkistukset, seuranta ja vianetsintä
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices): Tuotantovalmiit monipalvelukäyttöönotot (API Gateway, Tuote, Tilaus, Käyttäjä, Ilmoitus), asynkroninen viestintä, Service Bus, Cosmos DB, Azure SQL, hajautettu jäljitys, sinivihreä/kanarialle käyttöönotto
- **Parhaat käytännöt**: Turvallisuus, seuranta, kustannusten optimointi ja CI/CD-ohjeet konttityökuormille
- **Koodiesimerkit**: Täydellinen `azure.yaml`, Bicep-mallit ja monikieliset palvelutoteutukset (Python, Node.js, C#, Go)
- **Testaus ja vianetsintä**: End-to-end-testiskenaariot, seurantakomennot, vianetsintäohjeet

#### Muutettu
- **README.md**: Päivitetty esittelemään ja linkittämään uusia konttisovellusesimerkkejä osiossa "Paikalliset esimerkit - konttisovellukset"
- **examples/README.md**: Päivitetty korostamaan konttisovellusesimerkkejä, lisäämään vertailumatriisimerkintöjä ja päivittämään teknologia-/arkkitehtuuriviittauksia
- **Kurssin rakenne ja opas**: Päivitetty viittaamaan uusiin konttisovellusesimerkkeihin ja käyttöönottoihin liittyviin malleihin asiaankuuluvissa luvuissa

#### Vahvistettu
- ✅ Kaikki uudet esimerkit otettavissa käyttöön `azd up` -komennolla ja noudattavat parhaita käytäntöjä
- ✅ Dokumentaation ristiviittaukset ja navigointi päivitetty
- ✅ Esimerkit kattavat aloittelijasta edistyneisiin skenaarioihin, mukaan lukien tuotannon mikropalvelut

#### Huomioita
- **Laajuus**: Vain englanninkielinen dokumentaatio ja esimerkit
- **Seuraavat askeleet**: Laajennetaan lisätyillä edistyneillä konttimalleilla ja CI/CD-automaatioilla tulevissa julkaisuissa

### [v3.5.0] - 2025-11-19

#### Tuotteen uudelleenbrändäys: Microsoft Foundry
**Tämä versio toteuttaa kattavan tuotteen nimen muutoksen "Azure AI Foundry" → "Microsoft Foundry" kaikessa englanninkielisessä dokumentaatiossa, heijastaen Microsoftin virallista uudelleenbrändäystä.**

#### Muutettu
- **🔄 Tuotteen nimen päivitys**: Täydellinen uudelleenbrändäys "Azure AI Foundry" → "Microsoft Foundry"
  - Päivitetty kaikki viittaukset englanninkielisessä dokumentaatiossa `docs/`-kansiossa
  - Uudelleennimetty kansio: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Uudelleennimetty tiedosto: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Yhteensä: 23 sisällön viittausta päivitetty 7 dokumentaatiotiedostossa

- **📁 Kansion rakenteen muutokset**:
  - `docs/ai-foundry/` uudelleennimetty `docs/microsoft-foundry/`
  - Kaikki ristiviittaukset päivitetty heijastamaan uutta kansiorakennetta
  - Navigointilinkit vahvistettu kaikessa dokumentaatiossa

- **📄 Tiedostojen uudelleennimeäminen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kaikki sisäiset linkit päivitetty vi
- **Työpaja**: Työpajamateriaaleja (`workshop/`) ei päivitetty tässä versiossa
- **Esimerkit**: Esimerkkitiedostot saattavat edelleen viitata vanhoihin nimiin (korjataan tulevassa päivityksessä)
- **Ulkoiset linkit**: Ulkoiset URL-osoitteet ja GitHub-repositorioviittaukset pysyvät muuttumattomina

#### Siirtymäopas osallistujille
Jos sinulla on paikallisia haaroja tai dokumentaatiota, jotka viittaavat vanhaan rakenteeseen:
1. Päivitä kansioviittaukset: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Päivitä tiedostoviittaukset: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Korvaa tuotteen nimi: "Azure AI Foundry" → "Microsoft Foundry"
4. Varmista, että kaikki sisäiset dokumentaatiolinkit toimivat edelleen

---

### [v3.4.0] - 2025-10-24

#### Infrastruktuurin esikatselu ja validointiparannukset
**Tämä versio tuo kattavan tuen uudelle Azure Developer CLI -esikatselutoiminnolle ja parantaa työpajakäyttäjien kokemusta.**

#### Lisätty
- **🧪 azd provision --preview -toiminnon dokumentaatio**: Kattava kuvaus uudesta infrastruktuurin esikatselutoiminnosta
  - Komentoviitteet ja käyttöesimerkit pikaoppaassa
  - Yksityiskohtainen integrointi provisiointiohjeisiin käyttötapauksineen ja hyötyineen
  - Ennakkotarkistuksen integrointi turvallisempaa käyttöönottoa varten
  - Aloitusoppaan päivitykset turvallisuutta painottavilla käytännöillä
- **🚧 Työpajan tilabanneri**: Ammattimainen HTML-banneri, joka osoittaa työpajan kehitystilanteen
  - Gradienttimuotoilu ja rakennusindikaattorit selkeää viestintää varten
  - Päivitetty viimeksi -aikaleima läpinäkyvyyden takaamiseksi
  - Mobiiliystävällinen muotoilu kaikille laitteille

#### Parannettu
- **Infrastruktuurin turvallisuus**: Esikatselutoiminto integroitu koko käyttöönoton dokumentaatioon
- **Ennakkovalidointi**: Automatisoidut skriptit sisältävät nyt infrastruktuurin esikatselutestauksen
- **Kehittäjän työnkulku**: Päivitetyt komentosekvenssit sisältävät esikatselun parhaana käytäntönä
- **Työpajakokemus**: Selkeät odotukset käyttäjille sisällön kehitystilanteesta

#### Muutettu
- **Käyttöönoton parhaat käytännöt**: Esikatseluun perustuva työnkulku nyt suositeltu lähestymistapa
- **Dokumentaation kulku**: Infrastruktuurin validointi siirretty oppimisprosessin alkuun
- **Työpajan esitys**: Ammattimainen tilaviestintä selkeällä kehitysaikataululla

#### Parannettu
- **Turvallisuus ensin -lähestymistapa**: Infrastruktuurimuutokset voidaan nyt validoida ennen käyttöönottoa
- **Tiimityöskentely**: Esikatselutulokset voidaan jakaa tarkistusta ja hyväksyntää varten
- **Kustannustietoisuus**: Parempi ymmärrys resurssikustannuksista ennen provisiointia
- **Riskien hallinta**: Vähentyneet käyttöönoton epäonnistumiset ennakkovalidoinnin ansiosta

#### Tekninen toteutus
- **Monidokumentti-integraatio**: Esikatselutoiminto dokumentoitu neljässä keskeisessä tiedostossa
- **Komentomallit**: Johdonmukainen syntaksi ja esimerkit koko dokumentaatiossa
- **Parhaiden käytäntöjen integrointi**: Esikatselu sisällytetty validointityönkulkuihin ja skripteihin
- **Visuaaliset indikaattorit**: Selkeät UUSI-toiminto -merkinnät löydettävyyden parantamiseksi

#### Työpajan infrastruktuuri
- **Tilaviestintä**: Ammattimainen HTML-banneri gradienttityylillä
- **Käyttäjäkokemus**: Selkeä kehitystilanne estää sekaannukset
- **Ammattimainen esitys**: Säilyttää repositorion uskottavuuden ja asettaa odotukset
- **Aikataulun läpinäkyvyys**: Lokakuu 2025 viimeksi päivitetty aikaleima vastuullisuuden takaamiseksi

### [v3.3.0] - 2025-09-24

#### Parannetut työpajamateriaalit ja interaktiivinen oppimiskokemus
**Tämä versio tuo kattavat työpajamateriaalit selainpohjaisilla interaktiivisilla oppailla ja jäsennellyillä oppimispoluilla.**

#### Lisätty
- **🎥 Interaktiivinen työpajaopas**: Selainpohjainen työpajakokemus MkDocs-esikatselutoiminnolla
- **📝 Jäsennellyt työpajaohjeet**: 7-vaiheinen opastettu oppimispolku alkaen tutustumisesta mukauttamiseen
  - 0-Esittely: Työpajan yleiskatsaus ja asennus
  - 1-Valitse-AI-Malli: Mallin löytäminen ja valinta
  - 2-Validoi-AI-Malli: Käyttöönotto ja validointimenettelyt
  - 3-Pura-AI-Malli: Mallin arkkitehtuurin ymmärtäminen
  - 4-Konfiguroi-AI-Malli: Konfigurointi ja mukauttaminen
  - 5-Mukauta-AI-Malli: Edistyneet muutokset ja iteroinnit
  - 6-Pura-Infrastruktuuri: Siivous ja resurssien hallinta
  - 7-Yhteenveto: Yhteenveto ja seuraavat vaiheet
- **🛠️ Työpajatyökalut**: MkDocs-konfiguraatio Material-teemalla parannetun oppimiskokemuksen takaamiseksi
- **🎯 Käytännön oppimispolku**: 3-vaiheinen metodologia (Löytäminen → Käyttöönotto → Mukauttaminen)
- **📱 GitHub Codespaces -integraatio**: Saumaton kehitysympäristön asennus

#### Parannettu
- **AI-työpajalaboratorio**: Laajennettu kattavalla 2-3 tunnin jäsennellyllä oppimiskokemuksella
- **Työpajadokumentaatio**: Ammattimainen esitys navigoinnilla ja visuaalisilla apuvälineillä
- **Oppimisen eteneminen**: Selkeä vaiheittainen opastus mallin valinnasta tuotantokäyttöön
- **Kehittäjäkokemus**: Integroitu työkalupakki sujuvien kehitystyönkulkujen takaamiseksi

#### Parannettu
- **Saavutettavuus**: Selainpohjainen käyttöliittymä hakutoiminnolla, kopiointiominaisuudella ja teeman vaihtamisella
- **Itseohjautuva oppiminen**: Joustava työpajarakenne, joka mukautuu eri oppimisnopeuksiin
- **Käytännön soveltaminen**: Todelliset AI-mallin käyttöönoton skenaariot
- **Yhteisöintegraatio**: Discord-integraatio työpajatukea ja yhteistyötä varten

#### Työpajan ominaisuudet
- **Sisäänrakennettu haku**: Nopea avainsanojen ja oppituntien löytäminen
- **Kopioi koodilohkot**: Hover-to-copy-toiminto kaikille koodiesimerkeille
- **Teeman vaihto**: Tumma/vaalea tila eri mieltymyksille
- **Visuaaliset elementit**: Kuvakaappaukset ja kaaviot ymmärryksen parantamiseksi
- **Tuki-integraatio**: Suora Discord-yhteys yhteisön tukea varten
- **Sisällön esitys**: Korvattu koristeelliset elementit selkeällä ja ammattimaisella muotoilulla
- **Linkkirakenne**: Päivitetty kaikki sisäiset linkit tukemaan uutta navigointijärjestelmää

#### Parannettu
- **Saavutettavuus**: Poistettu emojiriippuvuudet paremman ruudunlukijayhteensopivuuden vuoksi
- **Ammattimainen ulkoasu**: Selkeä, akateeminen esitystyyli, joka sopii yritysoppimiseen
- **Oppimiskokemus**: Jäsennelty lähestymistapa, jossa jokaisella oppitunnilla on selkeät tavoitteet ja tulokset
- **Sisällön organisointi**: Parempi looginen kulku ja yhteys aiheiden välillä

### [v1.0.0] - 2025-09-09

#### Ensimmäinen julkaisu - Kattava AZD-oppimisarkisto

#### Lisätty
- **Ydindokumentaation rakenne**
  - Täydellinen aloitusopassarja
  - Kattava käyttöönotto- ja provisiointidokumentaatio
  - Yksityiskohtaiset vianetsintäresurssit ja virheenkorjausoppaat
  - Ennakkokäyttöönoton validointityökalut ja -menettelyt

- **Aloitusmoduuli**
  - AZD-perusteet: Keskeiset käsitteet ja terminologia
  - Asennusopas: Alustakohtaiset asennusohjeet
  - Konfigurointiopas: Ympäristön asennus ja autentikointi
  - Ensimmäinen projektin opetusohjelma: Käytännönläheinen vaiheittainen oppiminen

- **Käyttöönotto- ja provisiointimoduuli**
  - Käyttöönotto-opas: Täydellinen työnkulun dokumentaatio
  - Provisiointiohje: Infrastructure as Code Bicepilla
  - Parhaat käytännöt tuotantokäyttöönottoihin
  - Monipalveluarkkitehtuurin mallit

- **Ennakkokäyttöönoton validointimoduuli**
  - Kapasiteettisuunnittelu: Azure-resurssien saatavuuden validointi
  - SKU-valinta: Kattavat palvelutason ohjeet
  - Ennakkotarkistukset: Automatisoidut validointiskriptit (PowerShell ja Bash)
  - Kustannusarviointi- ja budjetointityökalut

- **Vianetsintämoduuli**
  - Yleiset ongelmat: Usein kohdatut ongelmat ja ratkaisut
  - Virheenkorjausopas: Järjestelmälliset vianetsintämenetelmät
  - Edistyneet diagnostiikkatekniikat ja -työkalut
  - Suorituskyvyn seuranta ja optimointi

- **Resurssit ja viitteet**
  - Komentojen pikaopas: Keskeisten komentojen nopea viite
  - Sanasto: Kattavat terminologian ja lyhenteiden määritelmät
  - FAQ: Yksityiskohtaiset vastaukset yleisiin kysymyksiin
  - Ulkoiset resurssilinkit ja yhteydet yhteisöön

- **Esimerkit ja mallipohjat**
  - Yksinkertainen verkkosovellusesimerkki
  - Staattisen verkkosivuston käyttöönoton mallipohja
  - Konttisovelluksen konfigurointi
  - Tietokannan integrointimallit
  - Mikroservices-arkkitehtuuriesimerkit
  - Serverless-funktioiden toteutukset

#### Ominaisuudet
- **Monialustatuki**: Asennus- ja konfigurointioppaat Windowsille, macOS:lle ja Linuxille
- **Useat taitotasot**: Sisältö suunniteltu opiskelijoille ja ammattilaiskehittäjille
- **Käytännönläheisyys**: Käytännön esimerkit ja todelliset skenaariot
- **Kattava sisältö**: Peruskäsitteistä edistyneisiin yritysmalleihin
- **Turvallisuus ensin**: Turvallisuuden parhaat käytännöt integroitu koko sisältöön
- **Kustannusoptimointi**: Ohjeet kustannustehokkaisiin käyttöönottoihin ja resurssien hallintaan

#### Dokumentaation laatu
- **Yksityiskohtaiset koodiesimerkit**: Käytännönläheiset, testatut koodinäytteet
- **Vaiheittaiset ohjeet**: Selkeät, toteutettavat ohjeet
- **Kattava virheenkäsittely**: Vianetsintä yleisiin ongelmiin
- **Parhaiden käytäntöjen integrointi**: Alan standardit ja suositukset
- **Versioyhteensopivuus**: Päivitetty uusimpien Azure-palveluiden ja azd-ominaisuuksien mukaan

## Suunnitellut tulevat parannukset

### Versio 3.1.0 (Suunniteltu)
#### AI-alustan laajennus
- **Monimallin tuki**: Integraatiomallit Hugging Facelle, Azure Machine Learningille ja mukautetuille malleille
- **AI-agenttikehykset**: Mallipohjat LangChainille, Semantic Kernelille ja AutoGen-käyttöönotolle
- **Edistyneet RAG-mallit**: Vektorikantavaihtoehdot Azure AI Searchin ulkopuolella (Pinecone, Weaviate jne.)
- **AI-havainnointi**: Parannettu seuranta mallin suorituskyvylle, tokenien käytölle ja vastausten laadulle

#### Kehittäjäkokemus
- **VS Code -laajennus**: Integroitu AZD + AI Foundry -kehityskokemus
- **GitHub Copilot -integraatio**: AI-avusteinen AZD-mallipohjien luonti
- **Interaktiiviset opetusohjelmat**: Käytännön koodausharjoituksia automaattisella validoinnilla AI-skenaarioihin
- **Videosisältö**: Lisävideo-opetusohjelmat visuaalisille oppijoille, keskittyen AI-käyttöönottoihin

### Versio 4.0.0 (Suunniteltu)
#### Yrityksen AI-mallit
- **Hallintakehys**: AI-mallien hallinta, vaatimustenmukaisuus ja auditointipolut
- **Moniasiakas-AI**: Mallit useiden asiakkaiden palvelemiseksi eristetyillä AI-palveluilla
- **Edge AI -käyttöönotto**: Integraatio Azure IoT Edgen ja kontti-instanssien kanssa
- **Hybridipilvi-AI**: Monipilvi- ja hybridikäyttöönoton mallit AI-työkuormille

#### Edistyneet ominaisuudet
- **AI-putkiston automaatio**: MLOps-integraatio Azure Machine Learning -putkistojen kanssa
- **Edistynyt turvallisuus**: Zero-trust-mallit, yksityiset päätepisteet ja edistynyt uhkien torjunta
- **Suorituskyvyn optimointi**: Edistyneet viritys- ja skaalausstrategiat suurten AI-sovellusten läpimenoon
- **Globaali jakelu**: Sisällön toimitus- ja reunavälimuistimallit AI-sovelluksille

### Versio 3.0.0 (Suunniteltu) - Korvattu nykyisellä julkaisulla
#### Ehdotetut lisäykset - Nyt toteutettu v3.0.0:ssa
- ✅ **AI-keskeinen sisältö**: Kattava Azure AI Foundry -integraatio (Valmis)
- ✅ **Interaktiiviset opetusohjelmat**: Käytännön AI-työpajalaboratorio (Valmis)
- ✅ **Edistynyt turvallisuusmoduuli**: AI-spesifiset turvallisuusmallit (Valmis)
- ✅ **Suorituskyvyn optimointi**: AI-työkuormien viritysstrategiat (Valmis)

### Versio 2.1.0 (Suunniteltu) - Osittain toteutettu v3.0.0:ssa
#### Pienet parannukset - Osa toteutettu nykyisessä julkaisussa
- ✅ **Lisäesimerkit**: AI-keskeiset käyttöönoton skenaariot (Valmis)
- ✅ **Laajennettu FAQ**: AI-spesifiset kysymykset ja vianetsintä (Valmis)
- **Työkalujen integrointi**: Parannetut IDE- ja editori-integraatio-oppaat
- ✅ **Seurannan laajennus**: AI-spesifiset seuranta- ja hälytysmallit (Valmis)

#### Yhä suunniteltu tulevaan julkaisuun
- **Mobiiliystävällinen dokumentaatio**: Responsiivinen suunnittelu mobiilioppimiseen
- **Offline-käyttö**: Ladattavat dokumentaatiopaketit
- **Parannettu IDE-integraatio**: VS Code -laajennus AZD + AI-työnkulkuihin
- **Yhteisön hallintapaneeli**: Reaaliaikaiset yhteisön mittarit ja kontribuutiot

## Muutosten kirjaamiseen osallistuminen

### Muutosten raportointi
Kun osallistut tähän arkistoon, varmista, että muutosten kirjaus sisältää:

1. **Versio**: Semanttisen versionumeroinnin mukaisesti (major.minor.patch)
2. **Päivämäärä**: Julkaisun tai päivityksen päivämäärä muodossa YYYY-MM-DD
3. **Kategoria**: Lisätty, Muutettu, Poistettu, Korjattu, Turvallisuus
4. **Selkeä kuvaus**: Tiivis kuvaus muutoksesta
5. **Vaikutusarvio**: Miten muutokset vaikuttavat nykyisiin käyttäjiin

### Muutosten kategoriat

#### Lisätty
- Uudet ominaisuudet, dokumentaatio-osat tai kyvykkyydet
- Uudet esimerkit, mallipohjat tai oppimisresurssit
- Lisätyökalut, skriptit tai apuohjelmat

#### Muutettu
- Muutokset olemassa olevaan toiminnallisuuteen tai dokumentaatioon
- Päivitykset selkeyden tai tarkkuuden parantamiseksi
- Sisällön tai organisoinnin uudelleenjärjestely

#### Poistettu
- Ominaisuudet, dokumentaatio tai esimerkit, jotka eivät enää ole relevantteja
- Vanhentunut tieto tai poistettavat lähestymistavat
- Päällekkäinen tai yhdistetty sisältö

#### Korjattu
- Virheiden korjaukset dokumentaatiossa tai koodissa
- Raportoitujen ongelmien tai ongelmien ratkaisut
- Tarkkuuden tai toiminnallisuuden parannukset

#### Turvallisuus
- Turvallisuuteen liittyvät parannukset tai korjaukset
- Päivitykset turvallisuuden parhaisiin käytäntöihin
- Turvallisuushaavoittuvuuksien ratkaisut

### Semanttisen versionumeroinnin ohjeet

#### Pääversio (X.0.0)
- Muutokset, jotka vaativat käyttäjän toimia
- Sisällön tai organisoinnin merkittävä uudelleenjärjestely
- Muutokset, jotka muuttavat perustavanlaatuista lähestymistapaa tai metodologiaa

#### Väliversio (X.Y.0)
- Uudet ominaisuudet tai sisällön lisäykset
- Parannukset, jotka säilyttävät taaksepäin yhteensopivuuden
- Lisäesimerkit, työkalut tai resurssit

#### Korjausversio (X.Y.Z)
- Virheenkorjaukset ja korjaukset
- Pienet parannukset olemassa olevaan sisältöön
- Selkeytykset ja pienet parannukset

## Yhteisön palaute ja ehdotukset

Kannustamme aktiivisesti yhteisön palautetta tämän oppimisresurssin parantamiseksi:

### Miten antaa palautetta
- **GitHub-ongelmat**: Raportoi ongelmat tai ehdota parannuksia (AI-spesifiset ongelmat tervetulleita)
- **Discord-keskustelut**: Jaa ideoita ja osallistu Azure AI Foundry -yhteisöön
- **Pull-pyynnöt**: Osallistu suoraan sisällön parantamiseen, erityisesti AI-mallipohjiin ja oppaisiin
- **Azure AI Foundry Discord**: Osallistu #Azure-kanavaan AZD + AI-keskusteluissa
- **Yhteisöfoorumit**: Osallistu laajempiin Azure-kehittäjäkeskusteluihin

### Palautekategoriat
- **AI-sisällön tarkkuus**: Korjaukset AI-palveluiden integrointi- ja käyttöönottoinformaatioon
- **Oppimiskokemus**: Ehdotukset AI-kehittäjän oppimisvirran parantamiseksi
- **Puuttuva AI-sisältö**: Pyynnöt lisä-AI-mallipohjille, malleille tai esimerkeille
- **Saavutettavuus**: Parannukset monipuolisiin oppimistarpeisiin
- **AI-työkalujen integrointi**: Ehdotukset AI-kehitystyönkulun parempaan integrointiin
- **Tuotannon AI-mallit**: Pyynnöt yrityksen AI-käyttöönoton malleista

### Vastauslupaus
- **Ongelmiin vastaaminen**: 48 tunnin sisällä raportoiduista ongelmista
- **Ominaisuuspyynnöt**: Arviointi viikon sisällä
- **Yhteisön kontribuutiot**: Tarkistus viikon sisällä
- **Turvallisuuskysymykset**: Välitön prioriteetti ja nopeutettu vastaus

## Ylläpitosuunnitelma

### Säännölliset päivitykset
- **Kuukausittaiset tarkistukset**: Sisällön tarkkuus ja linkkien validointi
- **Kvartaalipäivitykset**: Suuret sisällön lisäykset ja parannukset
- **Puolivuosittaiset tarkistukset**: Kattava uudelleenjärjestely ja parannus
- **Vuotuiset julkaisut**: Suurten versioiden päivitykset merkittävillä parannuksilla

### Seuranta ja laadunvarmistus
- **Automaattinen testaus**: Säännöllinen koodiesimerkkien ja linkkien validointi
- **Yhteisön palautteen integrointi**: Käyttäjien ehdotusten säännöllinen sisällyttäminen
- **Teknologiapäivitykset**: Yhdenmukaisuus uusimpien Azure-palveluiden ja azd-julkaisujen kanssa
- **Saavutettavuusauditoinnit**: Säännöllinen tarkistus inklusiivisen suunnittelun periaatteiden mukaisesti

## Versiotuen käytäntö

### Nykyisen version tuki
- **Uusin pääversio**: Täysi tuki säännöllisillä päivityksillä
- **Edellinen pääversio**: Turvallisuuspäivitykset ja kriittiset korjaukset 12 kuukauden ajan
- **Vanhemmat versiot**: Yhteisön tuki, ei virallisia päivityksiä

### Siirtymäohjeet
Kun pääversiot julkaistaan, tarjoamme:
- **Siirtymäoppaat**: Vaiheittaiset siirtymäohjeet
- **Yhteensopivuusmuistiinpanot**: Tiedot merkittävistä muutoksista
- **Työkalutuki**: Skriptit tai apuohjelmat siirtymisen avuksi
- **Yhteisön tuki**: Omistetut foorumit siirtymiskysymyksille

---

**Navigointi**
- **Edellinen oppitunti**: [Opintosuunnitelma](resources/study-guide.md)
- **Seuraava oppitunti**: Palaa [Pää README](README.md)

**Pysy ajan tasalla**: Seuraa tätä arkistoa saadaksesi ilmoituksia uusista julkaisuista ja tärkeistä oppimateriaalien päivityksistä.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
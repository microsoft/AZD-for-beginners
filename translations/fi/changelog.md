<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:33:35+00:00",
  "source_file": "changelog.md",
  "language_code": "fi"
}
-->
# Muutosloki - AZD Aloittelijoille

## Johdanto

Tämä muutosloki dokumentoi kaikki merkittävät muutokset, päivitykset ja parannukset AZD Aloittelijoille -repositoryyn. Noudatamme semanttisen versionhallinnan periaatteita ja ylläpidämme tätä lokia auttaaksemme käyttäjiä ymmärtämään, mitä versioiden välillä on muuttunut.

## Oppimistavoitteet

Tarkastelemalla tätä muutoslokia voit:
- Pysyä ajan tasalla uusista ominaisuuksista ja sisällön lisäyksistä
- Ymmärtää parannuksia olemassa olevaan dokumentaatioon
- Seurata virhekorjauksia ja tarkistuksia tarkkuuden varmistamiseksi
- Seurata oppimateriaalien kehitystä ajan myötä

## Oppimistulokset

Muutoslokimerkintöjen tarkastelun jälkeen pystyt:
- Tunnistamaan uudet oppimiseen tarkoitetut sisällöt ja resurssit
- Ymmärtämään, mitkä osiot on päivitetty tai parannettu
- Suunnittelemaan oppimispolkusi ajankohtaisimpien materiaalien perusteella
- Antamaan palautetta ja ehdotuksia tulevia parannuksia varten

## Versiohistoria

### [v3.4.0] - 2025-10-24

#### Infrastruktuurin esikatselu ja validointiparannukset
**Tämä versio tuo kattavan tuen uudelle Azure Developer CLI -esikatseluominaisuudelle ja parantaa työpajakäyttäjien kokemusta.**

#### Lisätty
- **🧪 azd provision --preview -ominaisuuden dokumentaatio**: Kattava esittely infrastruktuurin esikatselukyvystä
  - Komentoviitteet ja käyttöesimerkit pikaoppaassa
  - Yksityiskohtainen integrointi provisiointiohjeisiin käyttötapauksineen ja hyötyineen
  - Ennakkotarkistusten integrointi turvallisemman käyttöönoton validointiin
  - Aloitusoppaan päivitykset turvallisuutta korostavilla käyttöönoton käytännöillä
- **🚧 Työpajan tilabanneri**: Ammattimainen HTML-banneri, joka ilmoittaa työpajan kehitystilasta
  - Gradienttimuotoilu ja rakennusindikaattorit selkeään viestintään
  - Päivitetty viimeksi -aikaleima läpinäkyvyyden vuoksi
  - Mobiiliystävällinen muotoilu kaikille laitteille

#### Parannettu
- **Infrastruktuurin turvallisuus**: Esikatselutoiminto integroitu koko käyttöönoton dokumentaatioon
- **Ennakkovalidointi**: Automatisoidut skriptit sisältävät nyt infrastruktuurin esikatselutestauksen
- **Kehittäjän työnkulku**: Päivitetyt komentosekvenssit sisältävät esikatselun parhaana käytäntönä
- **Työpajakokemus**: Selkeät odotukset käyttäjille sisällön kehitystilasta

#### Muutettu
- **Käyttöönoton parhaat käytännöt**: Esikatseluun perustuva työnkulku suositeltu lähestymistapa
- **Dokumentaation kulku**: Infrastruktuurin validointi siirretty oppimisprosessin alkuvaiheeseen
- **Työpajan esitys**: Ammattimainen tilaviestintä selkeällä kehitysaikataululla

#### Parannettu
- **Turvallisuus ensin**: Infrastruktuurimuutokset voidaan nyt validoida ennen käyttöönottoa
- **Tiimityöskentely**: Esikatselutulokset voidaan jakaa tarkistusta ja hyväksyntää varten
- **Kustannustietoisuus**: Parempi ymmärrys resurssikustannuksista ennen provisiointia
- **Riskien hallinta**: Vähentynyt käyttöönoton epäonnistuminen ennakkovalidoinnin ansiosta

#### Tekninen toteutus
- **Monidokumentti-integraatio**: Esikatseluominaisuus dokumentoitu neljässä keskeisessä tiedostossa
- **Komentomallit**: Johdonmukainen syntaksi ja esimerkit dokumentaatiossa
- **Parhaiden käytäntöjen integrointi**: Esikatselu sisällytetty validointityönkulkuihin ja skripteihin
- **Visuaaliset indikaattorit**: Selkeät UUSI-ominaisuusmerkinnät löydettävyyden parantamiseksi

#### Työpajan infrastruktuuri
- **Tilaviestintä**: Ammattimainen HTML-banneri gradienttimuotoilulla
- **Käyttäjäkokemus**: Selkeä kehitystilaviestintä estää sekaannukset
- **Ammattimainen esitys**: Säilyttää repositoryn uskottavuuden ja asettaa odotukset
- **Aikataulun läpinäkyvyys**: Lokakuu 2025 viimeksi päivitetty aikaleima vastuullisuuden vuoksi

### [v3.3.0] - 2025-09-24

#### Parannettu työpajamateriaali ja interaktiivinen oppimiskokemus
**Tämä versio tuo kattavat työpajamateriaalit selainpohjaisilla interaktiivisilla oppailla ja jäsennellyillä oppimispoluilla.**

#### Lisätty
- **🎥 Interaktiivinen työpajaopas**: Selainpohjainen työpajakokemus MkDocs-esikatselukyvyn avulla
- **📝 Jäsennellyt työpajaohjeet**: 7-vaiheinen ohjattu oppimispolku aloituksesta räätälöintiin
  - 0-Esittely: Työpajan yleiskatsaus ja asennus
  - 1-Valitse-AI-Malli: Mallin valinta ja löytöprosessi
  - 2-Validoi-AI-Malli: Käyttöönotto ja validointimenettelyt
  - 3-Pura-AI-Malli: Mallin arkkitehtuurin ymmärtäminen
  - 4-Konfiguroi-AI-Malli: Konfigurointi ja räätälöinti
  - 5-Räätälöi-AI-Malli: Edistyneet muokkaukset ja iteroinnit
  - 6-Pura-Infrastruktuuri: Siivous ja resurssien hallinta
  - 7-Yhteenveto: Yhteenveto ja seuraavat askeleet
- **🛠️ Työpajatyökalut**: MkDocs-konfiguraatio Material-teemalla parannetun oppimiskokemuksen takaamiseksi
- **🎯 Käytännön oppimispolku**: 3-vaiheinen metodologia (Löytö → Käyttöönotto → Räätälöinti)
- **📱 GitHub Codespaces -integraatio**: Saumaton kehitysympäristön asennus

#### Parannettu
- **AI-työpajalaboratorio**: Laajennettu kattavaksi 2-3 tunnin jäsennellyksi oppimiskokemukseksi
- **Työpajadokumentaatio**: Ammattimainen esitys navigoinnilla ja visuaalisilla apuvälineillä
- **Oppimisen eteneminen**: Selkeä vaiheittainen ohjeistus mallin valinnasta tuotantokäyttöön
- **Kehittäjäkokemus**: Integroitu työkalut sujuvien kehitystyönkulkujen takaamiseksi

#### Parannettu
- **Saavutettavuus**: Selainpohjainen käyttöliittymä hakutoiminnolla, kopiointimahdollisuudella ja teeman vaihtamisella
- **Itseohjautuva oppiminen**: Joustava työpajarakenne eri oppimisnopeuksille
- **Käytännön soveltaminen**: Todelliset AI-mallin käyttöönoton skenaariot
- **Yhteisöintegraatio**: Discord-integraatio työpajatukea ja yhteistyötä varten

#### Työpajan ominaisuudet
- **Sisäänrakennettu haku**: Nopea avainsanojen ja oppituntien löytäminen
- **Kopioi koodilohkot**: Hover-toiminnolla kopiointi kaikille koodiesimerkeille
- **Teeman vaihto**: Tumma/vaalea tila eri mieltymyksille
- **Visuaaliset elementit**: Kuvakaappaukset ja kaaviot ymmärryksen parantamiseksi
- **Tuki-integraatio**: Suora Discord-yhteys yhteisötukea varten

### [v3.2.0] - 2025-09-17

#### Suuri navigoinnin uudelleenjärjestely ja lukuun perustuva oppimisjärjestelmä
**Tämä versio tuo kattavan lukuun perustuvan oppimisrakenteen ja parannetun navigoinnin koko repositoryyn.**

#### Lisätty
- **📚 Lukuun perustuva oppimisjärjestelmä**: Koko kurssi uudelleenjärjestetty 8 edistykselliseen oppimislukuun
  - Luku 1: Perusteet ja pika-aloitus (⭐ - 30-45 min)
  - Luku 2: AI-ensimmäinen kehitys (⭐⭐ - 1-2 tuntia)
  - Luku 3: Konfigurointi ja autentikointi (⭐⭐ - 45-60 min)
  - Luku 4: Infrastruktuuri koodina ja käyttöönotto (⭐⭐⭐ - 1-1,5 tuntia)
  - Luku 5: Moniagenttiset AI-ratkaisut (⭐⭐⭐⭐ - 2-3 tuntia)
  - Luku 6: Ennakkovalidointi ja suunnittelu (⭐⭐ - 1 tunti)
  - Luku 7: Vianetsintä ja virheenkorjaus (⭐⭐ - 1-1,5 tuntia)
  - Luku 8: Tuotanto ja yrityskäytännöt (⭐⭐⭐⭐ - 2-3 tuntia)
- **📚 Kattava navigointijärjestelmä**: Johdonmukaiset navigointipalkit ja alatunnisteet kaikessa dokumentaatiossa
- **🎯 Etenemisen seuranta**: Kurssin suorittamisen tarkistuslista ja oppimisen varmistusjärjestelmä
- **🗺️ Oppimispolkuohjeet**: Selkeät aloituspisteet eri kokemustasoille ja tavoitteille
- **🔗 Ristiviittausnavigointi**: Liitetyt luvut ja edellytykset selkeästi linkitetty

#### Parannettu
- **README-rakenne**: Muutettu jäsennellyksi oppimisalustaksi lukuun perustuvalla järjestelyllä
- **Dokumentaation navigointi**: Jokainen sivu sisältää nyt luvun kontekstin ja etenemisen ohjeet
- **Mallien organisointi**: Esimerkit ja mallit kartoitettu sopiviin oppimislukuihin
- **Resurssi-integraatio**: Pikaoppaat, usein kysytyt kysymykset ja opintomateriaalit yhdistetty relevantteihin lukuihin
- **Työpajaintegraatio**: Käytännön laboratoriot kartoitettu useisiin luvun oppimistavoitteisiin

#### Muutettu
- **Oppimisen eteneminen**: Siirrytty lineaarisesta dokumentaatiosta joustavaan lukuun perustuvaan oppimiseen
- **Konfigurointisijoittelu**: Konfigurointiohje siirretty luvuksi 3 paremman oppimisvirran takaamiseksi
- **AI-sisällön integrointi**: AI-spesifisen sisällön parempi integrointi koko oppimismatkan aikana
- **Tuotantosisältö**: Edistyneet käytännöt koottu lukuun 8 yrityskäyttäjille

#### Parannettu
- **Käyttäjäkokemus**: Selkeät navigointipolut ja luvun etenemisen indikaattorit
- **Saavutettavuus**: Johdonmukaiset navigointimallit helpottavat kurssin kulkua
- **Ammattimainen esitys**: Yliopistotyyppinen kurssirakenne sopii akateemiseen ja yrityskoulutukseen
- **Oppimisen tehokkuus**: Lyhentynyt aika löytää relevantti sisältö parannetun organisoinnin ansiosta

#### Tekninen toteutus
- **Navigointipalkit**: Standardoidut luvun navigointipalkit yli 40 dokumentaatiotiedostossa
- **Alatunnisteen navigointi**: Johdonmukaiset etenemisen ohjeet ja luvun suorittamisen indikaattorit
- **Ristilinkitys**: Kattava sisäinen linkitysjärjestelmä, joka yhdistää liittyvät käsitteet
- **Lukumappaus**: Mallit ja esimerkit selkeästi yhdistetty oppimistavoitteisiin

#### Opasparannukset
- **📚 Kattavat oppimistavoitteet**: Uudelleenjärjestetty opas vastaamaan 8-luvun järjestelmää
- **🎯 Lukuun perustuva arviointi**: Jokainen luku sisältää erityiset oppimistavoitteet ja käytännön harjoituksia
- **📋 Etenemisen seuranta**: Viikoittainen oppimisaikataulu mitattavilla tuloksilla ja suorittamisen tarkistuslistoilla
- **❓ Arviointikysymykset**: Tietojen validointikysymykset jokaiselle luvulle ammattimaisilla tuloksilla
- **🛠️ Käytännön harjoitukset**: Käytännön aktiviteetit todellisilla käyttöönoton skenaarioilla ja vianetsinnällä
- **📊 Taitojen kehitys**: Selkeä eteneminen peruskäsitteistä yrityskäytäntöihin urakehityksen painotuksella
- **🎓 Sertifiointikehys**: Ammatillisen kehityksen tulokset ja yhteisön tunnustusjärjestelmä
- **⏱️ Aikataulun hallinta**: Jäsennelty 10 viikon oppimissuunnitelma virstanpylväiden validoinnilla

### [v3.1.0] - 2025-09-17

#### Parannettu moniagenttiset AI-ratkaisut
**Tämä versio parantaa moniagenttista vähittäiskaupan ratkaisua paremmilla agenttien nimillä ja parannetulla dokumentaatiolla.**

#### Muutettu
- **Moniagenttinen terminologia**: Korvattu "Cora agent" termillä "Asiakasagentti" koko vähittäiskaupan moniagenttiratkaisussa selkeyden lisäämiseksi
- **Agenttiarkkitehtuuri**: Päivitetty kaikki dokumentaatio, ARM-mallit ja koodiesimerkit käyttämään johdonmukaista "Asiakasagentti"-nimitystä
- **Konfigurointiesimerkit**: Modernisoitu agenttien konfigurointimallit päivitettyjen nimitysten mukaisesti
- **Dokumentaation johdonmukaisuus**: Varmistettu, että kaikki viittaukset käyttävät ammattimaisia ja kuvaavia agenttien nimiä

#### Parannettu
- **ARM-mallipaketti**: Päivitetty vähittäiskaupan moniagentti-ARM-malli Asiakasagentti-viittauksilla
- **Arkkitehtuurikaaviot**: Uudistettu Mermaid-kaaviot päivitettyjen agenttien nimitysten mukaisesti
- **Koodiesimerkit**: Python-luokat ja toteutusesimerkit käyttävät nyt AsiakasAgentti-nimitystä
- **Ympäristömuuttujat**: Päivitetty kaikki käyttöönoton skriptit käyttämään CUSTOMER_AGENT_NAME-konventioita

#### Parannettu
- **Kehittäjäkokemus**: Selkeämmät agenttien roolit ja vastuut dokumentaatiossa
- **Tuotantovalmius**: Parempi yhdenmukaisuus yritysten nimityskonventioiden kanssa
- **Oppimateriaalit**: Intuitiivisemmat agenttien nimitykset opetustarkoituksiin
- **Mallien käytettävyys**: Yksinkertaistettu agenttien toimintojen ja käyttöönoton mallien ymmärtäminen

#### Teknisiä yksityiskohtia
- Päivitetty Mermaid-arkkitehtuurikaaviot AsiakasAgentti-viittauksilla
- Korvattu CoraAgent-luokan nimet AsiakasAgentti-nimillä Python-esimerkeissä
- Muokattu ARM-mallien JSON-konfiguraatiot käyttämään "asiakas"-agenttityyppiä
- Päivitetty ympäristömuuttujat CORA_AGENT_*:sta CUSTOMER_AGENT_*-malleihin
- Uudistettu kaikki käyttöönoton komennot ja konttikonfiguraatiot

### [v3.0.0] - 2025-09-12

#### Suuria muutoksia - AI-kehittäjäpainotus ja Azure AI Foundry -integraatio
**Tämä versio muuttaa repositoryn kattavaksi AI-painotteiseksi oppimisresurssiksi Azure AI Foundry -integraatiolla.**

#### Lisätty
- **🤖 AI-ensimmäinen oppimispolku**: Täydellinen rakenneuudistus
- **Dokumentaation muoto**: Standardisoitu kaikki dokumentaatio yhtenäisellä oppimiseen keskittyvällä rakenteella
- **Navigointivirta**: Toteutettu looginen eteneminen kaikissa oppimateriaaleissa
- **Sisällön esitys**: Poistettu koristeelliset elementit selkeän ja ammattimaisen muotoilun hyväksi
- **Linkkirakenne**: Päivitetty kaikki sisäiset linkit tukemaan uutta navigointijärjestelmää

#### Parannettu
- **Saavutettavuus**: Poistettu emojiriippuvuudet paremman ruudunlukijayhteensopivuuden vuoksi
- **Ammattimainen ulkoasu**: Selkeä, akateeminen esitystyyli, joka sopii yritysoppimiseen
- **Oppimiskokemus**: Rakenteellinen lähestymistapa, jossa jokaisella oppitunnilla on selkeät tavoitteet ja tulokset
- **Sisällön organisointi**: Parempi looginen virtaus ja yhteys aiheiden välillä

### [v1.0.0] - 2025-09-09

#### Ensimmäinen julkaisu - Kattava AZD-oppimisarkisto

#### Lisätty
- **Ydindokumentaation rakenne**
  - Täydellinen aloitusopassarja
  - Kattava käyttöönotto- ja provisiointidokumentaatio
  - Yksityiskohtaiset vianetsintäresurssit ja virheenkorjausoppaat
  - Ennakkokäyttöönoton validointityökalut ja -menettelyt

- **Aloitusmoduuli**
  - AZD perusteet: Keskeiset käsitteet ja terminologia
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
  - Ennakkotarkistukset: Automaattiset validointiskriptit (PowerShell ja Bash)
  - Kustannusarviointi- ja budjetointityökalut

- **Vianetsintämoduuli**
  - Yleiset ongelmat: Usein kohdatut ongelmat ja ratkaisut
  - Virheenkorjausopas: Järjestelmälliset vianetsintämenetelmät
  - Edistyneet diagnostiikkatekniikat ja -työkalut
  - Suorituskyvyn seuranta ja optimointi

- **Resurssit ja viitteet**
  - Komentojen pikaopas: Nopea viite tärkeimmille komennoille
  - Sanasto: Kattavat terminologian ja lyhenteiden määritelmät
  - FAQ: Yksityiskohtaiset vastaukset yleisiin kysymyksiin
  - Ulkoiset resurssilinkit ja yhteisöyhteydet

- **Esimerkit ja mallit**
  - Yksinkertainen verkkosovellusesimerkki
  - Staattisen verkkosivuston käyttöönoton malli
  - Konttisovelluksen konfigurointi
  - Tietokannan integrointimallit
  - Mikroservices-arkkitehtuuriesimerkit
  - Serverless-funktioiden toteutukset

#### Ominaisuudet
- **Monialustatuki**: Asennus- ja konfigurointioppaat Windowsille, macOS:lle ja Linuxille
- **Useita taitotasoja**: Sisältöä opiskelijoille ja ammattilaiskehittäjille
- **Käytännönläheisyys**: Käytännön esimerkkejä ja tosielämän skenaarioita
- **Kattava sisältö**: Peruskäsitteistä edistyneisiin yritysmalleihin
- **Turvallisuus ensin**: Turvallisuuden parhaat käytännöt integroitu koko dokumentaatioon
- **Kustannusoptimointi**: Ohjeet kustannustehokkaisiin käyttöönottoihin ja resurssien hallintaan

#### Dokumentaation laatu
- **Yksityiskohtaiset koodiesimerkit**: Käytännönläheiset, testatut koodiesimerkit
- **Vaiheittaiset ohjeet**: Selkeät ja toteutettavissa olevat ohjeet
- **Kattava virheenkäsittely**: Vianetsintä yleisille ongelmille
- **Parhaiden käytäntöjen integrointi**: Alan standardit ja suositukset
- **Versioyhteensopivuus**: Ajantasainen uusimpien Azure-palveluiden ja azd-ominaisuuksien kanssa

## Suunnitellut tulevat parannukset

### Versio 3.1.0 (Suunniteltu)
#### AI-alustan laajennus
- **Monimallituki**: Integraatiomallit Hugging Facelle, Azure Machine Learningille ja mukautetuille malleille
- **AI-agenttikehykset**: Mallit LangChainille, Semantic Kernelille ja AutoGen-käyttöönotolle
- **Edistyneet RAG-mallit**: Vektoripankkivaihtoehdot Azure AI Searchin lisäksi (Pinecone, Weaviate jne.)
- **AI-havainnointi**: Parannettu seuranta mallin suorituskyvylle, tokenien käytölle ja vastausten laadulle

#### Kehittäjäkokemus
- **VS Code -laajennus**: Integroitu AZD + AI Foundry -kehityskokemus
- **GitHub Copilot -integraatio**: AI-avusteinen AZD-mallien generointi
- **Interaktiiviset opetusohjelmat**: Käytännön koodausharjoituksia automaattisella validoinnilla AI-skenaarioihin
- **Videomateriaali**: Lisävideo-opetusohjelmat visuaalisille oppijoille, keskittyen AI-käyttöönottoihin

### Versio 4.0.0 (Suunniteltu)
#### Yrityksen AI-mallit
- **Hallintakehys**: AI-mallien hallinta, vaatimustenmukaisuus ja auditointipolut
- **Monivuokraaja-AI**: Mallit useiden asiakkaiden palvelemiseksi eristetyillä AI-palveluilla
- **Edge AI -käyttöönotto**: Integrointi Azure IoT Edgen ja kontti-instanssien kanssa
- **Hybridipilvi-AI**: Monipilvi- ja hybridikäyttöönoton mallit AI-työkuormille

#### Edistyneet ominaisuudet
- **AI-putkiston automaatio**: MLOps-integraatio Azure Machine Learning -putkistojen kanssa
- **Edistynyt turvallisuus**: Zero-trust-mallit, yksityiset päätepisteet ja edistynyt uhkien torjunta
- **Suorituskyvyn optimointi**: Edistyneet viritys- ja skaalausstrategiat suuritehoisille AI-sovelluksille
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
- **Yhteisön hallintapaneeli**: Reaaliaikaiset yhteisön mittarit ja osallistumisen seuranta

## Muutosten kirjaamiseen osallistuminen

### Muutosten raportointi
Kun osallistut tähän arkistoon, varmista, että muutosten kirjaus sisältää:

1. **Versio**: Semanttisen versionumeroinnin mukaisesti (major.minor.patch)
2. **Päivämäärä**: Julkaisun tai päivityksen päivämäärä muodossa YYYY-MM-DD
3. **Kategoria**: Lisätty, Muutettu, Poistettu, Korjattu, Turvallisuus
4. **Selkeä kuvaus**: Ytimekäs kuvaus muutoksesta
5. **Vaikutusarvio**: Kuinka muutokset vaikuttavat nykyisiin käyttäjiin

### Muutosten kategoriat

#### Lisätty
- Uudet ominaisuudet, dokumentaatio-osat tai toiminnot
- Uudet esimerkit, mallit tai oppimisresurssit
- Lisätyökalut, skriptit tai apuvälineet

#### Muutettu
- Muutokset olemassa olevaan toiminnallisuuteen tai dokumentaatioon
- Päivitykset selkeyden tai tarkkuuden parantamiseksi
- Sisällön tai rakenteen uudelleenjärjestely

#### Poistettu
- Ominaisuudet, dokumentaatio tai esimerkit, jotka eivät enää ole relevantteja
- Vanhentunut tieto tai poistettavat lähestymistavat
- Päällekkäinen tai yhdistetty sisältö

#### Korjattu
- Virheiden korjaukset dokumentaatiossa tai koodissa
- Ilmoitettujen ongelmien tai vikojen ratkaisut
- Tarkkuuden tai toiminnallisuuden parannukset

#### Turvallisuus
- Turvallisuuteen liittyvät parannukset tai korjaukset
- Päivitykset turvallisuuden parhaisiin käytäntöihin
- Turvallisuushaavoittuvuuksien ratkaisut

### Semanttisen versionhallinnan ohjeet

#### Pääversio (X.0.0)
- Muutokset, jotka vaativat käyttäjän toimia
- Sisällön tai rakenteen merkittävä uudelleenjärjestely
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

### Kuinka antaa palautetta
- **GitHub Issues**: Ilmoita ongelmista tai ehdota parannuksia (AI-spesifiset ongelmat tervetulleita)
- **Discord-keskustelut**: Jaa ideoita ja osallistu Azure AI Foundry -yhteisöön
- **Pull Requests**: Tee suoria parannuksia sisältöön, erityisesti AI-malleihin ja oppaisiin
- **Azure AI Foundry Discord**: Osallistu #Azure-kanavaan AZD + AI-keskusteluissa
- **Yhteisöfoorumit**: Osallistu laajempiin Azure-kehittäjäkeskusteluihin

### Palautekategoriat
- **AI-sisällön tarkkuus**: Korjaukset AI-palveluiden integrointi- ja käyttöönottoinformaatioon
- **Oppimiskokemus**: Ehdotukset AI-kehittäjän oppimisen parantamiseksi
- **Puuttuva AI-sisältö**: Pyynnöt lisä-AI-malleista, -malleista tai -esimerkeistä
- **Saavutettavuus**: Parannukset monipuolisiin oppimistarpeisiin
- **AI-työkalujen integrointi**: Ehdotukset AI-kehitystyönkulun parempaan integrointiin
- **Tuotannon AI-mallit**: Pyynnöt yrityksen AI-käyttöönoton malleista

### Vastauslupaus
- **Ongelmiin vastaaminen**: 48 tunnin sisällä ilmoitetuista ongelmista
- **Ominaisuuspyynnöt**: Arviointi viikon sisällä
- **Yhteisön panokset**: Tarkistus viikon sisällä
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
- **Teknologiapäivitykset**: Yhteensovitus uusimpien Azure-palveluiden ja azd-julkaisujen kanssa
- **Saavutettavuustarkastukset**: Säännöllinen tarkistus inklusiivisen suunnittelun periaatteiden mukaisesti

## Versiotukikäytäntö

### Nykyisen version tuki
- **Uusin pääversio**: Täysi tuki säännöllisillä päivityksillä
- **Edellinen pääversio**: Turvallisuuspäivitykset ja kriittiset korjaukset 12 kuukauden ajan
- **Vanhemmat versiot**: Vain yhteisön tuki, ei virallisia päivityksiä

### Siirtymäohjeet
Kun pääversiot julkaistaan, tarjoamme:
- **Siirtymäoppaat**: Vaiheittaiset siirtymäohjeet
- **Yhteensopivuusmuistiinpanot**: Tiedot merkittävistä muutoksista
- **Työkalutuki**: Skriptit tai apuvälineet siirtymisen avuksi
- **Yhteisön tuki**: Omistetut foorumit siirtymiskysymyksille

---

**Navigointi**
- **Edellinen oppitunti**: [Opintosuunnitelma](resources/study-guide.md)
- **Seuraava oppitunti**: Palaa [Pää README](README.md)

**Pysy ajan tasalla**: Seuraa tätä arkistoa saadaksesi ilmoituksia uusista julkaisuista ja tärkeistä oppimateriaalien päivityksistä.

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-18T06:30:38+00:00",
  "source_file": "course-outline.md",
  "language_code": "fi"
}
-->
## 8-luvun oppimisrakenne

### Luku 1: Perusteet ja nopea aloitus (30-45 minuuttia) 🌱
**Edellytykset**: Azure-tilaus, perustiedot komentorivistä  
**Vaikeustaso**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteet
- AZD:n asentaminen alustallesi  
- Ensimmäinen onnistunut käyttöönotto
- Keskeiset käsitteet ja terminologia

#### Oppimateriaalit
- [AZD Basics](docs/getting-started/azd-basics.md) - Keskeiset käsitteet
- [Installation & Setup](docs/getting-started/installation.md) - Alustakohtaiset ohjeet
- [Your First Project](docs/getting-started/first-project.md) - Käytännön opas
- [Command Cheat Sheet](resources/cheat-sheet.md) - Pikaopas

#### Käytännön tulos
Onnistunut yksinkertaisen verkkosovelluksen käyttöönotto Azureen AZD:n avulla

---

### Luku 2: AI-ensimmäinen kehitys (1-2 tuntia) 🤖
**Edellytykset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Azure AI Foundryn integrointi AZD:n kanssa
- AI-pohjaisten sovellusten käyttöönotto
- AI-palveluiden konfiguroinnin ymmärtäminen
- RAG (Retrieval-Augmented Generation) -mallit

#### Oppimateriaalit
- [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Käytännön harjoitus
- [Azure AI Foundry Templates](README.md#featured-azure-ai-foundry-templates)

#### Käytännön tulos
AI-pohjaisen chat-sovelluksen käyttöönotto ja konfigurointi RAG-ominaisuuksilla

---

### Luku 3: Konfigurointi ja autentikointi (45-60 minuuttia) ⚙️
**Edellytykset**: Luku 1 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Autentikoinnin ja tietoturvan parhaat käytännöt
- Resurssien nimeäminen ja organisointi
- Moniympäristön käyttöönotot

#### Oppimateriaalit
- [Configuration Guide](docs/getting-started/configuration.md) - Ympäristön asennus
- Tietoturvamallit ja hallittu identiteetti
- Moniympäristön esimerkit

#### Käytännön tulos
Useiden ympäristöjen hallinta oikeilla autentikointi- ja tietoturvakäytännöillä

---

### Luku 4: Infrastruktuuri koodina ja käyttöönotto (1-1,5 tuntia) 🏗️
**Edellytykset**: Luvut 1-3 suoritettu  
**Vaikeustaso**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönoton mallit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisiointistrategiat
- Mukautettujen mallien luominen

#### Oppimateriaalit
- [Deployment Guide](docs/deployment/deployment-guide.md) - Täydelliset työnkulut
- [Provisioning Resources](docs/deployment/provisioning.md) - Resurssien hallinta
- Kontti- ja mikropalveluesimerkit

#### Käytännön tulos
Monimutkaisten monipalvelusovellusten käyttöönotto mukautetuilla infrastruktuurimalleilla

---

### Luku 5: Moniagenttiset AI-ratkaisut (2-3 tuntia) 🤖🤖
**Edellytykset**: Luvut 1-2 suoritettu  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä opit
- Moniagenttiset arkkitehtuurimallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit AI-käyttöönotot
- Asiakas- ja varastoagenttien toteutukset

#### Oppimateriaalit
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Täydellinen toteutus
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- Moniagenttien koordinointimallit

#### Käytännön tulos
Tuotantovalmiin moniagenttisen AI-ratkaisun käyttöönotto ja hallinta

---

### Luku 6: Esikäyttöönoton validointi ja suunnittelu (1 tunti) 🔍
**Edellytykset**: Luku 4 suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Esitarkistukset ja automaatio
- Kustannusoptimointisuunnittelu

#### Oppimateriaalit
- [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resurssien validointi
- [SKU Selection](docs/pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automatisoidut skriptit

#### Käytännön tulos
Käyttöönottojen validointi ja optimointi ennen toteutusta

---

### Luku 7: Vianetsintä ja virheenkorjaus (1-1,5 tuntia) 🔧
**Edellytykset**: Mikä tahansa käyttöönottoon liittyvä luku suoritettu  
**Vaikeustaso**: ⭐⭐

#### Mitä opit
- Järjestelmälliset vianetsintämenetelmät
- Yleiset ongelmat ja ratkaisut
- AI-spesifinen vianetsintä
- Suorituskyvyn optimointi

#### Oppimateriaalit
- [Common Issues](docs/troubleshooting/common-issues.md) - FAQ ja ratkaisut
- [Debugging Guide](docs/troubleshooting/debugging.md) - Vaiheittaiset strategiat
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI-palveluiden ongelmat

#### Käytännön tulos
Yleisimpien käyttöönotto-ongelmien itsenäinen diagnosointi ja ratkaisu

---

### Luku 8: Tuotanto- ja yritysmallit (2-3 tuntia) 🏢
**Edellytykset**: Luvut 1-4 suoritettu  
**Vaikeustaso**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritystason tietoturvamallit
- Seuranta ja kustannusoptimointi
- Skaalautuvuus ja hallintamallit

#### Oppimateriaalit
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Yritysmallit
- Mikropalvelu- ja yritysesimerkit
- Seuranta- ja hallintakehykset

#### Käytännön tulos
Yritystason sovellusten käyttöönotto tuotantovalmiuksilla

---

## Oppimisen eteneminen ja vaikeustaso

### Taitojen progressiivinen kehittäminen

- **🌱 Aloittelijat**: Aloita luvusta 1 (Perusteet) → Luku 2 (AI-kehitys)
- **🔧 Keskitaso**: Luvut 3-4 (Konfigurointi & infrastruktuuri) → Luku 6 (Validointi)
- **🚀 Edistynyt**: Luku 5 (Moniagenttiset ratkaisut) → Luku 7 (Vianetsintä)
- **🏢 Yritystaso**: Suorita kaikki luvut, keskity lukuun 8 (Tuotantomallit)

### Vaikeustason indikaattorit

- **⭐ Perustaso**: Yksinkertaiset käsitteet, ohjatut harjoitukset, 30-60 minuuttia
- **⭐⭐ Keskitaso**: Useita käsitteitä, käytännön harjoituksia, 1-2 tuntia  
- **⭐⭐⭐ Edistynyt**: Monimutkaiset arkkitehtuurit, mukautetut ratkaisut, 1-3 tuntia
- **⭐⭐⭐⭐ Asiantuntija**: Tuotantojärjestelmät, yritysmallit, 2-4 tuntia

### Joustavat oppimispolut

#### 🎯 AI-kehittäjän pikapolku (4-6 tuntia)
1. **Luku 1**: Perusteet ja nopea aloitus (45 min)
2. **Luku 2**: AI-ensimmäinen kehitys (2 tuntia)  
3. **Luku 5**: Moniagenttiset AI-ratkaisut (3 tuntia)
4. **Luku 8**: Tuotannon AI parhaat käytännöt (1 tunti)

#### 🛠️ Infrastruktuuriasiantuntijan polku (5-7 tuntia)
1. **Luku 1**: Perusteet ja nopea aloitus (45 min)
2. **Luku 3**: Konfigurointi ja autentikointi (1 tunti)
3. **Luku 4**: Infrastruktuuri koodina ja käyttöönotto (1,5 tuntia)
4. **Luku 6**: Esikäyttöönoton validointi ja suunnittelu (1 tunti)
5. **Luku 7**: Vianetsintä ja virheenkorjaus (1,5 tuntia)
6. **Luku 8**: Tuotanto- ja yritysmallit (2 tuntia)

#### 🎓 Täydellinen oppimismatka (8-12 tuntia)
Kaikkien 8 luvun suorittaminen järjestyksessä käytännön harjoituksilla ja validoinnilla

## Kurssin suorittamisen rakenne

### Tiedon validointi
- **Lukukohtaiset tarkistuspisteet**: Käytännön harjoituksia mitattavilla tuloksilla
- **Käytännön vahvistus**: Toimivien ratkaisujen käyttöönotto jokaisessa luvussa
- **Edistymisen seuranta**: Visuaaliset indikaattorit ja suoritusmerkit
- **Yhteisön validointi**: Kokemusten jakaminen Azure Discord -kanavilla

### Oppimistulosten arviointi

#### Luvut 1-2 (Perusteet + AI) suoritettu
- ✅ Perussovelluksen käyttöönotto AZD:llä
- ✅ AI-pohjaisen chat-sovelluksen käyttöönotto RAG:lla
- ✅ AZD:n keskeisten käsitteiden ja AI-integraation ymmärtäminen

#### Luvut 3-4 (Konfigurointi + infrastruktuuri) suoritettu  
- ✅ Moniympäristön hallinta
- ✅ Mukautettujen Bicep-infrastruktuurimallien luominen
- ✅ Turvallisten autentikointimallien toteutus

#### Luvut 5-6 (Moniagenttiset ratkaisut + validointi) suoritettu
- ✅ Monimutkaisen moniagenttisen AI-ratkaisun käyttöönotto
- ✅ Kapasiteettisuunnittelu ja kustannusoptimointi
- ✅ Automatisoidun esikäyttöönoton validoinnin toteutus

#### Luvut 7-8 (Vianetsintä + tuotanto) suoritettu
- ✅ Käyttöönotto-ongelmien itsenäinen diagnosointi ja ratkaisu  
- ✅ Yritystason seurannan ja tietoturvan toteutus
- ✅ Tuotantovalmiiden sovellusten käyttöönotto hallintamalleilla

### Sertifiointi ja tunnustus
- **Kurssin suoritusmerkki**: Kaikkien 8 luvun suorittaminen käytännön validoinnilla
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Azure AI Foundry Discordissa
- **Ammatillinen kehitys**: Teollisuudelle relevantit AZD- ja AI-käyttöönoton taidot
- **Urapolun edistäminen**: Yritystason pilvikäyttöönoton valmiudet

## Sisällön soveltuvuus nykyaikaisille kehittäjille

### Tekninen syvyys ja kattavuus
- **Azure OpenAI -integraatio**: GPT-4o, upotukset ja monimallien käyttöönotot
- **AI-arkkitehtuurimallit**: RAG-toteutukset, moniagenttien orkestrointi ja tuotannon AI-työnkulut
- **Infrastruktuuri koodina**: Bicep-mallit, ARM-käyttöönotot ja automatisoitu provisiointi
- **Tuotantovalmius**: Tietoturva, skaalautuvuus, seuranta, kustannusoptimointi ja hallinta
- **Yritysmallit**: Moniympäristön käyttöönotot, CI/CD-integraatio ja vaatimustenmukaisuuskehykset

### Käytännön oppimisen painotus
- **Käyttöönoton automaatio**: Painotus käytännön AZD-työnkulkuihin, ei teoreettisiin käsitteisiin
- **Todelliset skenaariot**: Täydellinen vähittäiskaupan moniagenttiratkaisu asiakas- ja varastoagenteilla
- **Tuotantoesimerkit**: ARM-mallipaketit, yhden klikkauksen käyttöönotot ja yritysmallit
- **Vianetsintätaidot**: AI-spesifinen virheenkorjaus, monipalveludiagnostiikka ja suorituskyvyn optimointi
- **Teollisuuden relevanssi**: Perustuu Azure AI Foundry -yhteisön palautteeseen ja yritysvaatimuksiin

### Yhteisön ja tuen integrointi
- **Discord-integraatio**: Aktiivinen osallistuminen Azure AI Foundry- ja Microsoft Azure -yhteisöihin
- **GitHub-keskustelut**: Yhteisöllinen oppiminen ja ongelmanratkaisu kollegoiden ja asiantuntijoiden kanssa
- **Asiantuntijayhteys**: Suora yhteys Microsoftin insinööreihin ja AI-käyttöönoton asiantuntijoihin
- **Jatkuvat päivitykset**: Kurssisisältö kehittyy Azure-alustan päivitysten ja yhteisön palautteen mukaan
- **Urapolun kehitys**: Taitoja, jotka soveltuvat suoraan nykyaikaisiin pilvi- ja AI-kehitysrooleihin

### Oppimistulosten validointi
- **Mitattavat taidot**: Jokainen luku sisältää käytännön käyttöönottoharjoituksia, joilla on todennettavat tulokset
- **Portfolion kehitys**: Valmiit projektit, jotka soveltuvat ammatillisiin portfolioihin ja työhaastatteluihin
- **Teollisuuden tunnustus**: Taitoja, jotka vastaavat nykyisiä työmarkkinoiden vaatimuksia AZD- ja AI-käyttöönoton osaamiselle
- **Ammatillinen verkosto**: Pääsy Azure-kehittäjäyhteisöön uran edistämiseksi ja yhteistyön mahdollistamiseksi

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
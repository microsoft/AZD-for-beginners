<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-18T12:57:54+00:00",
  "source_file": "course-outline.md",
  "language_code": "sl"
}
-->
## Struktura učenja v 8 poglavjih

### Poglavje 1: Osnove in hitri začetek (30-45 minut) 🌱
**Predpogoji**: Azure naročnina, osnovno znanje ukazne vrstice  
**Kompleksnost**: ⭐

#### Kaj se boste naučili
- Razumevanje osnov Azure Developer CLI
- Namestitev AZD na vaši platformi  
- Vaša prva uspešna uvedba
- Ključni koncepti in terminologija

#### Učni viri
- [Osnove AZD](docs/getting-started/azd-basics.md) - Ključni koncepti
- [Namestitev in nastavitev](docs/getting-started/installation.md) - Vodniki za specifične platforme
- [Vaš prvi projekt](docs/getting-started/first-project.md) - Praktični vodič
- [Pregled ukazov](resources/cheat-sheet.md) - Hiter referenčni vodič

#### Praktični rezultat
Uspešno uvedite preprosto spletno aplikacijo na Azure z uporabo AZD

---

### Poglavje 2: Razvoj z AI v ospredju (1-2 uri) 🤖
**Predpogoji**: Zaključeno poglavje 1  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Integracija Azure AI Foundry z AZD
- Uvedba aplikacij, ki temeljijo na AI
- Razumevanje konfiguracij AI storitev
- Vzorci RAG (Retrieval-Augmented Generation)

#### Učni viri
- [Integracija Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [Uvedba AI modelov](docs/ai-foundry/ai-model-deployment.md)
- [Delavnica AI](docs/ai-foundry/ai-workshop-lab.md) - Praktična delavnica
- [Predloge Azure AI Foundry](README.md#featured-azure-ai-foundry-templates)

#### Praktični rezultat
Uvedite in konfigurirajte aplikacijo za klepet, ki temelji na AI, z zmogljivostmi RAG

---

### Poglavje 3: Konfiguracija in avtentikacija (45-60 minut) ⚙️
**Predpogoji**: Zaključeno poglavje 1  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Konfiguracija in upravljanje okolja
- Najboljše prakse za avtentikacijo in varnost
- Poimenovanje in organizacija virov
- Uvedbe v več okoljih

#### Učni viri
- [Vodnik za konfiguracijo](docs/getting-started/configuration.md) - Nastavitev okolja
- Varnostni vzorci in upravljana identiteta
- Primeri več okoljskih konfiguracij

#### Praktični rezultat
Upravljajte več okolij z ustrezno avtentikacijo in varnostjo

---

### Poglavje 4: Infrastruktura kot koda in uvedba (1-1,5 ure) 🏗️
**Predpogoji**: Zaključena poglavja 1-3  
**Kompleksnost**: ⭐⭐⭐

#### Kaj se boste naučili
- Napredni vzorci uvedbe
- Infrastruktura kot koda z Bicep
- Strategije za zagotavljanje virov
- Ustvarjanje prilagojenih predlog

#### Učni viri
- [Vodnik za uvedbo](docs/deployment/deployment-guide.md) - Celotni delovni tokovi
- [Zagotavljanje virov](docs/deployment/provisioning.md) - Upravljanje virov
- Primeri kontejnerjev in mikrostoritev

#### Praktični rezultat
Uvedite kompleksne aplikacije z več storitvami z uporabo prilagojenih infrastrukturnih predlog

---

### Poglavje 5: Rešitve z več agenti AI (2-3 ure) 🤖🤖
**Predpogoji**: Zaključena poglavja 1-2  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Vzorci arhitekture z več agenti
- Orkestracija in koordinacija agentov
- Uvedbe AI, pripravljene za produkcijo
- Implementacije agentov za stranke in zaloge

#### Učni viri
- [Rešitev za več agentov v maloprodaji](examples/retail-scenario.md) - Celotna implementacija
- [ARM predloga za več agentov](../../examples/retail-multiagent-arm-template) - Uvedba z enim klikom
- Vzorci koordinacije več agentov

#### Praktični rezultat
Uvedite in upravljajte produkcijsko rešitev AI z več agenti

---

### Poglavje 6: Validacija pred uvedbo in načrtovanje (1 ura) 🔍
**Predpogoji**: Zaključeno poglavje 4  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Načrtovanje zmogljivosti in validacija virov
- Strategije izbire SKU
- Preverjanja pred uvedbo in avtomatizacija
- Načrtovanje optimizacije stroškov

#### Učni viri
- [Načrtovanje zmogljivosti](docs/pre-deployment/capacity-planning.md) - Validacija virov
- [Izbira SKU](docs/pre-deployment/sku-selection.md) - Stroškovno učinkovite izbire
- [Preverjanja pred uvedbo](docs/pre-deployment/preflight-checks.md) - Avtomatizirani skripti

#### Praktični rezultat
Validirajte in optimizirajte uvedbe pred izvedbo

---

### Poglavje 7: Odpravljanje težav in odpravljanje napak (1-1,5 ure) 🔧
**Predpogoji**: Zaključeno katerokoli poglavje o uvedbi  
**Kompleksnost**: ⭐⭐

#### Kaj se boste naučili
- Sistematični pristopi k odpravljanju napak
- Pogoste težave in rešitve
- Odpravljanje težav, specifičnih za AI
- Optimizacija zmogljivosti

#### Učni viri
- [Pogoste težave](docs/troubleshooting/common-issues.md) - FAQ in rešitve
- [Vodnik za odpravljanje napak](docs/troubleshooting/debugging.md) - Korak za korakom strategije
- [Odpravljanje težav pri AI](docs/troubleshooting/ai-troubleshooting.md) - Težave pri AI storitvah

#### Praktični rezultat
Samostojno diagnosticirajte in rešite pogoste težave pri uvedbi

---

### Poglavje 8: Produkcijski in podjetniški vzorci (2-3 ure) 🏢
**Predpogoji**: Zaključena poglavja 1-4  
**Kompleksnost**: ⭐⭐⭐⭐

#### Kaj se boste naučili
- Strategije uvedbe v produkcijo
- Varnostni vzorci za podjetja
- Spremljanje in optimizacija stroškov
- Skalabilnost in upravljanje

#### Učni viri
- [Najboljše prakse za produkcijski AI](docs/ai-foundry/production-ai-practices.md) - Podjetniški vzorci
- Primeri mikrostoritev in podjetniških rešitev
- Okviri za spremljanje in upravljanje

#### Praktični rezultat
Uvedite aplikacije, pripravljene za podjetja, z vsemi produkcijskimi zmogljivostmi

---

## Napredovanje učenja in kompleksnost

### Postopno pridobivanje veščin

- **🌱 Začetniki**: Začnite s poglavjem 1 (Osnove) → Poglavje 2 (Razvoj z AI)
- **🔧 Srednji nivo**: Poglavja 3-4 (Konfiguracija in infrastruktura) → Poglavje 6 (Validacija)
- **🚀 Napredni nivo**: Poglavje 5 (Rešitve z več agenti) → Poglavje 7 (Odpravljanje težav)
- **🏢 Podjetniški nivo**: Zaključite vsa poglavja, osredotočite se na poglavje 8 (Podjetniški vzorci)

### Kazalniki kompleksnosti

- **⭐ Osnovno**: Posamezni koncepti, vodeni vodiči, 30-60 minut
- **⭐⭐ Srednje**: Več konceptov, praktična vaja, 1-2 uri  
- **⭐⭐⭐ Napredno**: Kompleksne arhitekture, prilagojene rešitve, 1-3 ure
- **⭐⭐⭐⭐ Strokovno**: Produkcijski sistemi, podjetniški vzorci, 2-4 ure

### Prilagodljive učne poti

#### 🎯 Hitra pot za AI razvijalce (4-6 ur)
1. **Poglavje 1**: Osnove in hitri začetek (45 minut)
2. **Poglavje 2**: Razvoj z AI v ospredju (2 uri)  
3. **Poglavje 5**: Rešitve z več agenti AI (3 ure)
4. **Poglavje 8**: Najboljše prakse za produkcijski AI (1 ura)

#### 🛠️ Pot za strokovnjake za infrastrukturo (5-7 ur)
1. **Poglavje 1**: Osnove in hitri začetek (45 minut)
2. **Poglavje 3**: Konfiguracija in avtentikacija (1 ura)
3. **Poglavje 4**: Infrastruktura kot koda in uvedba (1,5 ure)
4. **Poglavje 6**: Validacija pred uvedbo in načrtovanje (1 ura)
5. **Poglavje 7**: Odpravljanje težav in odpravljanje napak (1,5 ure)
6. **Poglavje 8**: Produkcijski in podjetniški vzorci (2 uri)

#### 🎓 Celotna učna pot (8-12 ur)
Zaporedno dokončanje vseh 8 poglavij s praktičnimi vajami in validacijo

## Okvir za dokončanje tečaja

### Validacija znanja
- **Preverjanje poglavij**: Praktične vaje z merljivimi rezultati
- **Praktična preverjanja**: Uvedba delujočih rešitev za vsako poglavje
- **Sledenje napredku**: Vizualni kazalniki in značke za dokončanje
- **Validacija skupnosti**: Delite izkušnje v kanalih Discord za Azure

### Ocena učnih rezultatov

#### Zaključek poglavij 1-2 (Osnove + AI)
- ✅ Uvedite osnovno spletno aplikacijo z uporabo AZD
- ✅ Uvedite aplikacijo za klepet, ki temelji na AI, z RAG
- ✅ Razumite osnovne koncepte AZD in integracijo AI

#### Zaključek poglavij 3-4 (Konfiguracija + Infrastruktura)  
- ✅ Upravljajte uvedbe v več okoljih
- ✅ Ustvarite prilagojene infrastrukturne predloge Bicep
- ✅ Implementirajte varne vzorce avtentikacije

#### Zaključek poglavij 5-6 (Več agentov + Validacija)
- ✅ Uvedite kompleksno rešitev AI z več agenti
- ✅ Izvedite načrtovanje zmogljivosti in optimizacijo stroškov
- ✅ Implementirajte avtomatizirano validacijo pred uvedbo

#### Zaključek poglavij 7-8 (Odpravljanje težav + Produkcija)
- ✅ Samostojno odpravljajte težave pri uvedbi  
- ✅ Implementirajte podjetniško spremljanje in varnost
- ✅ Uvedite aplikacije, pripravljene za produkcijo, z upravljanjem

### Certifikacija in priznanje
- **Značka za dokončanje tečaja**: Zaključite vseh 8 poglavij s praktično validacijo
- **Priznanje skupnosti**: Aktivno sodelovanje v Discord skupnosti Azure AI Foundry
- **Profesionalni razvoj**: Veščine, relevantne za uvedbo AZD in AI
- **Napredovanje v karieri**: Zmožnosti za uvedbo aplikacij, pripravljenih za podjetja

## Primernost vsebine za sodobne razvijalce

### Tehnična globina in pokritost
- **Integracija Azure OpenAI**: Popolna pokritost GPT-4o, vgrajenih modelov in uvedb z več modeli
- **Vzorci AI arhitekture**: Implementacije RAG, orkestracija več agentov in produkcijski delovni tokovi AI
- **Infrastruktura kot koda**: Predloge Bicep, uvedbe ARM in avtomatizirano zagotavljanje virov
- **Pripravljenost za produkcijo**: Varnost, skaliranje, spremljanje, optimizacija stroškov in upravljanje
- **Podjetniški vzorci**: Uvedbe v več okoljih, integracija CI/CD in skladnost s predpisi

### Praktična osredotočenost na učenje
- **Avtomatizacija uvedbe**: Poudarek na praktičnih delovnih tokovih AZD, ne na teoretičnih konceptih
- **Scenariji iz resničnega sveta**: Celotna rešitev za maloprodajo z več agenti, vključno z agenti za stranke in zaloge
- **Produkcijski primeri**: Paketi ARM predlog, uvedbe z enim klikom in podjetniški vzorci
- **Veščine odpravljanja težav**: Specifično odpravljanje težav pri AI, diagnostika več storitev in optimizacija zmogljivosti
- **Relevanca za industrijo**: Temelji na povratnih informacijah skupnosti Azure AI Foundry in zahtevah podjetij

### Integracija skupnosti in podpore
- **Integracija Discord**: Aktivno sodelovanje v skupnostih Azure AI Foundry in Microsoft Azure
- **Razprave na GitHubu**: Sodelovalno učenje in reševanje težav s kolegi in strokovnjaki
- **Dostop do strokovnjakov**: Neposredna povezava z Microsoftovimi inženirji in strokovnjaki za uvedbo AI
- **Nenehne posodobitve**: Vsebina tečaja se razvija z posodobitvami platforme Azure in povratnimi informacijami skupnosti
- **Razvoj kariere**: Veščine, neposredno uporabne za sodobne vloge v oblaku in AI razvoju

### Validacija učnih rezultatov
- **Merljive veščine**: Vsako poglavje vključuje praktične vaje za uvedbo z preverljivimi rezultati
- **Razvoj portfelja**: Dokončani projekti, primerni za profesionalne portfelje in razgovore za službo
- **Priznanje v industriji**: Veščine so skladne s trenutnimi zahtevami trga dela za AZD in uvedbo AI
- **Profesionalna mreža**: Dostop do skupnosti razvijalcev Azure za napredovanje v karieri in sodelovanje

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
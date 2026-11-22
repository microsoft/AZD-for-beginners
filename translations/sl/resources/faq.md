# Pogosto zastavljena vprašanja (FAQ)

**Pomoč po poglavjih**
- **📚 Domov za tečaj**: [AZD Za začetnike](../README.md)
- **🚆 Težave z namestitvijo**: [Poglavje 1: Namestitev in nastavitev](../docs/chapter-01-foundation/installation.md)
- **🤖 Vprašanja o AI**: [Poglavje 2: Razvoj z AI na prvem mestu](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Reševanje težav**: [Poglavje 7: Reševanje težav in odpravljanje napak](../docs/chapter-07-troubleshooting/common-issues.md)

## Uvod

Ta obsežen FAQ ponuja odgovore na najpogostejša vprašanja o Azure Developer CLI (azd) in uvajanju v Azure. Poiščite hitre rešitve za običajne težave, spoznajte najboljše prakse in pridobite pojasnila o konceptih in potekih dela azd.

## Cilji učenja

S pregledom tega FAQ boste:
- Hitro našli odgovore na pogosta vprašanja in težave Azure Developer CLI
- Razumeli ključne koncepte in terminologijo skozi praktično obliko vprašanja in odgovora
- Dostopali do rešitev za pogosto pojavljajoče se težave in scenarije napak
- Spoznali najboljše prakse preko pogosto zastavljenih vprašanj o optimizaciji
- Odkrijte napredne funkcije in zmogljivosti preko vprašanj na strokovni ravni
- Učinkovito referencirali smernice stroškov, varnosti in strategije uvajanja

## Rezultati učenja

Z rednim sklicevanjem na ta FAQ boste lahko:
- Samostojno reševali pogoste težave Azure Developer CLI z uporabo ponujenih rešitev
- Sprejemali informirane odločitve o strategijah uvajanja in konfiguracijah
- Razumeli povezavo med azd in drugimi orodji ter storitvami Azure
- Uporabljali najboljše prakse na podlagi izkušenj skupnosti in strokovnih priporočil
- Učinkovito reševali težave z avtentikacijo, uvajanjem in konfiguracijo
- Optimizirali stroške in zmogljivost z vpogledi in priporočili iz FAQ

## Kazalo vsebine

- [Začetek](#getting-started)
- [Avtentikacija in dostop](#authentication--access)
- [Predloge in projekti](#templates--projects)
- [Uvajanje in infrastruktura](#deployment--infrastructure)
- [Konfiguracija in okolja](#configuration--environments)
- [Reševanje težav](#troubleshooting)
- [Stroški in obračunavanje](#cost--billing)
- [Najboljše prakse](#best-practices)
- [Napredne teme](#advanced-topics)

---

## Začetek

### V: Kaj je Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) je ukazna vrstica, osredotočena na razvijalca, ki pospeši čas, ki ga potrebujete, da svojo aplikacijo pripeljete iz lokalnega razvojnega okolja v Azure. Ponuja najboljše prakse preko predlog in pomaga skozi celoten življenjski cikel uvajanja.

### V: Kako se azd razlikuje od Azure CLI?
**O**: 
- **Azure CLI**: Splošno orodje za upravljanje virov Azure
- **azd**: Orodje osredotočeno na razvijalce za poteke uvajanja aplikacij
- azd ima lastna poteka avtentikacije in uvajanja; Azure CLI je ločeno, dopolnilno orodje
- azd vključuje predloge, upravljanje okolij in avtomatizacijo uvajanja

### V: Ali moram imeti nameščen Azure CLI, da uporabim azd?
**O**: Ne za osnovni potek dela AZD. Avtenticirajte se z `azd auth login`. Azure CLI namestite ločeno, ko predloga ali vaja izrecno izvaja ukaze `az`.

### V: Kateri programski jeziki so podprti v azd?
**O**: azd je neodvisen od jezika. Deluje z:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statične spletne strani
- Kontejnerizirane aplikacije

### V: Ali lahko uporabim azd z obstoječimi projekti?
**O**: Da! Lahko:
1. Uporabite `azd init` za dodajanje konfiguracije azd v obstoječe projekte
2. Prilagodite obstoječe projekte, da ustrezajo strukturi azd predloge
3. Ustvarite lastne predloge na osnovi vaše obstoječe arhitekture

### V: Kaj se je spremenilo z generalno razpoložljivostjo razširitve Foundry?
**O**: Paket `microsoft.foundry` je dosegel različico 1.0 in GA 5. novembra 2026. Z AZD 1.37.0+ uporabite `azd ext install microsoft.foundry` za namestitev sedmih osnovnih razširitev za agente, povezave, inšpektorja, projekte, rutine, veščine in orodnjak. Ni nov ukazni prostor in njegove komponente imajo neodvisne različice. Ocene, podatkovni sklopi, fino prilagajanje in lastni modeli se nameščajo ločeno; neobvezne funkcije v predogledu ne postanejo GA samo zato, ker je paket GA.

Sprehod [hosted-agent](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) uporablja Python 3.13+ in trenutno uv. `azd ai agent run` odpre Agent Inspector lokalno, vendar klice modela še vedno uporabljajo Azure in povzročajo stroške. Koda-način `azd deploy` naloži izvorno kodo za oddaljeno gradnjo brez potrebe po lokalni izgradnji kontejnerja.

### Vprašanje: Ali `azd down` odstrani hosted agent iz obstoječega Foundry projekta?
**Odgovor**: Ne za pot z ponovno uporabo projekta, opisano v hosted-agent hitrem začetku: pusti projekt, hosted agent in druge vire na mestu. Odstranite nezaželene vire posebej, brez brisanja skupnih virov. Če je okolje ustvarilo nov Foundry projekt, `azd down` izbriše njegovo skupino virov in vse v njej. Pred potrditvijo preglejte [navodila za čiščenje](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) in pozive za brisanje.

---

## Preverjanje pristnosti in dostop

### Vprašanje: Kako se preverim z Azure z uporabo azd?
**Odgovor**: Uporabite `azd auth login`, ki bo odprl brskalnik za Azure preverjanje pristnosti. Za scenarije CI/CD uporabite servisne principe ali upravljane identitete.

### Vprašanje: Ali lahko uporabim azd z več Azure naročninami?
**Odgovor**: Da. Uporabite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` za določitev, katero naročnino uporabiti za vsak okolje.

### Vprašanje: Katere dovoljenja potrebujem za namestitev z azd?
**Odgovor**: Običajno potrebujete:
- vlogo **Contributor** na skupini virov ali naročnini
- vlogo **User Access Administrator** če nameščate vire, ki zahtevajo dodelitve vlog
- Specifična dovoljenja se razlikujejo glede na predlogo in nameščene vire

### Vprašanje: Ali lahko uporabim azd v CI/CD cevovodih?
**Odgovor**: Seveda! azd je zasnovan za integracijo v CI/CD. Uporabite servisne principe za preverjanje pristnosti in nastavite spremenljivke okolja za konfiguracijo.

### Vprašanje: Kako upravljam preverjanje pristnosti v GitHub Actions?
**Odgovor**: Priporočamo federacijo identitete delovne obremenitve (OIDC), nastavljeno z `azd pipeline config`. Ustvarjen potek dela namesti AZD in preveri AZD neposredno s federirano identiteto. Samo korak `azure/login` ne vzpostavi AZD prijave. Korak prijave v obstoječem opravilu je:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Po prijavi izvedite namestitev ali implementacijo z ustreznim AZD okoljem, naročnino in lokacijo. Federirani certifikat identitete mora zaupati repozitoriju/refu poteka dela ali GitHub okolju, pravice Azure vlog pa morajo dovoljevati zahtevane operacije.

---

## Predloge in Projekti

### Vprašanje: Kje najdem azd predloge?
**Odgovor**: 
- Uradne in skupnostne predloge: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Skupnostne predloge: Iskanje na GitHub za "azd-template"
- Uporabite `azd template list` za pregled razpoložljivih predlog

### Vprašanje: Kako ustvarim lastno predlogo?
**Odgovor**: 
1. Začnite z obstoječo strukturo predloge
2. Spremenite `azure.yaml`, infrastrukturo in aplikacijsko kodo
3. Temeljito testirajte z `azd up`
4. Objavite na GitHub s primernimi oznakami

### Vprašanje: Ali lahko uporabim azd brez predloge?
**Odgovor**: Da, uporabite `azd init` v obstoječem projektu za ustvarjanje potrebnih konfiguracijskih datotek. Ročno boste morali nastaviti `azure.yaml` in datoteke infrastrukture.

### Vprašanje: Kakšna je razlika med uradnimi in skupnostnimi predlogami?
**Odgovor**: 
- **Uradne predloge**: Vzdržuje Microsoft, redno posodabljane, obsežna dokumentacija
- **Skupnostne predloge**: Ustvarjene s strani razvijalcev, lahko imajo specializirane primere uporabe, raznolika kakovost in vzdrževanje

### Vprašanje: Kako posodobim predlogo v svojem projektu?
**Odgovor**: Predloge se ne posodabljajo samodejno. Lahko:
1. Ročno primerjate in združujete spremembe iz izvorne predloge
2. Začnete na novo z `azd init` z uporabo posodobljene predloge
3. Izberete specifične izboljšave iz posodobljenih predlog

---

## Namestitev in Infrastruktura

### Vprašanje: Katere Azure storitve lahko azd namesti?
**Odgovor**: azd lahko namesti katerokoli Azure storitev preko Bicep/ARM predlog, vključno z:
- App Services, Container Apps, Functions
- Baze podatkov (SQL, PostgreSQL, Cosmos DB)
- Shramba, Key Vault, Application Insights
- Omrežne, varnostne in nadzorne vire

### Vprašanje: Ali lahko nameščam v več regijah?
**Odgovor**: Da, konfigurirajte več regij v svojih Bicep predlogah in ustrezno nastavite parameter lokacije za vsak okolje.

### Vprašanje: Kako upravljam migracije sheme baze podatkov?
**Odgovor**: Uporabite namestitvene kuke v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Vprašanje: Ali lahko namestim samo infrastrukturo brez aplikacij?
**Odgovor**: Da, uporabite `azd provision` za namestitev le komponent infrastrukture, definiranih v vaših predlogah.

### Vprašanje: Kako namestim v obstoječe Azure vire?
**Odgovor**: Da, če predloga to podpira. Sklicujte se na obstoječe vire s Bicepjevimi `existing` deklaracijami ali z dokumentiranimi parametri predloge za obstoječe vire in usmerite aplikacijske storitve k njihovim ciljem. To ne uvaža lastništva ali samodejno ustvari manjkajočih dovoljenj. Pred namestitvijo preglejte predlogo.

### Vprašanje: Ali lahko namesto Bicep uporabim Terraform?
**Odgovor**: Da. AZD podpira Terraform in Bicep. Izberite predlogo na osnovi Terraform ali konfigurirajte `infra.provider: terraform` v `azure.yaml`, z ustreznimi Terraform datotekami in konfiguracijo stanja/backend-a. Oglejte si [Terraform potek dela](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguracija in Okolja

### Vprašanje: Kako upravljam različna okolja (dev, staging, prod)?
**Odgovor**: Ustvarite ločena okolja z `azd env new <environment-name>` in konfigurirajte različne nastavitve za vsako:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Vprašanje: Kje so shranjene konfiguracije okolij?
**Odgovor**: V mapi `.azure` znotraj vaše projektne mape. Vsako okolje ima svojo mapo s konfiguracijskimi datotekami.

### Vprašanje: Kako nastavim konfiguracijo, specifično za okolje?
**Odgovor**: Uporabite `azd env set` za nastavitev okoljskih spremenljivk:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Vprašanje: Ali lahko delim konfiguracije okolij med člani ekipe?
**Odgovor**: Mapa `.azure` vsebuje občutljive podatke in jih ni priporočljivo oddajati v nadzor verzij. Namesto tega:
1. Dokumentirajte potrebne okoljske spremenljivke
2. Uporabite namestitvene skripte za nastavitev okolij
3. Uporabite Azure Key Vault za občutljivo konfiguracijo

### Vprašanje: Kako preglasim privzete vrednosti v predlogah?
**Odgovor**: Nastavite okoljske spremenljivke, ki ustrezajo parametrom predloge:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Le spremenljivke, ki jih porabi predloga, vplivajo na namestitev. `SKU_NAME` zgoraj je primer prilagojenega vnosa, ne univerzalna nastavitev AZD.

---

## Odpravljanje težav

### Vprašanje: Zakaj `azd up` ne uspeva?
**Odgovor**: Pogoste težave:
1. **Težave s preverjanjem pristnosti**: Zaženite `azd auth login`
2. **Nezadostna dovoljenja**: Preverite svoje Azure dodelitve vlog
3. **Sukobi imen virov**: Preglejte konfliktni vir in vhodne parametre imen predloge; ustvarite ločeno okolje z `azd env new`, ko je potrebna izolacija
4. **Težave s kvotami/kapaciteto**: Preverite regionalno razpoložljivost
5. **Napake v predlogi**: Validirajte Bicep predloge

### Vprašanje: Kako odpravljam napake namestitve?
**Odgovor**: 
1. Uporabite `azd deploy --debug` za podroben izpis
2. Preverite zgodovino namestitev v Azure portalu
3. Preglejte dnevnik dejavnosti v Azure portalu
4. Uporabite `azd show` za prikaz trenutnega stanja okolja

### Vprašanje: Zakaj moje okoljske spremenljivke ne delujejo?
**Odgovor**: Preverite:
1. Imena spremenljivk natančno ustrezajo parametrom v predlogi
2. Vrednosti so pravilno navedene, če vsebujejo presledke
3. Izbrano je okolje: `azd env select <environment>`
4. Spremenljivke so nastavljene v pravilnem okolju

### Vprašanje: Kako očistim neuspešne namestitve?
**Odgovor**: 
```bash
azd down
```
Najprej preglejte izbrano okolje in potrditev brisanja. To izbriše zagotovljene Azure vire, ne lokalne konfiguracije okolja `.azure`. `--purge` dodatno zahteva trajno brisanje podprtih mehko izbrisanih virov in lahko je blokiran s strani varovanja zadrževanja/brisanja; ni rutinski korak za obnovitev.

### Vprašanje: Zakaj moja aplikacija ni dostopna po namestitvi?
**Odgovor**: Preverite:
1. Namestitev je bila uspešno zaključena
2. Aplikacija teče (preverite dnevnike v Azure portalu)
3. Omrežne varnostne skupine dovoljujejo promet
4. DNS/lastne domene so pravilno konfigurirane

---

## Stroški in obračunavanje

### Vprašanje: Koliko bodo stali azd namestitve?
**Odgovor**: Stroški so odvisni od:
- namestenih Azure storitev
- izbranih nivojev storitev/SKUjev
- regionalnih cenovnih razlik
- vzorcev uporabe

Za ocene uporabite [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/).

### Vprašanje: Kako nadzorujem stroške pri azd namestitvah?
**Odgovor**: 
1. Uporabite nižje nivoje SKUjev za razvojna okolja
2. Nastavite proračune in opozorila v Azure
3. Uporabite `azd down` za odstranitev virov, ko niso potrebni
4. Izberite ustrezne regije (stroški se razlikujejo glede na lokacijo)
5. Uporabite orodja za upravljanje stroškov Azure

### Vprašanje: Ali so na voljo brezplačne možnosti za azd predloge?
**Odgovor**: Nekatere storitve imajo brezplačne SKJe ali mesečne kredite, odvisno od upravičenosti, gostiteljskega načrta, regije in omejitev naročnine. Te ne naredijo celotne predloge brezplačne: baze podatkov, iskanje, omrežje, register, telemetrija in sklepanje modelov lahko neodvisno povzročajo stroške. Pred namestitvijo preverite [seznam brezplačnih storitev Azure](https://azure.microsoft.com/free/) in trenutno ceno vsakega vira.

### Vprašanje: Kako ocenim stroške pred namestitvijo?
**Odgovor**: 
1. Preglejte `main.bicep` predloge, da vidite, kateri viri so ustvarjeni
2. Uporabite Azure Pricing Calculator z določenimi SKJi
3. Najprej namestite v razvojno okolje za spremljanje dejanskih stroškov
4. Uporabite Azure Cost Management za podrobno analizo stroškov

---

## Najboljše prakse

### Vprašanje: Katere so najboljše prakse za strukturo azd projekta?
**Odgovor**: 
1. Ločite aplikacijsko kodo od infrastrukture
2. Uporabljajte smiselna imena storitev v `azure.yaml`
3. Izvedite pravilno upravljanje napak v gradbenih skriptah
4. Uporabljajte konfiguracije, specifične za okolje
5. Vključite obsežno dokumentacijo

### Vprašanje: Kako naj organiziram več storitev v azd?
**Odgovor**: Uporabite priporočeno strukturo:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Vprašanje: Ali naj predal `.azure` vključim v nadzor različic?
**Odgovor**: **Ne!** Predal `.azure` vsebuje občutljive podatke. Dodajte ga v `.gitignore`:
```gitignore
.azure/
```

### Vprašanje: Kako naj upravljam skrivnosti in občutljivo konfiguracijo?
**Odgovor**: 
1. Uporabljajte Azure Key Vault za skrivnosti
2. V konfiguraciji aplikacije sklicujte skrivnosti Key Vaulta
3. Nikoli ne vključite skrivnosti v nadzor različic
4. Uporabljajte upravljane identitete za avtentikacijo med storitvami

### Vprašanje: Kakšen je priporočeni pristop k CI/CD z azd?
**Odgovor**: 
1. Uporabljajte ločena okolja za vsako fazo (razvoj/test/produkcija)
2. Izvedite avtomatizirano testiranje pred namestitvijo
3. Uporabljajte servisne glavne račune za avtentikacijo
4. Shranjujte občutljivo konfiguracijo kot skrivnosti/spremenljivke v ceveh
5. Uvedite potrditvena vrata za produkcijske namestitve

---

## Napredne teme

### Vprašanje: Ali lahko razširim azd s svojo funkcionalnostjo?
**Odgovor**: Da, preko namestitvenih vtičnikov v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Vprašanje: Kako integriram azd z obstoječimi DevOps procesi?
**Odgovor**: 
1. Uporabljajte azd ukaze v obstoječih skriptah cevovoda
2. Standardizirajte uporabo azd predlog v ekipah
3. Integrirajte z obstoječim nadzorom in alarmiranjem
4. Uporabljajte azd JSON izhod za integracijo cevovoda

### Vprašanje: Ali lahko uporabim azd z Azure DevOps?
**Odgovor**: Da, azd deluje z vsakim CI/CD sistemom. Ustvarite Azure DevOps cevovode, ki uporabljajo azd ukaze.

### Vprašanje: Kako prispevam k azd ali ustvarim skupnostne predloge?
**Odgovor**: 
1. **azd orodje**: prispevajte v [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Predloge**: sledite [navodilom za prispevek Awesome AZD galerije](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentacija**: prispevajte v dokumentacijo na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Vprašanje: Kakšna je razvojna pot azd?
**Odgovor**: Preverite [uradno razvojno pot](https://github.com/Azure/azure-dev/projects) za načrtovane funkcije in izboljšave.

### Vprašanje: Kako migriram z drugih orodij za namestitev na azd?
**Odgovor**: 
1. Analizirajte trenutno arhitekturo namestitve
2. Ustvarite ekvivalentne Bicep predloge
3. Konfigurirajte `azure.yaml`, da ustreza trenutnim storitvam
4. Temeljito testirajte v razvojnem okolju
5. Postopoma migrirajte okolja

---

## Imate še vprašanja?

### **Najprej poiščite**
- Preverite [uradno dokumentacijo](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Preiščite [GitHub prijave](https://github.com/Azure/azure-dev/issues) za podobne težave

### **Poiščite pomoč**
- [GitHub razprave](https://github.com/Azure/azure-dev/discussions) - Podpora skupnosti
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnična vprašanja
- [Azure Discord](https://discord.gg/azure) - Spletni pogovor skupnosti v realnem času

### **Prijavite težave**
- [GitHub težave](https://github.com/Azure/azure-dev/issues/new) - Poročila o hroščih in prošnje za funkcije
- Vključite relevantne dnevnike, sporočila o napakah in korake za ponovitev

### **Izvedite več**
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Tehnična smernica pregledana: 4. november 2026. Razpoložljivost v oblaku in cene je treba preveriti za vašo naročnino in regijo.*

---

**Navigacija**
- **Prejšnja lekcija**: [Slovar](glossary.md)
- **Naslednja lekcija**: [Študijski vodič](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Pogosto zastavljena vprašanja (FAQ)

**Pomoč po poglavjih**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **🚆 Težave z namestitvijo**: [Poglavje 1: Namestitev in nastavitev](../docs/getting-started/installation.md)
- **🤖 Vprašanja o AI**: [Poglavje 2: Razvoj, osredotočen na AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Odpravljanje napak**: [Poglavje 7: Odpravljanje napak in razhroščevanje](../docs/troubleshooting/common-issues.md)

## Uvod

Ta obsežen FAQ vsebuje odgovore na najpogostejša vprašanja o Azure Developer CLI (azd) in razmestitvah v Azure. Najdete hitre rešitve za pogoste težave, razumete najboljše prakse in dobite pojasnila glede konceptov in delovnih tokov azd.

## Cilji učenja

Z branjem tega FAQ boste:
- Hitro našli odgovore na pogosta vprašanja in težave z Azure Developer CLI
- Razumeli ključne koncepte in terminologijo prek praktičnega formata vprašanj in odgovorov
- Dostopali do rešitev za odpravljanje težav pri pogostih napakah in scenarijih
- Spoznali najboljše prakse skozi pogosto zastavljena vprašanja o optimizaciji
- Odkrijete napredne funkcije in zmogljivosti skozi vprašanja na strokovni ravni
- Učinkovito poiskali smernice glede stroškov, varnosti in strategije razmestitve

## Rezultati učenja

Z rednim sklicevanjem na ta FAQ boste lahko:
- Samostojno reševali pogoste težave z Azure Developer CLI z uporabo podanih rešitev
- Sprejemali informirane odločitve o strategijah in nastavitvah razmestitve
- Razumeli razmerje med azd in drugimi orodji ter storitvami Azure
- Uporabili najboljše prakse na podlagi izkušenj skupnosti in strokovnih priporočil
- Učinkovito odpravljali težave z overjanjem, razmestitvijo in konfiguracijo
- Optimizirali stroške in zmogljivost z uporabo vpogledov in priporočil iz FAQ

## Table of Contents

- [Začetek](../../../resources)
- [Avtentikacija & dostop](../../../resources)
- [Predloge & projekti](../../../resources)
- [Razmestitev & infrastruktura](../../../resources)
- [Konfiguracija & okolja](../../../resources)
- [Odpravljanje napak](../../../resources)
- [Stroški & obračunavanje](../../../resources)
- [Priporočene prakse](../../../resources)
- [Napredne teme](../../../resources)

---

## Začetek

### V: Kaj je Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) je orodje ukazne vrstice, osredotočeno na razvijalce, ki pospeši čas, potreben, da vaša aplikacija preide iz lokalnega razvojnega okolja v Azure. Zagotavlja najboljše prakse prek predlog in pomaga v celotnem življenjskem ciklu razmestitve.

### V: Kako se azd razlikuje od Azure CLI?
**O**: 
- **Azure CLI**: Orodje splošnega namena za upravljanje virov Azure
- **azd**: Orodje, osredotočeno na razvijalce, za delovne tokove razmestitve aplikacij
- azd uporablja Azure CLI interno, vendar ponuja višje abstrakcije za pogoste razvojne scenarije
- azd vključuje predloge, upravljanje okolij in avtomatizacijo razmestitve

### V: Ali potrebujem Azure CLI nameščen za uporabo azd?
**O**: Da, azd zahteva Azure CLI za overjanje in nekatere operacije. Najprej namestite Azure CLI, nato azd.

### V: Katere programske jezike podpira azd?
**O**: azd je neodvisen od jezika. Deluje z:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statične spletne strani
- Aplikacije v vsebnikih

### V: Lahko uporabljam azd z obstoječimi projekti?
**O**: Seveda! Lahko:
1. Uporabite `azd init`, da dodate azd konfiguracijo obstoječim projektom
2. Prilagodite obstoječe projekte, da ustrezajo strukturi azd predloge
3. Ustvarite lastne predloge na podlagi vaše obstoječe arhitekture

---

## Avtentikacija & dostop

### V: Kako se avtenticiram v Azure z uporabo azd?
**O**: Uporabite `azd auth login`, ki bo odprl okno brskalnika za avtentikacijo v Azure. Za CI/CD scenarije uporabite service principal-e ali upravljane identitete.

### V: Ali lahko uporabim azd z več Azure naročninami?
**O**: Da. Uporabite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, da določite, katero naročnino uporabljati za vsako okolje.

### V: Katere pravice potrebujem za razmestitev z azd?
**O**: Običajno potrebujete:
- **Contributor** vlogo na skupini virov ali naročnini
- **User Access Administrator**, če razmestite vire, ki zahtevajo dodelitve vlog
- Specifična dovoljenja se razlikujejo glede na predlogo in razporejene vire

### V: Ali lahko uporabljam azd v CI/CD cevovodih?
**O**: Absolutno! azd je zasnovan za integracijo v CI/CD. Uporabite service principal-e za overjanje in nastavite spremenljivke okolja za konfiguracijo.

### V: Kako upravljam avtentikacijo v GitHub Actions?
**O**: Uporabite Azure Login action z poverilnicami service principala:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Predloge & projekti

### V: Kje najdem azd predloge?
**O**: 
- Uradne predloge: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Predloge skupnosti: Poiščite na GitHubu "azd-template"
- Uporabite `azd template list` za pregled razpoložljivih predlog

### V: Kako ustvarim lastno predlogo?
**O**: 
1. Začnite z obstoječo strukturo predloge
2. Spremenite `azure.yaml`, infrastrukturne datoteke in kodo aplikacije
3. Temeljito testirajte z `azd up`
4. Objavite na GitHub z ustreznimi oznakami

### V: Ali lahko uporabljam azd brez predloge?
**O**: Da, uporabite `azd init` v obstoječem projektu, da ustvarite potrebne konfiguracijske datoteke. Ročno boste morali konfigurirati `azure.yaml` in infrastrukturne datoteke.

### V: Kakšna je razlika med uradnimi in predlogami skupnosti?
**O**: 
- **Uradne predloge**: Vzdržuje Microsoft, redno posodobljene, obsežna dokumentacija
- **Predloge skupnosti**: Ustvarjene s strani razvijalcev, lahko specializirane, različno kakovostno vzdrževanje

### V: Kako posodobim predlogo v mojem projektu?
**O**: Predloge se ne posodabljajo samodejno. Lahko:
1. Ročno primerjate in združite spremembe iz izvorne predloge
2. Začnete znova z `azd init` z uporabo posodobljene predloge
3. Izberete posamezne izboljšave iz posodobljenih predlog

---

## Razmestitev & infrastruktura

### V: Katere Azure storitve lahko azd razmesti?
**O**: azd lahko razmesti katerokoli Azure storitev prek Bicep/ARM predlog, vključno z:
- App Services, Container Apps, Functions
- Podatkovnimi bazami (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Omrežjem, varnostjo in orodji za nadzor

### V: Ali lahko razmestim v več regijah?
**O**: Da, konfigurirajte več regij v vaših Bicep predlogah in ustrezno nastavite parameter location za vsako okolje.

### V: Kako upravljam migracije sheme podatkovne baze?
**O**: Uporabite deployment hooks v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### V: Ali lahko razmestim samo infrastrukturo brez aplikacij?
**O**: Da, uporabite `azd provision`, da razmestite samo infrastrukturne komponente, definirane v vaših predlogah.

### V: Kako razmestim na obstoječe Azure vire?
**O**: To je kompleksno in ni neposredno podprto. Lahko:
1. Uvozite obstoječe vire v vaše Bicep predloge
2. Uporabite reference na obstoječe vire v predlogah
3. Spremenite predloge, da pogojno ustvarjajo ali referencirajo vire

### V: Ali lahko uporabljam Terraform namesto Bicep?
**O**: Trenutno azd primarno podpira Bicep/ARM predloge. Podpora za Terraform ni uradno na voljo, vendar lahko obstajajo rešitve skupnosti.

---

## Konfiguracija & okolja

### V: Kako upravljam različna okolja (dev, staging, prod)?
**O**: Ustvarite ločena okolja z `azd env new <environment-name>` in konfigurirajte različne nastavitve za vsako:
```bash
azd env new development
azd env new staging  
azd env new production
```

### V: Kje se shranjujejo konfiguracije okolij?
**O**: V mapi `.azure` znotraj vašega projektnega imenika. Vsako okolje ima svojo mapo z konfiguracijskimi datotekami.

### V: Kako nastavim konfiguracijo, specifično za okolje?
**O**: Uporabite `azd env set` za konfiguracijo spremenljivk okolja:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### V: Ali lahko delim konfiguracije okolja med člani ekipe?
**O**: Mapa `.azure` vsebuje občutljive informacije in je ne smete vnašati v sistem za nadzor različic. Namesto tega:
1. Dokumentirajte zahtevane spremenljivke okolja
2. Uporabite skripte za razmestitev za nastavitev okolij
3. Uporabite Azure Key Vault za občutljive konfiguracije

### V: Kako preglasim privzete nastavitve predloge?
**O**: Nastavite spremenljivke okolja, ki ustrezajo parametrom predloge:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Odpravljanje napak

### V: Zakaj se `azd up` ne uspe?
**O**: Pogosti vzroki:
1. **Težave z avtentikacijo**: Zaženite `azd auth login`
2. **Nezadostne pravice**: Preverite dodelitve vlog v Azure
3. **Konflikti pri poimenovanju virov**: Spremenite AZURE_ENV_NAME
4. **Omejitve/kapaciteta**: Preverite razpoložljivost po regijah
5. **Napake v predlogah**: Validirajte Bicep predloge

### V: Kako razhroščim neuspehe razmestitve?
**O**: 
1. Uporabite `azd deploy --debug` za podrobnejši izpis
2. Preverite zgodovino razmestitev v Azure portalu
3. Preglejte Activity Log v Azure portalu
4. Uporabite `azd show` za prikaz trenutnega stanja okolja

### V: Zakaj moje spremenljivke okolja ne delujejo?
**O**: Preverite:
1. Imena spremenljivk se natančno ujemajo s parametri predloge
2. Vrednosti so ustrezno zapisane v narekovajih, če vsebujejo presledke
3. Izbrano je pravo okolje: `azd env select <environment>`
4. Spremenljivke so nastavljene v pravem okolju

### V: Kako očistim neuspešne razmestitve?
**O**: 
```bash
azd down --force --purge
```
To odstrani vse vire in konfiguracijo okolja.

### V: Zakaj moja aplikacija ni dostopna po razmestitvi?
**O**: Preverite:
1. Ali je razmestitev uspešno zaključena
2. Ali aplikacija teče (preverite dnevnike v Azure portalu)
3. Ali omrežne varnostne skupine dovolijo promet
4. Ali so DNS/lastne domene pravilno konfigurirane

---

## Stroški & obračunavanje

### V: Koliko bodo stali azd razmestitve?
**O**: Stroški so odvisni od:
- Azure storitev, ki so razmeščene
- Izbranih nivojev storitev/SKU-jev
- Cenovnih razlik med regijami
- Vzorcev uporabe

Uporabite [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) za ocene.

### V: Kako nadziram stroške pri azd razmestitvah?
**O**: 
1. Uporabite nižji razred SKU-jev za razvojna okolja
2. Nastavite Azure proračune in opozorila
3. Uporabite `azd down`, da odstranite vire, ko niso potrebni
4. Izberite primerne regije (stroški se razlikujejo glede na lokacijo)
5. Uporabite orodja Azure Cost Management

### V: Ali obstajajo brezplačne možnosti za azd predloge?
**O**: Veliko Azure storitev nudi brezplačne sloje:
- App Service: na voljo brezplačen sloj
- Azure Functions: 1M brezplačnih izvedb/mesec
- Cosmos DB: brezplačen sloj z 400 RU/s
- Application Insights: prvih 5GB/mesec brezplačno

Konfigurirajte predloge, da kjer je mogoče uporabijo brezplačne sloje.

### V: Kako ocenim stroške pred razmestitvijo?
**O**: 
1. Preglejte `main.bicep` v predlogi, da vidite, kateri viri se ustvarijo
2. Uporabite Azure Pricing Calculator z določenimi SKU-ji
3. Najprej razmestite v razvojno okolje za spremljanje dejanskih stroškov
4. Uporabite Azure Cost Management za podrobno analizo stroškov

---

## Priporočene prakse

### V: Katere so najboljše prakse za strukturo azd projekta?
**O**: 
1. Ločite kodo aplikacije od infrastrukture
2. Uporabite smiselna imena storitev v `azure.yaml`
3. Implementirajte ustrezno obravnavo napak v skriptah za gradnjo
4. Uporabite konfiguracijo specifično za okolje
5. Vključite obsežno dokumentacijo

### V: Kako naj organiziram več storitev v azd?
**O**: Uporabite priporočeno strukturo:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### V: Ali naj zabeležim mapo `.azure` v sistem za nadzor različic?
**O**: **Ne!** Mapa `.azure` vsebuje občutljive informacije. Dodajte jo v `.gitignore`:
```gitignore
.azure/
```

### V: Kako ravnam s skrivnostmi in občutljivo konfiguracijo?
**O**: 
1. Uporabite Azure Key Vault za skrivnosti
2. Referencirajte skrivnosti Key Vault v konfiguraciji aplikacije
3. Nikoli ne vnašajte skrivnosti v sistem za nadzor različic
4. Uporabite upravljane identitete za avtentikacijo med storitvami

### V: Kakšen je priporočeni pristop za CI/CD z azd?
**O**: 
1. Uporabite ločena okolja za vsako fazo (dev/staging/prod)
2. Implementirajte avtomatizirane teste pred razmestitvijo
3. Uporabite service principal-e za overjanje
4. Shranjujte občutljivo konfiguracijo v skrivnostih/spremenljivkah cevovoda
5. Uvedite odobritvena vrata za produkcijske razmestitve

---

## Napredne teme

### V: Ali lahko razširim azd s prilagojeno funkcionalnostjo?
**O**: Da, preko deployment hook-ov v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### V: Kako integriram azd z obstoječimi DevOps procesi?
**O**: 
1. Uporabite azd ukaze v obstoječih skriptah cevovodov
2. Standardizirajte azd predloge v celotni ekipi
3. Integrirajte z obstoječim nadzorom in opozarjanjem
4. Uporabite JSON izhod azd za integracijo v cevovode

### V: Ali lahko uporabljam azd z Azure DevOps?
**O**: Da, azd deluje z katerimkoli CI/CD sistemom. Ustvarite Azure DevOps pipeline-e, ki uporabljajo azd ukaze.

### V: Kako prispevati k azd ali ustvariti predloge skupnosti?
**O**:
1. **azd orodje**: Prispevajte v [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Predloge**: Ustvarite predloge v skladu s [smernicami za predloge](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentacija**: Prispevajte k dokumentaciji na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: What's the roadmap for azd?
**A**: Check the [official roadmap](https://github.com/Azure/azure-dev/projects) for planned features and improvements.

### Q: How do I migrate from other deployment tools to azd?
**A**: 
1. Analyze current deployment architecture
2. Create equivalent Bicep templates
3. Configure `azure.yaml` to match current services
4. Test thoroughly in development environment
5. Gradually migrate environments

---

## Imate še vprašanja?

### **Najprej poiščite**
- Preverite [uradno dokumentacijo](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Poiščite [GitHub issues](https://github.com/Azure/azure-dev/issues) za podobne težave

### **Poiščite pomoč**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Podpora skupnosti
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnična vprašanja
- [Azure Discord](https://discord.gg/azure) - Pogovor skupnosti v realnem času

### **Prijavite težave**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Poročila o napakah in predlogi za funkcije
- Priložite ustrezne dnevnike, sporočila o napakah in korake za reprodukcijo

### **Izvedite več**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Ta pogosta vprašanja se redno posodabljajo. Zadnja posodobitev: 9. september 2025*

---

**Navigacija**
- **Prejšnja lekcija**: [Pojmovnik](glossary.md)
- **Naslednja lekcija**: [Študijski vodič](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za strojno prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvornem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Nismo odgovorni za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
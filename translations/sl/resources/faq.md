# Pogosto zastavljena vprašanja (FAQ)

**Pomoč po poglavjih**
- **📚 Domovska stran tečaja**: [AZD za začetnike](../README.md)
- **🚆 Težave z namestitvijo**: [Poglavje 1: Namestitev in nastavitev](../docs/chapter-01-foundation/installation.md)
- **🤖 Vprašanja o AI**: [Poglavje 2: AI-prvi razvoj](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Odpravljanje težav**: [Poglavje 7: Odpravljanje težav in razhroščevanje](../docs/chapter-07-troubleshooting/common-issues.md)

## Uvod

Ta obsežen FAQ nudi odgovore na najpogostejša vprašanja o Azure Developer CLI (azd) in implementacijah Azure. Najdite hitre rešitve za pogoste težave, spoznajte najboljše prakse in pridobite pojasnila o konceptih in delovnih procesih azd.

## Cilji učenja

Z ogledom tega FAQ boste:
- Našli hitre odgovore na pogosta vprašanja in težave z Azure Developer CLI
- Razumeli ključne koncepte in terminologijo prek praktičnega formata vprašanj in odgovorov
- Dostopali do rešitev za odpravljanje težav pri pogostih problemih in napakah
- Spoznali najboljše prakse prek pogosto zastavljenih vprašanj o optimizaciji
- Odkrijte napredne funkcije in zmogljivosti prek strokovnih vprašanj
- Učinkovito se sklicujte na smernice glede stroškov, varnosti in strategije implementacije

## Rezultati učenja

Z rednim sklicevanjem na ta FAQ boste sposobni:
- Samostojno reševati pogoste težave z Azure Developer CLI z uporabo ponujenih rešitev
- Sprejemati informirane odločitve o strategijah in konfiguracijah implementacije
- Razumeti povezavo med azd in drugimi orodji ter storitvami Azure
- Uporabiti najboljše prakse na podlagi izkušenj skupnosti in strokovnih priporočil
- Učinkovito odpravljati težave z avtentikacijo, implementacijo in konfiguracijo
- Optimizirati stroške in zmogljivost z vpogledi in priporočili FAQ

## Kazalo

- [Prvi koraki](#getting-started)
- [Avtentikacija in dostop](#authentication--access)
- [Predloge in projekti](#templates--projects)
- [Implementacija in infrastruktura](#deployment--infrastructure)
- [Konfiguracija in okolja](#configuration--environments)
- [Odpravljanje težav](#troubleshooting)
- [Stroški in zaračunavanje](#cost--billing)
- [Najboljše prakse](#best-practices)
- [Napredne teme](#advanced-topics)

---

## Prvi koraki

### Vprašanje: Kaj je Azure Developer CLI (azd)?
**Odgovor**: Azure Developer CLI (azd) je razvojno usmerjeno ukazno orodje, ki pospeši čas, potreben, da vašo aplikacijo pripeljete iz lokalnega razvojnega okolja v Azure. Ponuja najboljše prakse preko predlog in pomaga skozi celoten življenjski cikel implementacije.

### Vprašanje: Kako se azd razlikuje od Azure CLI?
**Odgovor**:
- **Azure CLI**: Orodje splošnega namena za upravljanje Azure virov
- **azd**: Orodje osredotočeno na razvijalce za delovne procese implementacije aplikacij
- azd ima lasten proces avtentikacije in implementacije; Azure CLI je ločeno, dopolnjujoče orodje
- azd vključuje predloge, upravljanje okolja in avtomatizacijo implementacije

### Vprašanje: Ali potrebujem nameščen Azure CLI za uporabo azd?
**Odgovor**: Ne za osnovni potek dela AZD. Avtenticirajte se z `azd auth login`. Namestite Azure CLI ločeno, kadar projekt ali vaja izrecno uporabljata ukaze `az`.

### Vprašanje: Katere programske jezike podpira azd?
**Odgovor**: azd je neodvisen od jezika. Deluje z:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statične spletne strani
- Aplikacije v zabojnikih

### Vprašanje: Ali lahko uporabim azd z obstoječimi projekti?
**Odgovor**: Da! Lahko:
1. Uporabite `azd init` za dodajanje nastavitve azd v obstoječe projekte
2. Prilagodite obstoječe projekte, da ustrezajo strukturi predloge azd
3. Ustvarite lastne predloge na podlagi svoje arhitekture

---

## Avtentikacija in dostop

### Vprašanje: Kako se avtenticirati v Azure z azd?
**Odgovor**: Uporabite `azd auth login`, ki bo odprl brskalnik za avtentikacijo v Azure. Za scenarije CI/CD uporabite servisne uporabnike ali upravljane identitete.

### Vprašanje: Ali lahko uporabim azd z več Azure naročninami?
**Odgovor**: Da. Uporabite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>`, da določite, katero naročnino uporabiti za posamezno okolje.

### Vprašanje: Katere pravice potrebujem za implementacijo z azd?
**Odgovor**: Običajno potrebujete:
- Vlogo **Contributor** v skupini virov ali naročnini
- Vlogo **User Access Administrator**, če implementirate vire, ki zahtevajo dodelitve vlog
- Specifične pravice se razlikujejo glede na predlogo in vire, ki jih implementirate

### Vprašanje: Ali lahko uporabim azd v CI/CD cevovodih?
**Odgovor**: Seveda! azd je zasnovan za integracijo v CI/CD. Za avtentikacijo uporabite servisne uporabnike in nastavite spremenljivke okolja za konfiguracijo.

### Vprašanje: Kako upravljam avtentikacijo v GitHub Actions?
**Odgovor**: Prednostno uporabljajte federacijo identitet delovne obremenitve (OIDC), nastavljeno z `azd pipeline config`. Ustvarjeni delovni proces namesti AZD in neposredno avtenticira AZD z zvezano identiteto. Samo `azure/login` korak ne vzpostavi prijave v AZD. Prijavni korak znotraj obstoječega opravila je:
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

Izvajajte pripravo ali implementacijo po prijavi s pravilno nastavljenim AZD okoljem, naročnino in lokacijo. Federirana pristojnost identitete mora zaupati repozitoriju/odnočju oziroma GitHub okolju delovnega procesa, njene Azure vloge pa morajo dovoljevati zahtevane operacije.

---

## Predloge in projekti

### Vprašanje: Kje lahko najdem predloge za azd?
**Odgovor**:
- Uradne in skupnostne predloge: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Skupnostne predloge: iskanje na GitHubu za "azd-template"
- Uporabite `azd template list` za pregled razpoložljivih predlog

### Vprašanje: Kako ustvarim svojo predlogo?
**Odgovor**:
1. Začnite z obstoječo strukturo predloge
2. Spremenite `azure.yaml`, datoteke infrastrukture in kodo aplikacije
3. Temeljito testirajte z `azd up`
4. Objavite na GitHubu z ustreznimi oznakami

### Vprašanje: Ali lahko uporabim azd brez predloge?
**Odgovor**: Da, uporabite `azd init` v obstoječem projektu za ustvarjanje potrebnih datotek konfiguracije. Nastavitve `azure.yaml` in datoteke infrastrukture boste morali nastaviti ročno.

### Vprašanje: Kakšna je razlika med uradnimi in skupnostnimi predlogami?
**Odgovor**:
- **Uradne predloge**: Vzdržuje Microsoft, redno posodobljene, z obsežno dokumentacijo
- **Skupnostne predloge**: Ustvarjene s strani razvijalcev, lahko imajo specializirane primere uporabe, različno kakovost in vzdrževanje

### Vprašanje: Kako posodobim predlogo v svojem projektu?
**Odgovor**: Predloge se ne posodabljajo samodejno. Lahko:
1. Ročno primerjate in združite spremembe iz vira predloge
2. Začnete znova z `azd init`, ki uporablja posodobljeno predlogo
3. Izberete specifične izboljšave iz posodobljenih predlog

---

## Implementacija in infrastruktura

### Vprašanje: Katere storitve Azure lahko azd implementira?
**Odgovor**: azd lahko implementira katerokoli Azure storitev preko Bicep/ARM predlog, vključno z:
- App Services, Container Apps, Functions
- Baze podatkov (SQL, PostgreSQL, Cosmos DB)
- Shranjevanje, Key Vault, Application Insights
- Omrežne, varnostne in nadzorne vire

### Vprašanje: Ali lahko implementiram v več regijah?
**Odgovor**: Da, v vaših Bicep predlogah nastavite več regij in ustrezno nastavite parameter lokacije za vsako okolje.

### Vprašanje: Kako obravnavam migracije sheme baze podatkov?
**Odgovor**: Uporabite hooks za implementacijo v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Vprašanje: Ali lahko implementiram samo infrastrukturo brez aplikacij?
**Odgovor**: Da, uporabite `azd provision` za implementacijo samo infrastrukturnih komponent, definiranih v predlogah.

### Vprašanje: Kako implementiram v obstoječe Azure vire?
**Odgovor**: Lahko, če to predloga podpira. Sklicujte se na obstoječe vire z Bicepovimi `existing` deklaracijami ali obstoječimi parametri v predlogi in uskladite storitve aplikacij s ciljnimi viri. To ne prenaša lastništva niti samodejno ne ustvarja manjkajočih pravic. Pred implementacijo preglejte predlogo.

### Vprašanje: Ali lahko uporabljam Terraform namesto Bicep?
**Odgovor**: Da. AZD podpira Terraform in Bicep. Izberite predlogo na osnovi Terraform ali konfigurirajte `infra.provider: terraform` v `azure.yaml` z ustreznimi Terraform datotekami in konfiguracijo stanja/backenda. Oglejte si [Terraform potek dela](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguracija in okolja

### Vprašanje: Kako upravljam različna okolja (dev, staging, prod)?
**Odgovor**: Ustvarite ločena okolja z `azd env new <environment-name>` in nastavite različne nastavitve za vsako:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Vprašanje: Kje so shranjene nastavitve okolja?
**Odgovor**: V mapi `.azure` znotraj mape vašega projekta. Vsako okolje ima svojo mapo z datotekami konfiguracije.

### Vprašanje: Kako nastavim konfiguracijo, specifično za okolje?
**Odgovor**: Uporabite `azd env set` za nastavitev spremenljivk okolja:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Vprašanje: Ali lahko delim nastavitve okolja med člani ekipe?
**Odgovor**: Mapa `.azure` vsebuje občutljive podatke in ne sme biti vključena v verzijski nadzor. Namesto tega:
1. Dokumentirajte zahtevane spremenljivke okolja
2. Uporabite skripte za nastavitev okolij
3. Uporabite Azure Key Vault za občutljivo konfiguracijo

### Vprašanje: Kako preglasim privzete vrednosti predloge?
**Odgovor**: Nastavite spremenljivke okolja, ki ustrezajo parametrom predloge:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Samo spremenljivke, ki jih predloga uporablja, vplivajo na implementacijo. `SKU_NAME` zgoraj je primer prilagojenega vnosa, ni univerzalna nastavitev AZD.

---

## Odpravljanje težav

### Vprašanje: Zakaj `azd up` ne uspe?
**Odgovor**: Pogosti vzroki:
1. **Težave z avtentikacijo**: Zaženite `azd auth login`
2. **Nezadostne pravice**: Preverite svoje dodelitve vlog v Azure
3. **Konflikti imen virov**: Preverite nasprotujoče se vire in vhodne podatke za imena v predlogi; kadar je potrebna izolacija, ustvarite ločeno okolje z `azd env new`
4. **Težave s kvotami/kapaciteto**: Preverite razpoložljivost v regijah
5. **Napake v predlogah**: Validirajte Bicep predloge

### Vprašanje: Kako razhroščujem neuspešno implementacijo?
**Odgovor**:
1. Uporabite `azd deploy --debug` za podroben izpis
2. Preverite zgodovino implementacij v Azure portalu
3. Preglejte dnevnik aktivnosti v Azure portalu
4. Uporabite `azd show` za prikaz trenutnega stanja okolja

### Vprašanje: Zakaj moje spremenljivke okolja ne delujejo?
**Odgovor**: Preverite:
1. Da se imena spremenljivk natančno ujemajo s parametri predloge
2. Da so vrednosti pravilno navedene, če vsebujejo presledke
3. Da je okolje izbrano: `azd env select <environment>`
4. Da so spremenljivke nastavljene v pravilnem okolju

### Vprašanje: Kako očistim neuspešne implementacije?
**Odgovor**:
```bash
azd down
```
Najprej preverite izbrano okolje in potrditev brisanja. To izbriše zagotovljene Azure vire, ne pa lokalne konfiguracije okolja `.azure`. `--purge` dodatno zahteva trajno brisanje podprtih mehko izbrisanih virov in lahko blokira zaščita retencije/čiščenja; ni rutinski korak za obnovitev.

### Vprašanje: Zakaj po implementaciji moja aplikacija ni dostopna?
**Odgovor**: Preverite:
1. Da je implementacija uspešno zaključena
2. Da aplikacija teče (preverite dnevnike v Azure portalu)
3. Da omrežne varnostne skupine dovoljujejo promet
4. Da so DNS/lastne domene pravilno nastavljene

---

## Stroški in zaračunavanje

### Vprašanje: Koliko bodo stali azd implementacije?
**Odgovor**: Stroški so odvisni od:
- Implementiranih Azure storitev
- Izbranih storitvenih ravni/SKU-jev
- Regionalnih cenovnih razlik
- Vzorcev uporabe

Uporabite [Kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/) za ocene.

### Vprašanje: Kako nadzorujem stroške pri azd implementacijah?
**Odgovor**:
1. Uporabljajte nižje SKU-je za razvojna okolja
2. Nastavite proračune in opozorila v Azure
3. Uporabite `azd down` za odstranjevanje virov, ko niso potrebni
4. Izberite primerne regije (stroški se razlikujejo glede na lokacijo)
5. Uporabite orodja za upravljanje stroškov Azure

### Vprašanje: Ali obstajajo brezplačne možnosti za azd predloge?
**Odgovor**: Nekatere storitve imajo brezplačne SKU-je ali mesečne dodelitve, odvisno od upravičenosti, načrta gostovanja, regije in omejitev naročnine. To ne pomeni, da je celotna predloga brezplačna: baze podatkov, iskanje, omrežje, register, telemetrija in sklepanje modelov lahko neodvisno prinašajo stroške. Preverite [seznam brezplačnih Azure storitev](https://azure.microsoft.com/free/) in aktualne cene za vsak vir pred implementacijo.

### Vprašanje: Kako ocenim stroške pred implementacijo?
**Odgovor**:
1. Preglejte `main.bicep` predloge, da vidite, kateri viri so ustvarjeni
2. Uporabite kalkulator cen Azure z določenimi SKU-ji
3. Najprej implementirajte v razvojno okolje in spremljajte dejanske stroške
4. Za podrobno analizo stroškov uporabite Azure Cost Management

---

## Najboljše prakse

### Vprašanje: Kakšne so najboljše prakse za strukturo azd projektov?
**Odgovor**:
1. Ločite kodo aplikacije od infrastrukture
2. Uporabljajte pomenljive imena storitev v `azure.yaml`
3. Vključite ustrezno obdelavo napak v gradbene skripte
4. Uporabljajte konfiguracijo, specifično za okolje
5. Vključite obsežno dokumentacijo

### Vprašanje: Kako organiziram več storitev v azd?
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

### Vprašanje: Ali naj vključim mapo `.azure` v verzijski nadzor?
**Odgovor**: **Ne!** Mapa `.azure` vsebuje občutljive podatke. Dodajte jo k `.gitignore`:
```gitignore
.azure/
```

### V: Kako ravnam s skrivnostmi in občutljivo konfiguracijo?
**O**: 
1. Uporabite Azure Key Vault za skrivnosti
2. V konfiguraciji aplikacije uporabite sklice na skrivnosti Key Vault
3. Nikoli ne vključujte skrivnosti v nadzor različic
4. Uporabite upravljane identitete za preverjanje pristnosti med storitvami

### V: Kakšen je priporočeni pristop za CI/CD z azd?
**O**: 
1. Uporabite ločena okolja za vsako fazo (dev/staging/prod)
2. Pred uvajanjem uvedite avtomatizirano testiranje
3. Uporabite servisne principe za preverjanje pristnosti
4. Občutljivo konfiguracijo hranite v skrivnostih/spremenljivkah pipeline
5. Uvedite potrditvena vrata za produkcijska uvajanja

---

## Napredne teme

### V: Ali lahko razširim azd z lastno funkcionalnostjo?
**O**: Da, prek namestitvenih hookov v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### V: Kako integriram azd z obstoječimi DevOps procesi?
**O**: 
1. Uporabite ukaze azd v obstoječih skriptah pipeline
2. Standardizirajte modele azd med ekipami
3. Integrirajte z obstoječim nadzorom in opozarjanjem
4. Uporabite JSON izhod azd za integracijo v pipeline

### V: Ali lahko uporabljam azd z Azure DevOps?
**O**: Da, azd deluje z vsakim CI/CD sistemom. Ustvarite Azure DevOps pipeline, ki uporablja ukaze azd.

### V: Kako lahko prispevam k azd ali ustvarim skupnostne modele?
**O**: 
1. **orodje azd**: prispevajte v [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Modeli**: sledite [navodilom za prispevanje v galerijo Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentacija**: prispevajte k dokumentaciji na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### V: Kakšna je pot za azd?
**O**: Oglejte si [uradno roadmap](https://github.com/Azure/azure-dev/projects) za načrtovane funkcije in izboljšave.

### V: Kako migriram z drugih orodij za namestitev na azd?
**O**: 
1. Analizirajte trenutno arhitekturo uvajanja
2. Ustvarite enakovredne Bicep modele
3. Konfigurirajte `azure.yaml` za ujemanje obstoječih storitev
4. Temeljito testirajte v razvojnih okoljih
5. Postopoma preidite na nova okolja

---

## Imate še vedno vprašanja?

### **Najprej poiščite**
- Preverite [uradno dokumentacijo](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Iščite [GitHub težave](https://github.com/Azure/azure-dev/issues) za podobne težave

### **Pridobite pomoč**
- [GitHub razprave](https://github.com/Azure/azure-dev/discussions) - Podpora skupnosti
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnična vprašanja
- [Azure Discord](https://discord.gg/azure) - Klepet skupnosti v realnem času

### **Prijavite težave**
- [GitHub težave](https://github.com/Azure/azure-dev/issues/new) - Poročila o napakah in zahteve za funkcije
- Vključite ustrezne dnevnike, sporočila o napakah in korake za reproduciranje

### **Izvedite več**
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure dobro zasnovani okvir](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Tehnična navodila pregledana: 4. november 2026. Razpoložljivost v oblaku in ceniki morajo biti preverjeni za vaš račun in regijo.*

---

**Navigacija**
- **Prejšnja lekcija**: [Besednjak](glossary.md)
- **Naslednja lekcija**: [Učni vodič](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
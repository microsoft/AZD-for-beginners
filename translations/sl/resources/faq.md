# Pogosto zastavljena vprašanja (FAQ)

**Pomoč po poglavjih**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **🚆 Težave pri namestitvi**: [Poglavje 1: Namestitev in nastavitev](../docs/getting-started/installation.md)
- **🤖 Vprašanja o umetni inteligenci**: [Poglavje 2: Razvoj z AI](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Odpravljanje težav**: [Poglavje 7: Odpravljanje težav in razhroščevanje](../docs/troubleshooting/common-issues.md)

## Uvod

Ta obsežen FAQ ponuja odgovore na najpogostejša vprašanja o Azure Developer CLI (azd) in uvajanju v Azure. Poiščite hitre rešitve za pogoste težave, spoznajte najboljše prakse in pridobite pojasnila o konceptih ter delovnih tokovih azd.

## Cilji učenja

Z pregledom tega FAQ boste:
- Hitro našli odgovore na pogosta vprašanja in težave v zvezi z Azure Developer CLI
- Razumeli ključne koncepte in terminologijo prek praktičnega formata vprašanj in odgovorov
- Dostopali do rešitev za odpravljanje pogostih težav in scenarijev napak
- Spoznali najboljše prakse prek pogosto zastavljenih vprašanj o optimizaciji
- Odkrijte napredne funkcije in zmogljivosti prek vprašanj na strokovni ravni
- Učinkovito pridobili smernice o stroških, varnosti in strategijah uvajanja

## Rezultati učenja

Z rednim sklicevanjem na ta FAQ boste lahko:
- Samostojno reševali pogoste težave z Azure Developer CLI z uporabo ponujenih rešitev
- Sprejemali informirane odločitve o strategijah in konfiguracijah uvajanja
- Razumeli povezavo med azd in drugimi orodji ter storitvami Azure
- Uporabljali najboljše prakse na podlagi izkušenj skupnosti in priporočil strokovnjakov
- Učinkovito odpravljali težave z avtentikacijo, uvajanjem in konfiguracijo
- Optimizirali stroške in zmogljivost z vpogledi ter priporočili iz FAQ

## Kazalo vsebine

- [Začetek](../../../resources)
- [Avtentikacija in dostop](../../../resources)
- [Predloge in projekti](../../../resources)
- [Uvajanje in infrastruktura](../../../resources)
- [Konfiguracija in okolja](../../../resources)
- [Odpravljanje težav](../../../resources)
- [Stroški in obračunavanje](../../../resources)
- [Najboljše prakse](../../../resources)
- [Napredne teme](../../../resources)

---

## Začetek

### V: Kaj je Azure Developer CLI (azd)?
**O**: Azure Developer CLI (azd) je orodje ukazne vrstice, osredotočeno na razvijalce, ki pospeši čas, potreben za prenos vaše aplikacije iz lokalnega razvojnega okolja v Azure. Ponuja najboljše prakse prek predlog in pomaga pri celotnem življenjskem ciklu uvajanja.

### V: Kako se azd razlikuje od Azure CLI?
**O**: 
- **Azure CLI**: Orodje splošnega namena za upravljanje virov Azure
- **azd**: Orodje, osredotočeno na razvijalce, za delovne tokove uvajanja aplikacij
- azd uporablja Azure CLI interno, vendar ponuja višje abstrakcije za pogoste razvojne scenarije
- azd vključuje predloge, upravljanje okolij in avtomatizacijo uvajanja

### V: Ali moram imeti nameščen Azure CLI za uporabo azd?
**O**: Da, azd zahteva Azure CLI za avtentikacijo in nekatere operacije. Najprej namestite Azure CLI, nato pa azd.

### V: Katere programske jezike podpira azd?
**O**: azd je neodvisen od jezika. Deluje z:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statične spletne strani
- Kontejnerske aplikacije

### V: Ali lahko uporabljam azd z obstoječimi projekti?
**O**: Da! Lahko:
1. Uporabite `azd init` za dodajanje konfiguracije azd obstoječim projektom
2. Prilagodite obstoječe projekte, da ustrezajo strukturi predloge azd
3. Ustvarite prilagojene predloge na podlagi vaše obstoječe arhitekture

---

## Avtentikacija in dostop

### V: Kako se avtenticiram z Azure z uporabo azd?
**O**: Uporabite `azd auth login`, ki bo odprl okno brskalnika za avtentikacijo v Azure. Za scenarije CI/CD uporabite servisne principe ali upravljane identitete.

### V: Ali lahko uporabljam azd z več naročninami Azure?
**O**: Da. Uporabite `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` za določitev, katero naročnino uporabiti za vsako okolje.

### V: Katere pravice potrebujem za uvajanje z azd?
**O**: Običajno potrebujete:
- Vlogo **Contributor** na skupini virov ali naročnini
- **User Access Administrator**, če uvajate vire, ki zahtevajo dodelitve vlog
- Specifične pravice se razlikujejo glede na predlogo in uvajane vire

### V: Ali lahko uporabljam azd v CI/CD cevovodih?
**O**: Seveda! azd je zasnovan za integracijo CI/CD. Za avtentikacijo uporabite servisne principe in nastavite okoljske spremenljivke za konfiguracijo.

### V: Kako ravnam z avtentikacijo v GitHub Actions?
**O**: Uporabite Azure Login action z poverilnicami servisnega principa:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Predloge in projekti

### V: Kje lahko najdem predloge azd?
**O**: 
- Uradne predloge: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Predloge skupnosti: Iskanje na GitHubu za "azd-template"
- Uporabite `azd template list` za brskanje po razpoložljivih predlogah

### V: Kako ustvarim prilagojeno predlogo?
**O**: 
1. Začnite s strukturo obstoječe predloge
2. Spremenite `azure.yaml`, infrastrukturne datoteke in kodo aplikacije
3. Temeljito preizkusite z `azd up`
4. Objavite na GitHubu z ustreznimi oznakami

### V: Ali lahko uporabljam azd brez predloge?
**O**: Da, uporabite `azd init` v obstoječem projektu za ustvarjanje potrebnih konfiguracijskih datotek. Ročno boste morali konfigurirati `azure.yaml` in infrastrukturne datoteke.

### V: Kakšna je razlika med uradnimi in predlogami skupnosti?
**O**: 
- **Uradne predloge**: Vzdržuje Microsoft, redno posodablja, obsežna dokumentacija
- **Predloge skupnosti**: Ustvarjajo razvijalci, lahko imajo specializirane primere uporabe, različno kakovost in vzdrževanje

### V: Kako posodobim predlogo v svojem projektu?
**O**: Predloge se ne posodabljajo samodejno. Lahko:
1. Ročno primerjate in združite spremembe iz izvorne predloge
2. Začnete na novo z `azd init` z uporabo posodobljene predloge
3. Izberete specifične izboljšave iz posodobljenih predlog

---

## Uvajanje in infrastruktura

### V: Katere storitve Azure lahko azd uvede?
**O**: azd lahko uvede katero koli storitev Azure prek predlog Bicep/ARM, vključno z:
- App Services, Container Apps, Functions
- Baze podatkov (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Omrežne, varnostne in nadzorne vire

### V: Ali lahko uvedem v več regij?
**O**: Da, konfigurirajte več regij v svojih predlogah Bicep in ustrezno nastavite parameter lokacije za vsako okolje.

### V: Kako ravnam z migracijami sheme baze podatkov?
**O**: Uporabite kljuke uvajanja v `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### V: Ali lahko uvedem samo infrastrukturo brez aplikacij?
**O**: Da, uporabite `azd provision` za uvedbo samo infrastrukturnih komponent, definiranih v vaših predlogah.

### V: Kako uvedem v obstoječe vire Azure?
**O**: To je zapleteno in ni neposredno podprto. Lahko:
1. Uvozite obstoječe vire v svoje predloge Bicep
2. Uporabite obstoječe reference virov v predlogah
3. Spremenite predloge, da pogojno ustvarijo ali referencirajo vire

### V: Ali lahko uporabljam Terraform namesto Bicep?
**O**: Trenutno azd primarno podpira predloge Bicep/ARM. Podpora za Terraform ni uradno na voljo, čeprav lahko obstajajo rešitve skupnosti.

---

## Konfiguracija in okolja

### V: Kako upravljam različna okolja (razvoj, testiranje, produkcija)?
**O**: Ustvarite ločena okolja z `azd env new <environment-name>` in konfigurirajte različne nastavitve za vsako:
```bash
azd env new development
azd env new staging  
azd env new production
```

### V: Kje so shranjene konfiguracije okolja?
**O**: V mapi `.azure` znotraj vaše projektne mape. Vsako okolje ima svojo mapo s konfiguracijskimi datotekami.

### V: Kako nastavim konfiguracijo, specifično za okolje?
**O**: Uporabite `azd env set` za konfiguracijo okoljskih spremenljivk:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### V: Ali lahko delim konfiguracije okolja med člani ekipe?
**O**: Mapa `.azure` vsebuje občutljive informacije in je ne smete vključiti v nadzor različic. Namesto tega:
1. Dokumentirajte zahtevane okoljske spremenljivke
2. Uporabite skripte uvajanja za nastavitev okolij
3. Uporabite Azure Key Vault za občutljivo konfiguracijo

### V: Kako preglasim privzete nastavitve predloge?
**O**: Nastavite okoljske spremenljivke, ki ustrezajo parametrom predloge:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Odpravljanje težav

### V: Zakaj `azd up` ne uspe?
**O**: Pogosti vzroki:
1. **Težave z avtentikacijo**: Zaženite `azd auth login`
2. **Nezadostne pravice**: Preverite dodelitve vlog v Azure
3. **Konflikti pri poimenovanju virov**: Spremenite AZURE_ENV_NAME
4. **Težave s kvotami/kapaciteto**: Preverite razpoložljivost regije
5. **Napake v predlogi**: Validirajte predloge Bicep

### V: Kako razhroščujem napake pri uvajanju?
**O**: 
1. Uporabite `azd deploy --debug` za podroben izpis
2. Preverite zgodovino uvajanja v portalu Azure
3. Preglejte dnevnik aktivnosti v portalu Azure
4. Uporabite `azd show` za prikaz trenutnega stanja okolja

### V: Zakaj moje okoljske spremenljivke ne delujejo?
**O**: Preverite:
1. Imena spremenljivk se natančno ujemajo s parametri predloge
2. Vrednosti so pravilno navedene, če vsebujejo presledke
3. Izbrano je pravo okolje: `azd env select <environment>`
4. Spremenljivke so nastavljene v pravilnem okolju

### V: Kako počistim neuspele uvedbe?
**O**: 
```bash
azd down --force --purge
```
To odstrani vse vire in konfiguracijo okolja.

### V: Zakaj moja aplikacija ni dostopna po uvedbi?
**O**: Preverite:
1. Uvedba je bila uspešno zaključena
2. Aplikacija deluje (preverite dnevnike v portalu Azure)
3. Omrežne varnostne skupine dovoljujejo promet
4. DNS/prilagojene domene so pravilno konfigurirane

---

## Stroški in obračunavanje

### V: Koliko bodo stali uvodi azd?
**O**: Stroški so odvisni od:
- Uvedenih storitev Azure
- Izbranih nivojev storitev/SKU-jev
- Regijskih razlik v cenah
- Vzorcev uporabe

Uporabite [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) za ocene.

### V: Kako nadzorujem stroške pri uvajanjih azd?
**O**: 
1. Uporabite nižje nivoje SKU za razvojna okolja
2. Nastavite proračune in opozorila v Azure
3. Uporabite `azd down` za odstranitev virov, ko niso potrebni
4. Izberite ustrezne regije (stroški se razlikujejo glede na lokacijo)
5. Uporabite orodja za upravljanje stroškov Azure

### V: Ali obstajajo možnosti brezplačnega nivoja za predloge azd?
**O**: Veliko storitev Azure ponuja brezplačne nivoje:
- App Service: Na voljo brezplačen nivo
- Azure Functions: 1M brezplačnih izvedb/mesec
- Cosmos DB: Brezplačen nivo z 400 RU/s
- Application Insights: Prvih 5GB/mesec brezplačno

Konfigurirajte predloge za uporabo brezplačnih nivojev, kjer so na voljo.

### V: Kako ocenim stroške pred uvedbo?
**O**: 
1. Preglejte `main.bicep` predloge, da vidite, kateri viri so ustvarjeni
2. Uporabite Azure Pricing Calculator z določenimi SKU-ji
3. Najprej uvedite v razvojno okolje za spremljanje dejanskih stroškov
4. Uporabite Azure Cost Management za podrobno analizo stroškov

---

## Najboljše prakse

### V: Katere so najboljše prakse za strukturo projektov azd?
**O**: 
1. Ločite kodo aplikacije od infrastrukture
2. Uporabite smiselna imena storitev v `azure.yaml`
3. Implementirajte ustrezno obravnavo napak v skriptih gradnje
4. Uporabite konfiguracijo, specifično za okolje
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

### V: Ali naj mapo `.azure` vključim v nadzor različic?
**O**: **Ne!** Mapa `.azure` vsebuje občutljive informacije. Dodajte jo v `.gitignore`:
```gitignore
.azure/
```

### V: Kako ravnam s skrivnostmi in občutljivo konfiguracijo?
**O**: 
1. Uporabite Azure Key Vault za skrivnosti
2. Reference skrivnosti Key Vault v konfiguraciji aplikacije
3. Nikoli ne vključujte skrivnosti v nadzor različic
4. Uporabite upravljane identitete za avtentikacijo med storitvami

### V: Kakšen je priporočeni pristop za CI/CD z azd?
**O**: 
1. Uporabite ločena okolja za vsako fazo (razvoj/testiranje/produkcija)
2. Implementirajte avtomatizirano testiranje pred uvedbo
3. Za avtentikacijo uporabite servisne principe
4. Shranite občutljivo konfiguracijo v skrivnosti/spremenljivke cevovoda
5. Implementirajte odobritvene korake za produkcijske uvedbe

---

## Napredne teme

### V: Ali lahko razširim azd s prilagojeno funkcionalnostjo?
**O**: Da, prek kljuk uvajanja v `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### V: Kako integriram azd z obstoječimi procesi DevOps?
**O**: 
1. Uporabite ukaze azd v obstoječih skriptih cevovoda
2. Standardizirajte predloge azd med ekipami
3. Integrirajte z obstoječim nadzorom in opozarjanjem
4. Uporabite JSON izhod azd za integracijo cevovoda

### V: Ali lahko uporabljam azd z Azure DevOps?
**O**: Da, azd deluje z vsakim sistemom CI/CD. Ustvarite cevovode Azure DevOps, ki uporabljajo ukaze azd.

### V: Kako prispevam k azd ali ustvarim predloge skupnosti?
**O**: 
1. **Orodje azd**: Prispevajte k [Azure/azure-dev](https://github.com/Azure/
2. **Predloge**: Ustvarite predloge v skladu s [smernicami za predloge](https://github.com/Azure-Samples/awesome-azd)  
3. **Dokumentacija**: Prispevajte k dokumentaciji na [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### V: Kakšen je načrt za azd?  
**O**: Oglejte si [uradni načrt](https://github.com/Azure/azure-dev/projects) za načrtovane funkcije in izboljšave.  

### V: Kako migriram z drugih orodij za uvajanje na azd?  
**O**:  
1. Analizirajte trenutno arhitekturo uvajanja  
2. Ustvarite ustrezne Bicep predloge  
3. Konfigurirajte `azure.yaml`, da ustreza trenutnim storitvam  
4. Temeljito testirajte v razvojnem okolju  
5. Postopoma migrirajte okolja  

---

## Imate še vprašanja?  

### **Najprej poiščite**  
- Preverite [uradno dokumentacijo](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Poiščite [GitHub težave](https://github.com/Azure/azure-dev/issues) za podobne težave  

### **Poiščite pomoč**  
- [GitHub razprave](https://github.com/Azure/azure-dev/discussions) - Podpora skupnosti  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tehnična vprašanja  
- [Azure Discord](https://discord.gg/azure) - Klepet skupnosti v realnem času  

### **Prijavite težave**  
- [GitHub težave](https://github.com/Azure/azure-dev/issues/new) - Poročila o napakah in zahteve za funkcije  
- Vključite ustrezne dnevnike, sporočila o napakah in korake za reprodukcijo  

### **Izvedite več**  
- [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Ta FAQ se redno posodablja. Zadnja posodobitev: 9. september 2025*  

---

**Navigacija**  
- **Prejšnja lekcija**: [Slovar](glossary.md)  
- **Naslednja lekcija**: [Vodnik za študij](study-guide.md)  

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
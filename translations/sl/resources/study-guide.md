<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-23T21:20:46+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "sl"
}
-->
# Vodnik za študij - Celoviti učni cilji

**Navigacija po učni poti**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Začni z učenjem**: [Poglavje 1: Osnove in hitri začetek](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledenje napredku**: [Zaključek tečaja](../README.md#-course-completion--certification)

## Uvod

Ta celoviti vodnik za študij ponuja strukturirane učne cilje, ključne koncepte, praktične vaje in ocenjevalne materiale, ki vam bodo pomagali obvladati Azure Developer CLI (azd). Uporabite ta vodnik za sledenje napredku in zagotovite, da ste pokrili vse bistvene teme.

## Učni cilji

Z zaključkom tega vodnika boste:
- Obvladali vse osnovne in napredne koncepte Azure Developer CLI
- Razvili praktične veščine za uvajanje in upravljanje aplikacij na Azure
- Pridobili samozavest pri odpravljanju težav in optimizaciji uvajanj
- Razumeli prakse za uvajanje pripravljenih na produkcijo in varnostne vidike

## Rezultati učenja

Po zaključku vseh poglavij tega vodnika boste sposobni:
- Načrtovati, uvajati in upravljati celotne arhitekture aplikacij z uporabo azd
- Uvesti celovite strategije za spremljanje, varnost in optimizacijo stroškov
- Samostojno odpravljati zapletene težave pri uvajanju
- Ustvariti prilagojene predloge in prispevati k skupnosti azd

## Struktura učenja v 8 poglavjih

### Poglavje 1: Osnove in hitri začetek (1. teden)
**Trajanje**: 30-45 minut | **Kompleksnost**: ⭐

#### Učni cilji
- Razumeti osnovne koncepte in terminologijo Azure Developer CLI
- Uspešno namestiti in konfigurirati AZD na vaši razvojni platformi
- Uvajati svojo prvo aplikacijo z uporabo obstoječega predloga
- Učinkovito navigirati po ukazni vrstici AZD

#### Ključni koncepti za obvladanje
- Struktura projekta AZD in komponente (azure.yaml, infra/, src/)
- Delovni tokovi uvajanja na osnovi predlog
- Osnove konfiguracije okolja
- Upravljanje skupin virov in naročnin

#### Praktične vaje
1. **Preverjanje namestitve**: Namestite AZD in preverite z `azd version`
2. **Prvo uvajanje**: Uspešno uvedite predlogo todo-nodejs-mongo
3. **Nastavitev okolja**: Konfigurirajte svoje prve okoljske spremenljivke
4. **Raziskovanje virov**: Navigirajte po uvedenih virih v Azure Portalu

#### Ocene vprašanja
- Katere so osnovne komponente projekta AZD?
- Kako inicializirate nov projekt iz predloge?
- Kakšna je razlika med `azd up` in `azd deploy`?
- Kako upravljate več okolij z AZD?

---

### Poglavje 2: Razvoj, osredotočen na AI (2. teden)
**Trajanje**: 1-2 uri | **Kompleksnost**: ⭐⭐

#### Učni cilji
- Integrirati storitve Microsoft Foundry z delovnimi tokovi AZD
- Uvajati in konfigurirati aplikacije, ki temeljijo na AI
- Razumeti vzorce implementacije RAG (Retrieval-Augmented Generation)
- Upravljati uvajanje in skaliranje AI modelov

#### Ključni koncepti za obvladanje
- Integracija storitve Azure OpenAI in upravljanje API-jev
- Konfiguracija AI iskanja in indeksiranje vektorjev
- Strategije uvajanja modelov in načrtovanje zmogljivosti
- Spremljanje AI aplikacij in optimizacija zmogljivosti

#### Praktične vaje
1. **Uvajanje AI klepeta**: Uvedite predlogo azure-search-openai-demo
2. **Implementacija RAG**: Konfigurirajte indeksiranje in pridobivanje dokumentov
3. **Konfiguracija modelov**: Nastavite več AI modelov z različnimi nameni
4. **Spremljanje AI**: Implementirajte Application Insights za AI delovne obremenitve

#### Ocene vprašanja
- Kako konfigurirate storitve Azure OpenAI v predlogi AZD?
- Katere so ključne komponente arhitekture RAG?
- Kako upravljate zmogljivost in skaliranje AI modelov?
- Katere metrike spremljanja so pomembne za AI aplikacije?

---

### Poglavje 3: Konfiguracija in avtentikacija (3. teden)
**Trajanje**: 45-60 minut | **Kompleksnost**: ⭐⭐

#### Učni cilji
- Obvladati strategije konfiguracije in upravljanja okolij
- Implementirati varne vzorce avtentikacije in upravljane identitete
- Organizirati vire z ustreznimi poimenovalnimi konvencijami
- Konfigurirati uvajanja za več okolij (razvoj, testiranje, produkcija)

#### Ključni koncepti za obvladanje
- Hierarhija okolij in prednost konfiguracije
- Upravljana identiteta in avtentikacija s servisnimi glavnimi identitetami
- Integracija Key Vault za upravljanje skrivnosti
- Upravljanje parametrov, specifičnih za okolje

#### Praktične vaje
1. **Nastavitev več okolij**: Konfigurirajte razvojna, testna in produkcijska okolja
2. **Konfiguracija varnosti**: Implementirajte avtentikacijo z upravljano identiteto
3. **Upravljanje skrivnosti**: Integrirajte Azure Key Vault za občutljive podatke
4. **Upravljanje parametrov**: Ustvarite konfiguracije, specifične za okolje

#### Ocene vprašanja
- Kako konfigurirate različna okolja z AZD?
- Kakšne so prednosti uporabe upravljane identitete v primerjavi s servisnimi glavnimi identitetami?
- Kako varno upravljate skrivnosti aplikacij?
- Kakšna je hierarhija konfiguracije v AZD?

---

### Poglavje 4: Infrastruktura kot koda in uvajanje (4.-5. teden)
**Trajanje**: 1-1,5 ure | **Kompleksnost**: ⭐⭐⭐

#### Učni cilji
- Ustvariti in prilagoditi predloge infrastrukture Bicep
- Implementirati napredne vzorce uvajanja in delovne tokove
- Razumeti strategije zagotavljanja virov
- Načrtovati skalabilne arhitekture z več storitvami

- Uvajati aplikacije v kontejnerjih z uporabo Azure Container Apps in AZD

#### Ključni koncepti za obvladanje
- Struktura predlog Bicep in najboljše prakse
- Odvisnosti virov in vrstni red uvajanja
- Datoteke parametrov in modularnost predlog
- Prilagojeni hooks in avtomatizacija uvajanja
- Vzorci uvajanja aplikacij v kontejnerjih (hitri začetek, produkcija, mikro storitve)

#### Praktične vaje
1. **Ustvarjanje prilagojenih predlog**: Zgradite predlogo aplikacije z več storitvami
2. **Obvladovanje Bicep**: Ustvarite modularne, ponovno uporabne komponente infrastrukture
3. **Avtomatizacija uvajanja**: Implementirajte hooks pred/po uvajanju
4. **Načrtovanje arhitekture**: Uvedite kompleksno arhitekturo mikro storitev
5. **Uvajanje aplikacij v kontejnerjih**: Uvedite primere [Simple Flask API](../../../examples/container-app/simple-flask-api) in [Microservices Architecture](../../../examples/container-app/microservices) z uporabo AZD

#### Ocene vprašanja
- Kako ustvarite prilagojene predloge Bicep za AZD?
- Katere so najboljše prakse za organizacijo kode infrastrukture?
- Kako obvladujete odvisnosti virov v predlogah?
- Katere vzorce uvajanja podpirajo posodobitve brez izpadov?

---

### Poglavje 5: Rešitve AI z več agenti (6.-7. teden)
**Trajanje**: 2-3 ure | **Kompleksnost**: ⭐⭐⭐⭐

#### Učni cilji
- Načrtovati in implementirati arhitekture AI z več agenti
- Orkestrirati koordinacijo in komunikacijo med agenti
- Uvajati produkcijsko pripravljene AI rešitve s spremljanjem
- Razumeti specializacijo agentov in vzorce delovnih tokov
- Integrirati mikro storitve v kontejnerjih kot del rešitev z več agenti

#### Ključni koncepti za obvladanje
- Vzorci arhitekture z več agenti in načela oblikovanja
- Protokoli komunikacije med agenti in tok podatkov
- Strategije za uravnavanje obremenitve in skaliranje za AI agente
- Spremljanje produkcije za sisteme z več agenti
- Komunikacija med storitvami v okolju mikro storitev

#### Praktične vaje
1. **Uvajanje rešitve za maloprodajo**: Uvedite celoten scenarij maloprodaje z več agenti
2. **Prilagoditev agentov**: Spremenite vedenje agentov za stranke in zaloge
3. **Skaliranje arhitekture**: Implementirajte uravnavanje obremenitve in samodejno skaliranje
4. **Spremljanje produkcije**: Nastavite celovito spremljanje in opozarjanje
5. **Integracija mikro storitev**: Razširite primer [Microservices Architecture](../../../examples/container-app/microservices) za podporo delovnim tokovom na osnovi agentov

#### Ocene vprašanja
- Kako načrtujete učinkovite vzorce komunikacije med agenti?
- Katere so ključne točke za skaliranje delovnih obremenitev AI agentov?
- Kako spremljate in odpravljate težave v sistemih AI z več agenti?
- Katere produkcijske vzorce zagotavljajo zanesljivost za AI agente?

---

### Poglavje 6: Validacija pred uvajanjem in načrtovanje (8. teden)
**Trajanje**: 1 ura | **Kompleksnost**: ⭐⭐

#### Učni cilji
- Izvesti celovito načrtovanje zmogljivosti in validacijo virov
- Izbrati optimalne Azure SKU-je za stroškovno učinkovitost
- Implementirati avtomatizirane preveritve pred uvajanjem
- Načrtovati uvajanja s strategijami optimizacije stroškov

#### Ključni koncepti za obvladanje
- Kvote virov Azure in omejitve zmogljivosti
- Merila za izbiro SKU-jev in optimizacija stroškov
- Avtomatizirani validacijski skripti in testiranje
- Načrtovanje uvajanja in ocena tveganja

#### Praktične vaje
1. **Analiza zmogljivosti**: Analizirajte zahteve virov za vaše aplikacije
2. **Optimizacija SKU-jev**: Primerjajte in izberite stroškovno učinkovite nivoje storitev
3. **Avtomatizacija validacije**: Implementirajte skripte za preverjanje pred uvajanjem
4. **Načrtovanje stroškov**: Ustvarite ocene stroškov uvajanja in proračune

#### Ocene vprašanja
- Kako validirate zmogljivost Azure pred uvajanjem?
- Katere dejavnike upoštevate pri izbiri SKU-jev?
- Kako avtomatizirate validacijo pred uvajanjem?
- Katere strategije pomagajo optimizirati stroške uvajanja?

---

### Poglavje 7: Odpravljanje težav in razhroščevanje (9. teden)
**Trajanje**: 1-1,5 ure | **Kompleksnost**: ⭐⭐

#### Učni cilji
- Razviti sistematične pristope za razhroščevanje uvajanj AZD
- Reševati pogoste težave pri uvajanju in konfiguraciji
- Razhroščevati specifične težave AI in težave z zmogljivostjo
- Implementirati spremljanje in opozarjanje za proaktivno odkrivanje težav

#### Ključni koncepti za obvladanje
- Diagnostične tehnike in strategije beleženja
- Pogosti vzorci napak in njihove rešitve
- Spremljanje zmogljivosti in optimizacija
- Postopki odziva na incidente in obnovitev

#### Praktične vaje
1. **Diagnostične veščine**: Vadite z namerno pokvarjenimi uvajanji
2. **Analiza dnevnikov**: Učinkovito uporabite Azure Monitor in Application Insights
3. **Optimizacija zmogljivosti**: Optimizirajte aplikacije z nizko zmogljivostjo
4. **Postopki obnovitve**: Implementirajte varnostne kopije in obnovitev po katastrofi

#### Ocene vprašanja
- Katere so najpogostejše napake pri uvajanju AZD?
- Kako razhroščujete težave z avtentikacijo in dovoljenji?
- Katere strategije spremljanja pomagajo preprečiti težave v produkciji?
- Kako optimizirate zmogljivost aplikacij v Azure?

---

### Poglavje 8: Produkcijski in podjetniški vzorci (10.-11. teden)
**Trajanje**: 2-3 ure | **Kompleksnost**: ⭐⭐⭐⭐

#### Učni cilji
- Implementirati strategije uvajanja na ravni podjetja
- Oblikovati varnostne vzorce in okvire skladnosti
- Ustanoviti spremljanje, upravljanje in optimizacijo stroškov
- Ustvariti skalabilne CI/CD pipeline z integracijo AZD
- Uporabiti najboljše prakse za produkcijsko uvajanje aplikacij v kontejnerjih (varnost, spremljanje, stroški, CI/CD)

#### Ključni koncepti za obvladanje
- Zahteve za varnost in skladnost na ravni podjetja
- Okviri upravljanja in implementacija politik
- Napredno spremljanje in upravljanje stroškov
- Integracija CI/CD in avtomatizirane pipeline uvajanja
- Strategije uvajanja blue-green in canary za delovne obremenitve v kontejnerjih

#### Praktične vaje
1. **Varnost na ravni podjetja**: Implementirajte celovite varnostne vzorce
2. **Okvir upravljanja**: Nastavite Azure Policy in upravljanje virov
3. **Napredno spremljanje**: Ustvarite nadzorne plošče in avtomatizirano opozarjanje
4. **Integracija CI/CD**: Zgradite avtomatizirane pipeline uvajanja
5. **Produkcijske aplikacije v kontejnerjih**: Uporabite varnost, spremljanje in optimizacijo stroškov na primeru [Microservices Architecture](../../../examples/container-app/microservices)

#### Ocene vprašanja
- Kako implementirate varnost na ravni podjetja v uvajanjih AZD?
- Katere vzorce upravljanja zagotavljajo skladnost in nadzor stroškov?
- Kako načrtujete skalabilno spremljanje za produkcijske sisteme?
- Katere vzorce CI/CD najbolje delujejo z delovnimi tokovi AZD?

#### Učni cilji
- Razumeti osnove in ključne koncepte Azure Developer CLI
- Uspešno namestiti in konfigurirati azd v vašem razvojnem okolju
- Zaključiti prvo uvajanje z uporabo obstoječe predloge
- Navigirati po strukturi projekta azd in razumeti ključne komponente

#### Ključni koncepti za obvladanje
- Predloge, okolja in storitve
- Struktura konfiguracije azure.yaml
- Osnovni ukazi azd (init, up, down, deploy)
- Načela infrastrukture kot kode
- Avtentikacija in avtorizacija v Azure

#### Praktične vaje

**Vaja 1.1: Namestitev in nastavitev**
```bash
# Izpolnite te naloge:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Vaja 1.2: Prvo uvajanje**
```bash
# Namestite preprosto spletno aplikacijo:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Vaja 1.3: Analiza strukture projekta**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Samoocenjevalna vprašanja
1. Katere so tri osnovne koncepte arhitekture azd?
2. Kakšen je namen datoteke azure.yaml?
3. Kako okolja pomagajo pri upravljanju različnih ciljev uvajanja?
4. Katere metode avtentikacije lahko uporabite z azd?
5. Kaj se zgodi, ko prvič zaženete `azd up`?

---

## Sledenje napredku in okvir za ocenjevanje
```bash
# Ustvari in konfiguriraj več okolij:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Vaja 2.2: Napredna konfiguracija**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Vaja 2.3: Konfiguracija varnosti**
```bash
# Uvedite najboljše prakse za varnost:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Samoocenjevalna vprašanja
1. Kako azd obravnava prednost okolijskih spremenljivk?
2. Kaj so hooks za uvajanje in kdaj jih uporab
5. Kakšne so pomembne točke pri uvajanju v več regijah?

### Modul 4: Validacija pred uvajanjem (5. teden)

#### Cilji učenja
- Izvajanje celovitih preverjanj pred uvajanjem
- Obvladovanje načrtovanja zmogljivosti in validacije virov
- Razumevanje izbire SKU in optimizacije stroškov
- Gradnja avtomatiziranih validacijskih procesov

#### Ključni koncepti za obvladovanje
- Kvote in omejitve virov Azure
- Merila za izbiro SKU in vpliv na stroške
- Avtomatizirani validacijski skripti in orodja
- Metodologije načrtovanja zmogljivosti
- Testiranje zmogljivosti in optimizacija

#### Praktične vaje

**Vaja 4.1: Načrtovanje zmogljivosti**
```bash
# Izvedi preverjanje zmogljivosti:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Vaja 4.2: Validacija pred uvajanjem**
```powershell
# Zgradite celovito validacijsko cevovod:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Vaja 4.3: Optimizacija SKU**
```bash
# Optimizirajte konfiguracije storitev:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Samoevalvacija
1. Kateri dejavniki naj vplivajo na odločitve o izbiri SKU?
2. Kako preverite razpoložljivost virov Azure pred uvajanjem?
3. Kateri so ključni elementi sistema za preverjanje pred uvajanjem?
4. Kako ocenite in nadzorujete stroške uvajanja?
5. Katero spremljanje je bistveno za načrtovanje zmogljivosti?

### Modul 5: Odpravljanje težav in razhroščevanje (6. teden)

#### Cilji učenja
- Obvladovanje sistematičnih metodologij za odpravljanje težav
- Razvijanje strokovnosti pri razhroščevanju kompleksnih težav pri uvajanju
- Izvajanje celovitega spremljanja in opozarjanja
- Gradnja postopkov za odzivanje na incidente in obnovo

#### Ključni koncepti za obvladovanje
- Pogosti vzorci napak pri uvajanju
- Analiza dnevnikov in tehnike korelacije
- Spremljanje zmogljivosti in optimizacija
- Odkrivanje varnostnih incidentov in odzivanje nanje
- Obnova po katastrofi in kontinuiteta poslovanja

#### Praktične vaje

**Vaja 5.1: Scenariji odpravljanja težav**
```bash
# Vadite reševanje pogostih težav:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Vaja 5.2: Izvajanje spremljanja**
```bash
# Nastavite celovito spremljanje:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Vaja 5.3: Odzivanje na incidente**
```bash
# Sestavite postopke odziva na incidente:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Samoevalvacija
1. Kakšen je sistematičen pristop k odpravljanju težav pri uvajanju azd?
2. Kako korelirate dnevnike med več storitvami in viri?
3. Kateri metri spremljanja so najpomembnejši za zgodnje odkrivanje težav?
4. Kako izvajate učinkovite postopke obnove po katastrofi?
5. Kateri so ključni elementi načrta za odzivanje na incidente?

### Modul 6: Napredne teme in najboljše prakse (7.–8. teden)

#### Cilji učenja
- Izvajanje vzorcev uvajanja na ravni podjetja
- Obvladovanje integracije CI/CD in avtomatizacije
- Razvijanje prilagojenih predlog in prispevanje skupnosti
- Razumevanje naprednih varnostnih in skladnostnih zahtev

#### Ključni koncepti za obvladovanje
- Vzorci integracije CI/CD cevovodov
- Razvoj in distribucija prilagojenih predlog
- Upravljanje na ravni podjetja in skladnost
- Napredne konfiguracije omrežja in varnosti
- Optimizacija zmogljivosti in upravljanje stroškov

#### Praktične vaje

**Vaja 6.1: Integracija CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Vaja 6.2: Razvoj prilagojenih predlog**
```bash
# Ustvarite in objavite prilagojene predloge:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Vaja 6.3: Izvajanje na ravni podjetja**
```bash
# Implementirajte funkcije na ravni podjetja:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Samoevalvacija
1. Kako integrirate azd v obstoječe CI/CD delovne tokove?
2. Kateri so ključni vidiki pri razvoju prilagojenih predlog?
3. Kako izvajate upravljanje in skladnost pri uvajanju azd?
4. Katere so najboljše prakse za uvajanje na ravni podjetja?
5. Kako učinkovito prispevate skupnosti azd?

## Praktični projekti

### Projekt 1: Spletna stran osebnega portfelja
**Kompleksnost**: Začetnik  
**Trajanje**: 1–2 tedna

Zgradite in uvedite spletno stran osebnega portfelja z uporabo:
- Gostovanje statične spletne strani na Azure Storage
- Konfiguracija prilagojene domene
- Integracija CDN za globalno zmogljivost
- Avtomatiziran cevovod za uvajanje

**Rezultati**:
- Delujoča spletna stran uvedena na Azure
- Prilagojena predloga azd za uvajanje portfelja
- Dokumentacija postopka uvajanja
- Priporočila za analizo stroškov in optimizacijo

### Projekt 2: Aplikacija za upravljanje nalog
**Kompleksnost**: Srednje zahtevno  
**Trajanje**: 2–3 tedne

Ustvarite aplikacijo za upravljanje nalog s polnim skladom z:
- React frontend uveden na App Service
- Node.js API backend z avtentikacijo
- PostgreSQL baza podatkov z migracijami
- Spremljanje z Application Insights

**Rezultati**:
- Popolna aplikacija z avtentikacijo uporabnikov
- Shema baze podatkov in skripti za migracijo
- Nadzorne plošče za spremljanje in pravila opozarjanja
- Konfiguracija uvajanja za več okolij

### Projekt 3: Platforma za e-trgovino z mikroservisi
**Kompleksnost**: Napredno  
**Trajanje**: 4–6 tednov

Oblikujte in izvedite platformo za e-trgovino, ki temelji na mikroservisih:
- Več API storitev (katalog, naročila, plačila, uporabniki)
- Integracija sporočilne vrste s Service Bus
- Redis predpomnilnik za optimizacijo zmogljivosti
- Celovito beleženje in spremljanje

**Referenčni primer**: Glejte [Arhitektura mikroservisov](../../../examples/container-app/microservices) za predlogo pripravljeno za produkcijo in vodič za uvajanje

**Rezultati**:
- Popolna arhitektura mikroservisov
- Vzorci komunikacije med storitvami
- Testiranje zmogljivosti in optimizacija
- Varnostna implementacija pripravljena za produkcijo

## Ocena in certifikacija

### Preverjanje znanja

Opravite te ocene po vsakem modulu:

**Ocena modula 1**: Osnovni koncepti in namestitev
- Izbirna vprašanja o osnovnih konceptih
- Praktične naloge za namestitev in konfiguracijo
- Enostavna vaja uvajanja

**Ocena modula 2**: Konfiguracija in okolja
- Scenariji upravljanja okolij
- Vaje za odpravljanje težav pri konfiguraciji
- Izvajanje varnostne konfiguracije

**Ocena modula 3**: Uvajanje in zagotavljanje
- Izzivi pri oblikovanju infrastrukture
- Scenariji uvajanja več storitev
- Vaje za optimizacijo zmogljivosti

**Ocena modula 4**: Validacija pred uvajanjem
- Študije primerov načrtovanja zmogljivosti
- Scenariji optimizacije stroškov
- Izvajanje validacijskih procesov

**Ocena modula 5**: Odpravljanje težav in razhroščevanje
- Naloge za diagnozo težav
- Naloge za izvajanje spremljanja
- Simulacije odzivanja na incidente

**Ocena modula 6**: Napredne teme
- Oblikovanje CI/CD cevovodov
- Razvoj prilagojenih predlog
- Scenariji arhitekture na ravni podjetja

### Končni projekt

Oblikujte in izvedite popolno rešitev, ki prikazuje obvladovanje vseh konceptov:

**Zahteve**:
- Arhitektura aplikacije z več nivoji
- Več okolij za uvajanje
- Celovito spremljanje in opozarjanje
- Izvajanje varnosti in skladnosti
- Optimizacija stroškov in zmogljivosti
- Popolna dokumentacija in priročniki

**Merila za ocenjevanje**:
- Kakovost tehnične izvedbe
- Celovitost dokumentacije
- Upoštevanje varnosti in najboljših praks
- Optimizacija zmogljivosti in stroškov
- Učinkovitost pri odpravljanju težav in spremljanju

## Učni viri in reference

### Uradna dokumentacija
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Dokumentacija Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Viri skupnosti
- [Galerija predlog AZD](https://azure.github.io/awesome-azd/)
- [GitHub organizacija Azure-Samples](https://github.com/Azure-Samples)
- [GitHub repozitorij Azure Developer CLI](https://github.com/Azure/azure-dev)

### Praktična okolja
- [Brezplačen račun Azure](https://azure.microsoft.com/free/)
- [Brezplačna raven Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Dodatna orodja
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Razširitveni paket Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Priporočila za urnik učenja

### Polni čas študija (8 tednov)
- **1.–2. teden**: Modula 1–2 (Začetek, Konfiguracija)
- **3.–4. teden**: Modula 3–4 (Uvajanje, Validacija pred uvajanjem)
- **5.–6. teden**: Modula 5–6 (Odpravljanje težav, Napredne teme)
- **7.–8. teden**: Praktični projekti in končna ocena

### Študij ob delu (16 tednov)
- **1.–4. teden**: Modul 1 (Začetek)
- **5.–7. teden**: Modul 2 (Konfiguracija in okolja)
- **8.–10. teden**: Modul 3 (Uvajanje in zagotavljanje)
- **11.–12. teden**: Modul 4 (Validacija pred uvajanjem)
- **13.–14. teden**: Modul 5 (Odpravljanje težav in razhroščevanje)
- **15.–16. teden**: Modul 6 (Napredne teme in ocena)

---

## Sledenje napredku in okvir za ocenjevanje

### Seznam za preverjanje dokončanja poglavij

Sledite svojemu napredku skozi vsako poglavje z naslednjimi merljivimi rezultati:

#### 📚 Poglavje 1: Osnove in hitri začetek
- [ ] **Namestitev dokončana**: AZD nameščen in preverjen na vaši platformi
- [ ] **Prvo uvajanje**: Uspešno uvedena predloga todo-nodejs-mongo
- [ ] **Nastavitev okolja**: Konfigurirane prve okoljske spremenljivke
- [ ] **Navigacija po virih**: Raziskani uvedeni viri v Azure Portal
- [ ] **Obvladovanje ukazov**: Obvladovanje osnovnih ukazov AZD

#### 🤖 Poglavje 2: Razvoj z AI v ospredju  
- [ ] **Uvajanje AI predloge**: Uspešno uvedena azure-search-openai-demo
- [ ] **Izvedba RAG**: Konfigurirano indeksiranje in pridobivanje dokumentov
- [ ] **Konfiguracija modela**: Nastavljeni več AI modeli z različnimi nameni
- [ ] **Spremljanje AI**: Izvedeno spremljanje z Application Insights
- [ ] **Optimizacija zmogljivosti**: Izboljšana zmogljivost AI aplikacije

#### ⚙️ Poglavje 3: Konfiguracija in avtentikacija
- [ ] **Nastavitev več okolij**: Konfigurirana razvojna, testna in produkcijska okolja
- [ ] **Izvajanje varnosti**: Nastavljena avtentikacija z upravljano identiteto
- [ ] **Upravljanje skrivnosti**: Integriran Azure Key Vault za občutljive podatke
- [ ] **Upravljanje parametrov**: Ustvarjene konfiguracije specifične za okolje
- [ ] **Obvladovanje avtentikacije**: Izvedeni varni vzorci dostopa

#### 🏗️ Poglavje 4: Infrastruktura kot koda in uvajanje
- [ ] **Ustvarjanje prilagojenih predlog**: Zgrajena predloga za aplikacijo z več storitvami
- [ ] **Obvladovanje Bicep**: Ustvarjene modularne, ponovno uporabne komponente infrastrukture
- [ ] **Avtomatizacija uvajanja**: Izvedeni pred/po uvajalni procesi
- [ ] **Oblikovanje arhitekture**: Uvedena kompleksna arhitektura mikroservisov
- [ ] **Optimizacija predlog**: Optimizirane predloge za zmogljivost in stroške

#### 🎯 Poglavje 5: AI rešitve z več agenti
- [ ] **Uvajanje rešitve za maloprodajo**: Uveden celoten scenarij za maloprodajo z več agenti
- [ ] **Prilagoditev agentov**: Spremenjeno vedenje agentov za stranke in zaloge
- [ ] **Razširitev arhitekture**: Izvedeno uravnavanje obremenitve in samodejno skaliranje
- [ ] **Spremljanje produkcije**: Nastavljeno celovito spremljanje in opozarjanje
- [ ] **Optimizacija zmogljivosti**: Izboljšana zmogljivost sistema z več agenti

#### 🔍 Poglavje 6: Validacija pred uvajanjem in načrtovanje
- [ ] **Analiza zmogljivosti**: Analizirane zahteve za vire aplikacij
- [ ] **Optimizacija SKU**: Izbrani stroškovno učinkoviti nivoji storitev
- [ ] **Avtomatizacija validacije**: Izvedeni skripti za preverjanje pred uvajanjem
- [ ] **Načrtovanje stroškov**: Ustvarjene ocene stroškov uvajanja in proračuni
- [ ] **Ocena tveganja**: Identificirana in zmanjšana tveganja uvajanja

#### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje
- [ ] **Diagnostične veščine**: Uspešno razhroščene namerno pokvarjene uvedbe
- [ ] **Analiza dnevnikov**: Učinkovita uporaba Azure Monitor in Application Insights
- [ ] **Optimizacija zmogljivosti**: Izboljšane aplikacije z nizko zmogljivostjo
- [ ] **Postopki obnove**: Izvedeni postopki varnostnega kopiranja in obnove po katastrofi
- [ ] **Nastavitev spremljanja**: Ustvarjeno proaktivno spremljanje in opozarjanje

#### 🏢 Poglavje 8: Produkcija in vzorci na ravni podjetja
- [ ] **Varnost na ravni podjetja**: Izvedeni celoviti varnostni vzorci
- [ ] **Okvir upravljanja**: Nastavljena Azure Policy in upravljanje virov
- [ ] **Napredno spremljanje**: Ustvarjene nadzorne plošče in avtomatizirano opozarjanje
- [ ] **Integracija CI/CD**: Zgrajeni avtomatizirani cevovodi za uvajanje
- [ ] **Izvajanje skladnosti**: Izpolnjene zahteve za skladnost na ravni podjetja

### Časovnica učenja in mejniki

#### 1.–2. teden: Gradnja temeljev
- **Mejnik**: Uvedba prve AI aplikacije z uporabo AZD
- **Validacija**: Delujoča aplikacija dostopna prek javnega URL-ja
- **Veščine**: Osnovni delovni tokovi AZD in integracija AI storitev

#### 3.–4. teden: Obvladovanje konfiguracije
- **Mejnik**: Uvajanje v več okolij z varno avtentikacijo
- **Validacija**: Ista aplikacija uvedena v razvojno/testno/produkcijsko okolje
- **Veščine**: Upravljanje okolij in izvajanje varnosti

#### 5.–6. teden: Strokovnost infrastrukture
- **Mejnik**: Prilagojena predloga za kompleksno aplikacijo z več storitvami
- **
5. **Prispevek skupnosti**: Delite predloge ali izboljšave

#### Rezultati strokovnega razvoja
- **Projekti za portfelj**: 8 pripravljenih implementacij za produkcijo
- **Tehnične veščine**: Strokovno znanje o AZD in implementaciji AI na industrijskem nivoju
- **Sposobnost reševanja problemov**: Samostojno odpravljanje težav in optimizacija
- **Prepoznavnost v skupnosti**: Aktivno sodelovanje v Azure razvijalski skupnosti
- **Napredovanje v karieri**: Veščine, neposredno uporabne za delo v oblaku in AI

#### Merila uspeha
- **Stopnja uspešnosti implementacij**: >95% uspešnih implementacij
- **Čas odpravljanja težav**: <30 minut za pogoste težave
- **Optimizacija zmogljivosti**: Dokazljive izboljšave stroškov in zmogljivosti
- **Skladnost z varnostjo**: Vse implementacije ustrezajo varnostnim standardom podjetja
- **Prenos znanja**: Sposobnost mentoriranja drugih razvijalcev

### Nenehno učenje in vključevanje v skupnost

#### Ostanite na tekočem
- **Posodobitve Azure**: Spremljajte opombe ob izdaji Azure Developer CLI
- **Dogodki skupnosti**: Sodelujte na dogodkih za razvijalce Azure in AI
- **Dokumentacija**: Prispevajte k dokumentaciji in primerom skupnosti
- **Povratne informacije**: Podajte povratne informacije o vsebini tečaja in storitvah Azure

#### Razvoj kariere
- **Strokovna mreža**: Povežite se s strokovnjaki za Azure in AI
- **Priložnosti za govor**: Predstavite svoje znanje na konferencah ali srečanjih
- **Prispevek k odprti kodi**: Prispevajte k predlogam in orodjem AZD
- **Mentorstvo**: Vodite druge razvijalce pri njihovem učenju AZD

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Začnite z učenjem**: [Poglavje 1: Osnove in hiter začetek](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledenje napredku**: Spremljajte svoj napredek skozi celovit 8-poglavni učni sistem
- **🤝 Skupnost**: [Azure Discord](https://discord.gg/microsoft-azure) za podporo in razpravo

**Sledenje napredku pri učenju**: Uporabite to strukturirano vodilo za obvladovanje Azure Developer CLI z naprednim, praktičnim učenjem, merljivimi rezultati in koristmi za strokovni razvoj.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatski prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije je priporočljivo profesionalno človeško prevajanje. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
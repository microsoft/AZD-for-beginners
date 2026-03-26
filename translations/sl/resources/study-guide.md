# Vodnik za študij - Celoviti učni cilji

**Navigacija učne poti**
- **📚 Domov tečaja**: [AZD za začetnike](../README.md)
- **📖 Začni z učenjem**: [Poglavje 1: Osnove in hiter začetek](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledenje napredku**: [Dokončanje tečaja](../README.md#-course-completion--certification)

## Uvod

Ta celovit vodnik za študij ponuja strukturirane učne cilje, ključne koncepte, praktične vaje in gradiva za ocenjevanje, ki vam pomagajo obvladati Azure Developer CLI (azd). Uporabite ta vodnik za spremljanje svojega napredka in zagotovite, da ste preučili vse ključne teme.

## Cilji učenja

Z dokončanjem tega vodnika boste:
- Obvladali vse osnovne in napredne koncepte Azure Developer CLI
- Razvili praktične sposobnosti za uvajanje in upravljanje aplikacij v Azure
- Pridobili samozavest pri odpravljanju težav in optimizaciji uvajanj
- Razumeli prakse za produkcijsko pripravljena uvajanja in varnostne vidike

## Učni izidi

Po zaključku vseh razdelkov tega vodnika boste sposobni:
- Načrtovati, uvajati in upravljati celotne arhitekture aplikacij z uporabo azd
- Uvesti celovito spremljanje, varnost in strategije optimizacije stroškov
- Neodvisno odpraviti zapletene težave pri uvajanju
- Ustvarjati prilagojene predloge in prispevati v skupnost azd

## Učna struktura v 8 poglavjih

### Poglavje 1: Osnove in hiter začetek (1. teden)
**Trajanje**: 30-45 minut | **Težavnost**: ⭐

#### Učni cilji
- Razumeti osnovne pojme in terminologijo Azure Developer CLI
- Uspešno namestiti in konfigurirati AZD na svoji razvojni platformi
- Uvesti svojo prvo aplikacijo z uporabo obstoječe predloge
- Učinkovito krmariti po vmesniku ukazne vrstice AZD

#### Ključni pojmi za obvladati
- Struktura projekta AZD in komponente (azure.yaml, infra/, src/)
- Poteki uvajanja na osnovi predlog
- Osnove konfiguracije okolja
- Upravljanje skupin virov in naročnin

#### Praktične vaje
1. **Preverjanje namestitve**: Namestite AZD in preverite z `azd version`
2. **Prvo uvajanje**: Uspešno uvedite predlogo todo-nodejs-mongo
3. **Nastavitev okolja**: Konfigurirajte svoje prve spremenljivke okolja
4. **Raziskovanje virov**: Prebrskajte nameščene vire v Azure Portal

#### Vprašanja za ocenjevanje
- Katere so osnovne komponente projekta AZD?
- Kako inicializirate nov projekt iz predloge?
- Kakšna je razlika med `azd up` in `azd deploy`?
- Kako upravljate več okolij z AZD?

---

### Poglavje 2: AI-First Development (2. teden)
**Trajanje**: 1-2 uri | **Težavnost**: ⭐⭐

#### Učni cilji
- Integrirati Microsoft Foundry storitve v AZD poteke
- Uvesti in konfigurirati aplikacije, podprte z AI
- Razumeti vzorce implementacije RAG (Retrieval-Augmented Generation)
- Upravljati uvajanje in skaliranje AI modelov

#### Ključni pojmi za obvladati
- Integracija Microsoft Foundry Models storitve in upravljanje API-jev
- Konfiguracija AI Search in vektorsko indeksiranje
- Strategije uvajanja modelov in načrtovanje kapacitet
- Spremljanje in optimizacija zmogljivosti AI aplikacij

#### Praktične vaje
1. **Uvajanjski klepet z AI**: Uvedite predlogo azure-search-openai-demo
2. **Implementacija RAG**: Konfigurirajte indeksiranje in iskanje dokumentov
3. **Konfiguracija modelov**: Nastavite več AI modelov za različne namene
4. **Spremljanje AI**: Implementirajte Application Insights za AI delovne obremenitve

#### Vprašanja za ocenjevanje
- Kako konfigurirate Microsoft Foundry Models storitve v AZD predlogi?
- Katere so ključne komponente arhitekture RAG?
- Kako upravljate kapaciteto in skaliranje AI modelov?
- Kateri metri so pomembni za spremljanje AI aplikacij?

---

### Poglavje 3: Konfiguracija in avtentikacija (3. teden)
**Trajanje**: 45-60 minut | **Težavnost**: ⭐⭐

#### Učni cilji
- Obvladati strategije konfiguracije in upravljanja okolij
- Implementirati varne vzorce avtentikacije in upravljanih identitet
- Organizirati vire z ustreznimi konvencijami poimenovanja
- Konfigurirati uvajanja za več okolij (dev, staging, prod)

#### Ključni pojmi za obvladati
- Hierarhija okolij in prednost nastavitve konfiguracije
- Upravljana identiteta in avtentikacija s storitvenim principalom
- Integracija Key Vault za upravljanje skrivnosti
- Upravljanje parametrov, specifičnih za okolje

#### Praktične vaje
1. **Nastavitev več okolij**: Konfigurirajte dev, staging in prod okolja
2. **Varnostna konfiguracija**: Implementirajte avtentikacijo z upravljano identiteto
3. **Upravljanje skrivnosti**: Integrirajte Azure Key Vault za občutljive podatke
4. **Upravljanje parametrov**: Ustvarite konfiguracije, specifične za okolja

#### Vprašanja za ocenjevanje
- Kako konfigurirate različna okolja z AZD?
- Kakšne so prednosti uporabe upravljane identitete pred storitvenimi principalnimi?
- Kako varno upravljate skrivnosti aplikacij?
- Kakšna je hierarhija konfiguracije v AZD?

---

### Poglavje 4: Infrastruktura kot koda in uvajanje (4.–5. teden)
**Trajanje**: 1-1.5 ure | **Težavnost**: ⭐⭐⭐

#### Učni cilji
- Ustvarjati in prilagajati Bicep predloge za infrastrukturo
- Implementirati napredne vzorce in poteke uvajanja
- Razumeti strategije zagotavljanja virov
- Načrtovati skalabilne večstoritvene arhitekture

- Uvajati kontejnerizirane aplikacije z Azure Container Apps in AZD


#### Ključni pojmi za obvladati
- Struktura Bicep predloge in najboljše prakse
- Odvisnosti virov in vrstni red uvajanja
- Datoteke s parametri in modularnost predlog
- Prilagojeni hooks in avtomatizacija uvajanja
- Vzorce uvajanja container app (hitri začetek, produkcija, mikrostoritve)

#### Praktične vaje
1. **Ustvarjanje prilagojene predloge**: Zgradite predlogo večstoritvene aplikacije
2. **Obvladovanje Bicep**: Ustvarite modularne, ponovno uporabne komponente infrastrukture
3. **Avtomatizacija uvajanja**: Implementirajte pre/post uvajalne hooks
4. **Oblikovanje arhitekture**: Uvedite kompleksno arhitekturo mikrostoritev
5. **Uvajanje Container App**: Uvedite [Preprost Flask API](../../../examples/container-app/simple-flask-api) in [Arhitektura mikrostoritev](../../../examples/container-app/microservices) primere z uporabo AZD

#### Vprašanja za ocenjevanje
- Kako ustvarite prilagojene Bicep predloge za AZD?
- Kateri so najboljši pristopi za organizacijo kode infrastrukture?
- Kako obravnavate odvisnosti virov v predlogah?
- Kateri vzorci uvajanja podpirajo posodobitve brez izpada storitve?

---

### Poglavje 5: Rešitve z več agenti AI (6.–7. teden)
**Trajanje**: 2-3 ure | **Težavnost**: ⭐⭐⭐⭐

#### Učni cilji
- Načrtovati in implementirati arhitekture AI z več agenti
- Orkestrirati koordinacijo in komunikacijo agentov
- Uvesti produkcijsko pripravljene AI rešitve s spremljanjem
- Razumeti specializacijo agentov in vzorce toka dela
- Integrirati kontejnerizirane mikrostoritve kot del rešitev z več agenti

#### Ključni pojmi za obvladati
- Vzorce arhitekture z več agenti in načela oblikovanja
- Protokoli komunikacije agentov in tok podatkov
- Strategije uravnoteženja obremenitev in skaliranja za AI agente
- Produkcijsko spremljanje sistemov z več agenti
- Komunikacija med storitvami v kontejneriziranem okolju

#### Praktične vaje
1. **Uvajanje maloprodajne rešitve**: Uvedite celoten scenarij maloprodaje z več agenti
2. **Prilagoditev agentov**: Spremenite vedenje agentov za stranke in zaloge
3. **Skaliranje arhitekture**: Implementirajte uravnoteženje obremenitev in samodejno skaliranje
4. **Spremljanje produkcije**: Nastavite celovito spremljanje in opozarjanje
5. **Integracija mikrostoritev**: Razširite primer [Arhitektura mikrostoritev](../../../examples/container-app/microservices), da podpira poteke dela na osnovi agentov

#### Vprašanja za ocenjevanje
- Kako zasnujete učinkovite vzorce komunikacije med več agenti?
- Kateri so ključni premisleki za skaliranje obremenitev AI agentov?
- Kako spremljate in razhroščujete sisteme z več agenti AI?
- Kateri produkcijski vzorci zagotavljajo zanesljivost agentov AI?

---

### Poglavje 6: Preverjanje in načrtovanje pred uvajanjem (8. teden)
**Trajanje**: 1 ura | **Težavnost**: ⭐⭐

#### Učni cilji
- Izvesti celovito načrtovanje kapacitet in preverjanje virov
- Izbrati optimalne Azure SKU-je za stroškovno učinkovitost
- Implementirati avtomatizirane predletne preglede in validacijo
- Načrtovati uvajanja s strategijami optimizacije stroškov

#### Ključni pojmi za obvladati
- Kvote virov Azure in omejitve kapacitet
- Kriteriji izbire SKU-jev in optimizacija stroškov
- Avtomatizirani skripti za validacijo in testiranje
- Načrtovanje uvajanja in ocena tveganj

#### Praktične vaje
1. **Analiza kapacitet**: Analizirajte zahteve po virih za vaše aplikacije
2. **Optimizacija SKU-jev**: Primerjajte in izberite stroškovno učinkovite ravni storitev
3. **Avtomatizacija validacije**: Implementirajte skripte za pred-uvajalne preglede
4. **Načrtovanje stroškov**: Ustvarite ocene stroškov uvajanja in proračune

#### Vprašanja za ocenjevanje
- Kako preverite kapacitete v Azure pred uvajanjem?
- Kateri dejavniki vplivajo na odločitve izbire SKU-jev?
- Kako avtomatizirate pred-uvajalno validacijo?
- Katere strategije pomagajo optimizirati stroške uvajanja?

---

### Poglavje 7: Odpravljanje napak in razhroščevanje (9. teden)
**Trajanje**: 1-1.5 ure | **Težavnost**: ⭐⭐

#### Učni cilji
- Razviti sistematične pristope k razhroščevanju AZD uvajanj
- Reševati pogoste napake pri uvajanju in konfiguraciji
- Razhroščevati težave, specifične za AI, in težave z zmogljivostjo
- Implementirati spremljanje in opozarjanje za proaktivno zaznavanje težav

#### Ključni pojmi za obvladati
- Diagnostične tehnike in strategije beleženja
- Pogosti vzorci napak in njihovi rešitve
- Spremljanje zmogljivosti in optimizacija
- Postopki odziva na incidente in obnovitve

#### Praktične vaje
1. **Diagnostične spretnosti**: Vadite na namensko pokvarjenih uvajanjih
2. **Analiza dnevnikov**: Uporabite Azure Monitor in Application Insights učinkovito
3. **Izboljšanje zmogljivosti**: Optimizirajte aplikacije, ki delujejo počasi
4. **Postopki obnovitve**: Implementirajte varnostne kopije in načrte za obnovo po katastrofi

#### Vprašanja za ocenjevanje
- Katake so najpogostejše napake pri uvajanju z AZD?
- Kako razhroščujete avtentikacijske in dovolilne težave?
- Katere strategije spremljanja pomagajo preprečiti težave v produkciji?
- Kako optimizirate zmogljivost aplikacij v Azure?

---

### Poglavje 8: Produkcija in podjetniški vzorci (10.–11. teden)
**Trajanje**: 2-3 ure | **Težavnost**: ⭐⭐⭐⭐

#### Učni cilji
- Implementirati strategije uvajanja primerno za podjetja
- Načrtovati varnostne vzorce in okvirje skladnosti
- Uvesti spremljanje, upravljanje in nadzor stroškov
- Ustvariti skalabilne CI/CD pipeline z integracijo AZD
- Uporabiti najboljše prakse za produkcijsko uvajanje container app (varnost, spremljanje, stroški, CI/CD)

#### Ključni pojmi za obvladati
- Zahteve podjetniške varnosti in skladnosti
- Okviri upravljanja in implementacija politik
- Napredno spremljanje in upravljanje stroškov
- Integracija CI/CD in avtomatizirani pipelines za uvajanje
- Strategije blue-green in canary za kontejnerizirane delovne obremenitve

#### Praktične vaje
1. **Podjetniška varnost**: Implementirajte celovite varnostne vzorce
2. **Okvir upravljanja**: Nastavite Azure Policy in upravljanje virov
3. **Napredno spremljanje**: Ustvarite nadzorne plošče in avtomatizirano opozarjanje
4. **Integracija CI/CD**: Zgradite avtomatizirane pipeline za uvajanje
5. **Produkcijske Container Apps**: Uporabite varnost, spremljanje in optimizacijo stroškov na primeru [Arhitektura mikrostoritev](../../../examples/container-app/microservices)

#### Vprašanja za ocenjevanje
- Kako implementirate podjetniško varnost pri AZD uvajanju?
- Kateri vzorci upravljanja zagotavljajo skladnost in nadzor stroškov?
- Kako načrtujete skalabilno spremljanje za produkcijske sisteme?
- Kateri CI/CD vzorci najbolje delujejo z AZD poteki?

#### Učni cilji
- Razumeti osnove Azure Developer CLI in temeljne koncepte
- Uspešno namestiti in konfigurirati azd na vašem razvojnih okolju
- Dokončati prvo uvajanje z obstoječo predlogo
- Krmariti po strukturi projekta azd in razumeti ključne komponente

#### Ključni pojmi za obvladati
- Predloge, okolja in storitve
- Struktura konfiguracije azure.yaml
- Osnovni azd ukazi (init, up, down, deploy)
- Načela Infrastrukture kot kode
- Avtentikacija in avtorizacija v Azure

#### Praktične vaje

**Vaja 1.1: Namestitev in nastavitev**
```bash
# Dokončajte te naloge:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Vaja 1.2: Prvo uvajanje**
```bash
# Razmestitev preproste spletne aplikacije:
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

#### Vprašanja za samopresojo
1. Kateri so trije osnovni koncepti arhitekture azd?
2. Kaj je namen datoteke azure.yaml?
3. Kako okolja pomagajo pri upravljanju različnih ciljev uvajanja?
4. Katere metode avtentikacije je mogoče uporabiti z azd?
5. Kaj se zgodi, ko prvič zaženete `azd up`?

---

## Sledenje napredku in ocenjevalni okvir
```bash
# Ustvarite in konfigurirajte več okolij:
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

**Vaja 2.3: Varnostna konfiguracija**
```bash
# Uvedite najboljše varnostne prakse:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Vprašanja za samopresojo
1. Kako azd obravnava prednost nastavitev spremenljivk okolja?
2. Kaj so deployment hooks in kdaj jih uporabite?
3. Kako konfigurirate različne SKU-je za različna okolja?
4. Kakšne so varnostne posledice različnih metod avtentikacije?
5. Kako upravljate skrivnosti in občutljive konfiguracijske podatke?

### Modul 3: Uvajanje in zagotavljanje (4. teden)

#### Učni cilji
- Obvladati poteke uvajanja in najboljše prakse
- Razumeti Infrastrukturo kot kodo z Bicep predlogami
- Implementirati kompleksne večstoritvene arhitekture
- Optimizirati zmogljivost in zanesljivost uvajanja

#### Ključni pojmi za obvladati
- Struktura Bicep predlog in moduli
- Odvisnosti virov in vrstni red
- Strategije uvajanja (blue-green, rolling updates)
- Uvajanja v več regijah
- Migracije baz podatkov in upravljanje podatkov

#### Praktične vaje

**Vaja 3.1: Prilagojena infrastruktura**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Vaja 3.2: Večstoritvena aplikacija**
```bash
# Razmestite arhitekturo mikrostoritev:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Vaja 3.3: Integracija baz podatkov**
```bash
# Implementirajte vzorce nameščanja baze podatkov:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Vprašanja za samopresojo
1. Katere so prednosti uporabe Bicep pred ARM predlogami?
2. Kako obravnavate migracije baz podatkov v azd uvajanjih?
3. Katere strategije obstajajo za uvajanja brez izpada storitve?
4. Kako upravljate odvisnosti med storitvami?
5. Kateri so premisleki za uvajanja v več regijah?

### Modul 4: Preverjanje pred uvajanjem (5. teden)
- Izvedite obsežna predhodna preverjanja pred uvajanjem
- Obvladujte načrtovanje zmogljivosti in preverjanje virov
- Razumite izbiro SKU in optimizacijo stroškov
- Zgradite avtomatizirane cevovode za validacijo

#### Ključni koncepti za obvladovanje
- Kvote in omejitve virov Azure
- Kriteriji izbire SKU in posledice za stroške
- Avtomatizirani skripti in orodja za validacijo
- Metodologije načrtovanja zmogljivosti
- Preskušanje zmogljivosti in optimizacija

#### Praktične vaje

**Vaja 4.1: Načrtovanje zmogljivosti**
```bash
# Implementiraj preverjanje zmogljivosti:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Vaja 4.2: Predhodna preverjanja**
```powershell
# Vzpostavite celovit postopek validacije:
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

#### Vprašanja za samooceno
1. Kateri dejavniki bi morali vplivati na odločitve pri izbiri SKU?
2. Kako preverite razpoložljivost Azure virov pred uvajanjem?
3. Kateri so ključni sestavni deli sistema za predhodno preverjanje (pre-flight)?
4. Kako ocenite in nadzorujete stroške uvajanja?
5. Katero spremljanje je bistveno za načrtovanje zmogljivosti?

### Modul 5: Odpravljanje težav in razhroščevanje (6. teden)

#### Cilji učenja
- Obvladati sistematične metodologije za odpravljanje težav
- Razviti strokovnost pri razhroščevanju zapletenih težav pri uvajanju
- Implementirati obsežno spremljanje in sprotno obveščanje
- Zgraditi postopke odzivanja na incidente in okrevanja

#### Ključni koncepti za obvladovanje
- Pogosti vzorci napak pri nameščanju
- Tehnike analize dnevnikov in korelacije
- Spremljanje zmogljivosti in optimizacija
- Odkrivanje in odzivanje na varnostne incidente
- Obnovitev po katastrofi in poslovna kontinuiteta

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

**Vaja 5.2: Implementacija spremljanja**
```bash
# Vzpostavite celovito spremljanje:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Vaja 5.3: Odzivanje na incidente**
```bash
# Vzpostavite postopke za odzivanje na incidente:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Vprašanja za samooceno
1. Kakšen je sistematičen pristop k odpravljanju težav pri nameščanju z azd?
2. Kako korelirate dnevnike med več storitvami in viri?
3. Kateri metri spremljanja so najbolj kritični za zgodnje zaznavanje težav?
4. Kako implementirate učinkovite postopke obnovitve po katastrofi?
5. Kateri so ključni sestavni deli načrta odzivanja na incidente?

### Modul 6: Napredne teme in najboljše prakse (tedna 7-8)

#### Cilji učenja
- Implementirati vzorce uvajanja za raven podjetja
- Obvladati integracijo CI/CD in avtomatizacijo
- Razviti prilagojene predloge in prispevati v skupnost
- Razumeti napredne varnostne in skladnostne zahteve

#### Ključni koncepti za obvladovanje
- Vzorci integracije CI/CD cevovodov
- Razvoj in distribucija prilagojenih predlog
- Upravljanje in skladnost na ravni podjetja
- Napredne omrežne in varnostne konfiguracije
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

**Vaja 6.3: Implementacija za podjetje**
```bash
# Uvedite funkcije na ravni podjetja:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Vprašanja za samooceno
1. Kako integrirate azd v obstoječe CI/CD delovne tokove?
2. Kateri so ključni vidiki pri razvoju prilagojenih predlog?
3. Kako implementirate upravljanje in skladnost v azd uvajanjih?
4. Katere so najboljše prakse za uvajanja v merilu podjetja?
5. Kako učinkovit prispevate k skupnosti azd?

## Praktični projekti

### Projekt 1: Osebna spletna stran portfelja
**Zapletenost**: Začetnik  
**Trajanje**: 1–2 tedna

Zgradite in uvajajte osebno spletno stran portfelja z uporabo:
- Gostovanje statične spletne strani na Azure Storage
- Konfiguracija lastne domene
- Integracija CDN za globalno zmogljivost
- Avtomatiziran cevovod za uvajanje

**Dobave**:
- Delujoča spletna stran nameščena na Azure
- Prilagojena azd predloga za uvajanje portfelja
- Dokumentacija postopka uvajanja
- Analiza stroškov in priporočila za optimizacijo

### Projekt 2: Aplikacija za upravljanje opravil
**Zapletenost**: Vmesno  
**Trajanje**: 2–3 tedne

Ustvarite celostno aplikacijo za upravljanje opravil z:
- React frontend, nameščen v App Service
- Node.js API backend z avtentikacijo
- PostgreSQL baza s prenosi (migrations)
- Spremljanje z Application Insights

**Dobave**:
- Celovita aplikacija z uporabniško avtentikacijo
- Shema baze podatkov in skripti za migracije
- Nadzorne plošče za spremljanje in pravila opozarjanja
- Konfiguracija uvajanja za več okolij

### Projekt 3: Platforma za e-trgovino na osnovi mikrostoritev
**Zapletenost**: Napredno  
**Trajanje**: 4–6 tednov

Načrtujte in implementirajte platformo za e-trgovino na osnovi mikrostoritev:
- Več API storitev (katalog, naročila, plačila, uporabniki)
- Integracija čakalnih vrst sporočil s Service Bus
- Redis predpomnilnik za optimizacijo zmogljivosti
- Obsežno beleženje in spremljanje

**Referenčni primer**: Oglejte si [Arhitektura mikrostoritev](../../../examples/container-app/microservices) za predlogo in vodnik za uvajanje, primeren za produkcijsko rabo

**Dobave**:
- Celotna arhitektura mikrostoritev
- Vzorci medstoritvenega komuniciranja
- Preskušanje zmogljivosti in optimizacija
- Produkcijsko pripravljena varnostna implementacija

## Preskusi in certifikacija

### Preverjanje znanja

Dokončajte te ocene po vsakem modulu:

**Ocena Modula 1**: Osnovni koncepti in namestitev
- Več možnosti vprašanj o osnovnih konceptih
- Praktične naloge namestitve in konfiguracije
- Preprost primer uvajanja

**Ocena Modula 2**: Konfiguracija in okolja
- Scenariji upravljanja okolij
- Naloge za odpravljanje težav s konfiguracijo
- Implementacija varnostne konfiguracije

**Ocena Modula 3**: Uvajanje in zagotavljanje virov
- Izzivi pri oblikovanju infrastrukture
- Scenariji uvajanja več storitev
- Vaje za optimizacijo zmogljivosti

**Ocena Modula 4**: Predhodna validacija pred uvajanjem
- Študije primerov načrtovanja zmogljivosti
- Scenariji optimizacije stroškov
- Implementacija validacijskega cevovoda

**Ocena Modula 5**: Odpravljanje težav in razhroščevanje
- Vaje za diagnostiko problemov
- Naloge za implementacijo spremljanja
- Simulacije odzivanja na incidente

**Ocena Modula 6**: Napredne teme
- Oblikovanje CI/CD cevovodov
- Razvoj prilagojenih predlog
- Scenariji arhitekture podjetja

### Zaključni projekt (Capstone)

Načrtujte in izvedite celovito rešitev, ki dokazuje obvladovanje vseh konceptov:

**Zahteve**:
- Večplastna aplikacijska arhitektura
- Več okolij za uvajanje
- Obsežno spremljanje in obveščanje
- Implementacija varnosti in skladnosti
- Optimizacija stroškov in zmogljivosti
- Popolna dokumentacija in rokopisi (runbooks)

**Kriteriji ocenjevanja**:
- Kakovost tehnične implementacije
- Popolnost dokumentacije
- Upoštevanje varnosti in najboljših praks
- Optimizacija zmogljivosti in stroškov
- Učinkovitost pri odpravljanju težav in spremljanju

## Študijski viri in reference

### Uradna dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Skupnostni viri
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Praktična okolja
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Dodatna orodja
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Priporočila študijskega urnika

### Celodnevni študij (8 tednov)
- **Tedna 1-2**: Modula 1-2 (Uvod, Konfiguracija)
- **Tedna 3-4**: Modula 3-4 (Uvajanje, Pred-uvajanje)
- **Tedna 5-6**: Modula 5-6 (Odpravljanje težav, Napredne teme)
- **Tedna 7-8**: Praktični projekti in zaključna ocena

### Študij s krajšim delovnim časom (16 tednov)
- **Tedni 1-4**: Modul 1 (Uvod)
- **Tedni 5-7**: Modul 2 (Konfiguracija in okolja)
- **Tedni 8-10**: Modul 3 (Uvajanje in zagotavljanje virov)
- **Tedni 11-12**: Modul 4 (Predhodna validacija)
- **Tedni 13-14**: Modul 5 (Odpravljanje težav in razhroščevanje)
- **Tedni 15-16**: Modul 6 (Napredne teme in ocenjevanje)

---

## Okvir za spremljanje napredka in ocenjevanje

### Kontrolni seznam za dokončanje poglavij

Spremljajte svoj napredek po posameznih poglavjih z naslednjimi merljivimi rezultati:

#### 📚 Poglavje 1: Osnove in hiter začetek
- [ ] **Namestitev dokončana**: AZD nameščen in preverjen na vaši platformi
- [ ] **Prvo uvajanje**: Uspešno nameščen todo-nodejs-mongo template
- [ ] **Nastavitev okolja**: Konfigurirane osnovne okoljske spremenljivke
- [ ] **Navigacija virov**: Raziskali nameščene vire v Azure Portal
- [ ] **Obvladovanje ukazov**: Priročnost z osnovnimi AZD ukazi

#### 🤖 Poglavje 2: Razvoj, osredotočen na AI
- [ ] **Uvajanje AI predloge**: Uspešno nameščen azure-search-openai-demo
- [ ] **Implementacija RAG**: Konfigurirano indeksiranje in pridobivanje dokumentov
- [ ] **Konfiguracija modelov**: Nastavljeni različni AI modeli za različne namene
- [ ] **Spremljanje AI**: Implementiran Application Insights za AI delovne obremenitve
- [ ] **Optimizacija zmogljivosti**: Nastavili in optimizirali delovanje AI aplikacije

#### ⚙️ Poglavje 3: Konfiguracija in avtentikacija
- [ ] **Nastavitev več okolij**: Konfigurirana dev, staging in prod okolja
- [ ] **Implementacija varnosti**: Nastavljena overitev z upravljano identiteto
- [ ] **Upravljanje skrivnosti**: Integriran Azure Key Vault za občutljive podatke
- [ ] **Upravljanje parametrov**: Ustvarjene konfiguracije specifične za okolja
- [ ] **Obvladovanje avtentikacije**: Implementirani varni vzorci dostopa

#### 🏗️ Poglavje 4: Infrastruktura kot koda in uvajanje
- [ ] **Ustvarjanje prilagojene predloge**: Zgrajena predloga za večstoritevno aplikacijo
- [ ] **Obvladovanje Bicep**: Ustvarjene modularne, ponovno uporabne infrastrukturne komponente
- [ ] **Avtomatizacija uvajanja**: Implementirani pre/post uvajalni hooks
- [ ] **Oblikovanje arhitekture**: Nameščena kompleksna mikrostoritevna arhitektura
- [ ] **Optimizacija predlog**: Optimizirane predloge za zmogljivost in stroške

#### 🎯 Poglavje 5: Rešitve z več agenti AI
- [ ] **Uvajanje maloprodajne rešitve**: Nameščeno celovito večagentno maloprodajno scenarijo
- [ ] **Prilagoditev agentov**: Spremenjene obnašanja agentov za stranke in zaloge
- [ ] **Širjenje arhitekture**: Implementirano uravnoteženje obremenitve in samodejno skaliranje
- [ ] **Spremljanje v produkciji**: Nastavljeno obsežno spremljanje in opozarjanje
- [ ] **Optimizacija zmogljivosti**: Optimizirano delovanje sistema z več agenti

#### 🔍 Poglavje 6: Predhodna validacija in načrtovanje
- [ ] **Analiza zmogljivosti**: Analizirane zahteve virov za aplikacije
- [ ] **Optimizacija SKU**: Izbrani stroškovno učinkoviti nivoji storitev
- [ ] **Avtomatizacija validacije**: Implementirani skripti za pred-uvajanje
- [ ] **Načrt stroškov**: Ustvarjene ocene stroškov uvajanja in proračuni
- [ ] **Ocena tveganj**: Identificirana in ublažena tveganja uvajanja

#### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje
- [ ] **Diagnostične spretnosti**: Uspešno razhroščili namerno okvarjene namestitve
- [ ] **Analiza dnevnikov**: Uporabili Azure Monitor in Application Insights učinkovito
- [ ] **Optimizacija zmogljivosti**: Optimizirali počasne aplikacije
- [ ] **Postopki okrevanja**: Implementirali varnostne kopije in obnovitvene postopke
- [ ] **Nastavitev spremljanja**: Ustvarili proaktivno spremljanje in opozarjanje

#### 🏢 Poglavje 8: Produkcija in vzorci podjetja
- [ ] **Varnost podjetja**: Implementirani obsežni varnostni vzorci
- [ ] **Okvir upravljanja**: Nastavljen Azure Policy in upravljanje virov
- [ ] **Napredno spremljanje**: Ustvarjene nadzorne plošče in avtomatizirano opozarjanje
- [ ] **Integracija CI/CD**: Zgrajeni avtomatizirani cevovodi za uvajanje
- [ ] **Izpolnjevanje skladnosti**: Izpolnjene zahteve skladnosti na ravni podjetja

### Časovni načrt učenja in mejniki

#### Teden 1-2: Gradnja temeljev
- **Mejnik**: Nameščena prva AI aplikacija z uporabo AZD
- **Preverjanje**: Delujoča aplikacija dostopna prek javnega URL-ja
- **Spretnosti**: Osnovni AZD delovni tokovi in integracija AI storitev

#### Teden 3-4: Obvladovanje konfiguracije
- **Mejnik**: Večokolnično uvajanje z varno avtentikacijo
- **Preverjanje**: Enaka aplikacija nameščena v dev/staging/prod
- **Spretnosti**: Upravljanje okolij in implementacija varnosti

#### Teden 5-6: Strokovnost infrastrukture
- **Mejnik**: Prilagojena predloga za kompleksno večstoritevno aplikacijo
- **Preverjanje**: Ponovno uporabna predloga, nameščena s strani drugega člana ekipe
- **Spretnosti**: Obvladovanje Bicep in avtomatizacija infrastrukture

#### Teden 7-8: Napredna implementacija AI
- **Mejnik**: Produkcijsko-pripravljena večagentna AI rešitev
- **Preverjanje**: Sistem obvladuje realno obremenitev s spremljanjem
- **Spretnosti**: Orkestracija več agentov in optimizacija zmogljivosti

#### Teden 9-10: Priprava na produkcijo
- **Mejnik**: Uvajanje za raven podjetja s popolno skladnostjo
- **Preverjanje**: Opravljen varnostni pregled in revizija optimizacije stroškov
- **Spretnosti**: Upravljanje, spremljanje in integracija CI/CD

### Metode preverjanja znanja
1. **Praktična uvajanja**: Delujoče aplikacije za vsako poglavje
2. **Pregledi kode**: Ocenjevanje kakovosti predlog in konfiguracij
3. **Reševanje problemov**: Scenariji odpravljanja težav in rešitve
4. **Poučevanje vrstnikov**: Razložite koncepte drugim učencem
5. **Prispevek skupnosti**: Delite predloge ali izboljšave

### Poklicni razvojni izidi
- **Projekti portfelja**: 8 implementacij pripravljenih za produkcijo
- **Tehnične veščine**: Strokovno znanje za uvajanje AZD in AI po industrijskih standardih
- **Sposobnosti reševanja problemov**: Samostojno odpravljanje napak in optimizacija
- **Priznanje v skupnosti**: Aktivno sodelovanje v skupnosti razvijalcev Azure
- **Napredovanje v karieri**: Sposobnosti neposredno uporabne za vloge v oblaku in AI

#### Merila uspeha
- **Stopnja uspešnosti uvajanja**: >95% uspešnih uvajanj
- **Čas odpravljanja težav**: <30 minut za pogoste težave
- **Optimizacija zmogljivosti**: Dokazljive izboljšave stroškov in zmogljivosti
- **Skladnost z varnostnimi zahtevami**: Vse implementacije izpolnjujejo varnostne standarde podjetja
- **Prenos znanja**: Sposobnost mentoriranja drugih razvijalcev

### Stalno učenje in sodelovanje v skupnosti

#### Ostanite na tekočem
- **Posodobitve Azure**: Spremljajte opombe ob izdajah Azure Developer CLI
- **Dogodki skupnosti**: Sodelujte na dogodkih razvijalcev Azure in AI
- **Dokumentacija**: Prispevajte k dokumentaciji in primerom skupnosti
- **Povratne informacije**: Zagotovite povratne informacije o vsebini tečaja in storitvah Azure

#### Razvoj kariere
- **Profesionalna mreža**: Povežite se s strokovnjaki za Azure in AI
- **Priložnosti za nastop**: Predstavite pridobljeno znanje na konferencah ali srečanjih
- **Prispevek odprte kode**: Prispevajte k predlogam in orodjem AZD
- **Mentorstvo**: Vodite druge razvijalce na njihovi poti učenja AZD

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Začni z učenjem**: [Poglavje 1: Osnove in hiter začetek](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledenje napredku**: Spremljajte svoj napredek skozi celovit sistem učenja s 8 poglavji
- **🤝 Skupnost**: [Azure Discord](https://discord.gg/microsoft-azure) za podporo in razpravo

**Sledenje napredku študija**: Uporabite ta strukturiran vodič za obvladovanje Azure Developer CLI z progresivnim, praktičnim učenjem, ki prinaša merljive rezultate in koristi za strokovni razvoj.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Nismo odgovorni za morebitna nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
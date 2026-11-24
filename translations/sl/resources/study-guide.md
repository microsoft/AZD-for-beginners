# Vodnik za učenje - Celoviti učni cilji

**Navigacija učne poti**
- **📚 Domov tečaja**: [AZD za začetnike](../README.md)
- **📖 Začni z učenjem**: [Poglavje 1: Osnove in hiter začetek](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledenje napredku**: [Zaključek tečaja](../README.md#-course-completion--certification)

## Uvod

Ta celovit vodnik za učenje ponuja strukturirane učne cilje, ključne koncepte, praktične vaje in ocenjevalne materiale, ki vam pomagajo obvladati Azure Developer CLI (azd). Uporabite ta vodnik za sledenje vašemu napredku in zagotovitev, da ste pokrili vse bistvene teme.

## Cilji učenja

Z dokončanjem tega vodnika boste:
- Obvladali vse temeljne in napredne koncepte Azure Developer CLI
- Razvili praktične spretnosti pri nameščanju in upravljanju Azure aplikacij
- Pridobili samozavest pri odpravljanju težav in optimizaciji nameščanja
- Razumeli prakse nameščanja pripravljene za produkcijo in varnostne vidike

## Izidi učenja

Po zaključku vseh razdelkov tega vodnika boste zmogli:
- Načrtovati, nameščati in upravljati celotne arhitekture aplikacij z uporabo azd
- Izvajati celovite strategije za spremljanje, varnost in optimizacijo stroškov
- Samostojno odpraviti kompleksne težave pri nameščanju
- Ustvarjati prilagojene predloge in prispevati v azd skupnost

## Učna struktura v 8 poglavjih

### Poglavje 1: Osnove in hiter začetek (1. teden)
**Trajanje**: 30-45 minut | **Zahtevnost**: ⭐

#### Učni cilji
- Razumeti temeljne pojme in terminologijo Azure Developer CLI
- Uspešno namestiti in konfigurirati AZD na razvojni platformi
- Namestiti svojo prvo aplikacijo s pomočjo obstoječe predloge
- Učinkovito krmariti po AZD ukazni vrstici

#### Ključni koncepti za obvladovanje
- Struktura AZD projekta in njegove sestavine (azure.yaml, infra/, src/)
- Delovni tokovi nameščanja, ki temeljijo na predlogah
- Osnove konfiguracije okolja
- Upravljanje skupin virov in naročnin

#### Praktične vaje
1. **Preverjanje namestitve**: Namestite AZD in preverite z `azd version`
2. **Prvo nameščanje**: Uspešno namestite predlogo todo-nodejs-mongo
3. **Nastavitev okolja**: Konfigurirajte svoje prve spremenljivke okolja
4. **Raziskovanje virov**: Krmarite po nameščenih virih v Azure portalu

#### Vprašanja za ocenjevanje
- Kateri so osnovni sestavni deli AZD projekta?
- Kako inicializirate nov projekt iz predloge?
- Kakšna je razlika med `azd up` in `azd deploy`?
- Kako upravljate več okolj z AZD?

---

### Poglavje 2: AI-prvi razvoj (2. teden)
**Trajanje**: 4-5 ur vključno z delavnico | **Zahtevnost**: ⭐⭐

#### Učni cilji
- Integrirati Microsoft Foundry storitve z AZD delovnimi tokovi
- Uporabiti GA `microsoft.foundry` paket z AZD 1.37.0+ za razvoj gostovanega agenta
- Namestiti in konfigurirati AI-pogonjene aplikacije
- Razumeti vzorce implementacije RAG (generiranje s podpiranjem z iskanjem)
- Upravljati nameščanje in skaliranje AI modelov

#### Ključni koncepti za obvladovanje
- Integracija Microsoft Foundry Models in upravljanje API
- Konfiguracija AI iskanja in vektorsko indeksiranje
- Strategije nameščanja modelov in načrtovanje zmogljivosti
- Spremljanje AI aplikacij in optimizacija delovanja
- Lokalni agent inspector v primerjavi z oblaki sledmi, nameščanjem izvorne kode in evaluacijskimi sredstvi v nadzoru različic

#### Praktične vaje
1. **Nameščanje AI klepeta**: Namestite predlogo azure-search-openai-demo
2. **Implementacija RAG**: Konfigurirajte indeksiranje in pridobivanje dokumentov
3. **Konfiguracija modela**: Nastavite več AI modelov z različnimi nameni
4. **Spremljanje AI**: Uvedite Application Insights za AI delovne obremenitve
5. **GA gostovani agent**: Sledite [vodiču po gostovanem agentu](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); primerjajte lokalne in oblačne odzive, preglejte rezultat evalvacije in preverite lastništvo čiščenja

#### Vprašanja za ocenjevanje
- Kako konfigurirate Microsoft Foundry Models storitve v AZD predlogi?
- Kateri so ključni sestavni deli RAG arhitekture?
- Kako upravljate zmogljivost in skaliranje AI modelov?
- Kateri metri spremljanja so pomembni za AI aplikacije?
- Katere razširitve so vključene v `microsoft.foundry` in zakaj so ocene nameščene ločeno?
- Zakaj lokalni testi agenta še vedno povzročajo stroške Azure modelov?
- Kaj `azd down` pusti za sabo, ko ponovno uporabite obstoječi Foundry projekt?

---

### Poglavje 3: Konfiguracija in overjanje (3. teden)
**Trajanje**: 45-60 minut | **Zahtevnost**: ⭐⭐

#### Učni cilji
- Obvladati strategije konfiguracije in upravljanja okolij
- Uvesti varne vzorce overjanja in upravljane identitete
- Organizirati vire z ustreznimi pravili poimenovanja
- Konfigurirati nameščanja v več okoljih (razvoj, testiranje, produkcija)

#### Ključni koncepti za obvladovanje
- Hierarhija okolij in prednostna konfiguracija
- Overjanje z upravljano identiteto in storitvenim glavnim računom
- Integracija Key Vault za upravljanje skrivnosti
- Upravljanje parametrov, specifičnih za okolje

#### Praktične vaje
1. **Nastavitev več okolj**: Konfigurirajte razvojno, testno in produkcijsko okolje
2. **Varnostna konfiguracija**: Uvedite overjanje z upravljano identiteto
3. **Upravljanje skrivnosti**: Integrirajte Azure Key Vault za občutljive podatke
4. **Upravljanje parametrov**: Ustvarite konfiguracije za posamezna okolja

#### Vprašanja za ocenjevanje
- Kako konfigurirate različna okolja z AZD?
- Kakšne so prednosti uporabe upravljane identitete pred storitvenimi glavnimi računi?
- Kako varno upravljate skrivnosti aplikacije?
- Kakšna je hierarhija konfiguracije v AZD?

---

### Poglavje 4: Infrastruktura kot koda in nameščanje (4.-5. teden)
**Trajanje**: 1-1,5 ure | **Zahtevnost**: ⭐⭐⭐

#### Učni cilji
- Ustvariti in prilagoditi Bicep predloge infrastrukture
- Uvesti napredne vzorce nameščanja in delovne tokove
- Razumeti strategije zagotavljanja virov
- Načrtovati razširljive arhitekture z več storitvami

- Namestiti kontejnerizirane aplikacije z Azure Container Apps in AZD


#### Ključni koncepti za obvladovanje
- Struktura Bicep predlog in najboljše prakse
- Odvisnosti virov in zaporedje nameščanja
- Datoteke s parametri in modularnost predlog
- Prilagojeni hooks in avtomatizacija nameščanja
- Vzorce nameščanja kontejnerskih aplikacij (hiter začetek, produkcija, mikroservisi)

#### Praktične vaje
1. **Ustvarjanje prilagojene predloge**: Zgradite predlogo aplikacije z več storitvami
2. **Obvladovanje Bicepa**: Ustvarite modularne, ponovno uporabne infrastrukturne komponente
3. **Avtomatizacija nameščanja**: Uvedite hooks pred in po nameščanju
4. **Oblikovanje arhitekture**: Namestite kompleksno mikroservisno arhitekturo
5. **Nameščanje kontejnerske aplikacije**: Namestite primere [Preprost Flask API](../../../examples/container-app/simple-flask-api) in [Mikroservisne arhitekture](../../../examples/container-app/microservices) z uporabo AZD

#### Vprašanja za ocenjevanje
- Kako ustvarite prilagojene Bicep predloge za AZD?
- Katere so najboljše prakse za organizacijo kode infrastrukture?
- Kako ravnate z odvisnostmi virov v predlogah?
- Kateri vzorci nameščanja podpirajo posodobitve brez izpadov?

---

### Poglavje 5: Večagentne AI rešitve (6.-7. teden)
**Trajanje**: 2-3 ure | **Zahtevnost**: ⭐⭐⭐⭐

#### Učni cilji
- Načrtovati in izvajati večagentne AI arhitekture
- Usmerjati koordinacijo in komunikacijo agentov
- Namestiti produkcijske AI rešitve s spremljanjem
- Razumeti specializacijo agentov in vzorce delovnih tokov
- Integrirati kontejnerizirane mikroservise kot del večagentnih rešitev

#### Ključni koncepti za obvladovanje
- Vzorci arhitekture za več agentov in načela oblikovanja
- Protokoli komunikacije agentov in potek podatkov
- Strategije uravnoteženja obremenitve in skaliranja AI agentov
- Produkcijsko spremljanje večagentnih sistemov
- Medstoritvena komunikacija v kontejneriziranih okoljih

#### Praktične vaje
1. **Pregled arhitekture za maloprodajo**: Analizirajte načrt za maloprodajo in določite, kateri sestavni deli aplikacije morajo biti implementirani pred nameščanjem
2. **Prilagajanje agentov**: Spremenite vedenje agentov za stranke in zaloge
3. **Skaliranje arhitekture**: Uvedite uravnoteženje obremenitve in avtoskaliranje
4. **Spremljanje produkcije**: Nastavite celovito spremljanje in opozorila
5. **Integracija mikroservisov**: Razširite primer [Mikroservisne arhitekture](../../../examples/container-app/microservices) za podporo delovnim tokom, ki temeljijo na agentih

#### Vprašanja za ocenjevanje
- Kako načrtujete učinkovite vzorce komunikacije več agentov?
- Kateri so ključni dejavniki pri skaliranju delovnih obremenitev AI agentov?
- Kako spremljate in odpravljate napake v večagentnih AI sistemih?
- Kateri proizvodni vzorci zagotavljajo zanesljivost AI agentov?

---

### Poglavje 6: Validacija in načrtovanje pred nameščanjem (8. teden)
**Trajanje**: 1 ura | **Zahtevnost**: ⭐⭐

#### Učni cilji
- Izvesti celovito načrtovanje zmogljivosti in validacijo virov
- Izbrati optimalne Azure SKU-je za stroškovno učinkovitost
- Uvesti avtomatizirane predhodne preglede in validacijo
- Načrtovati nameščanja z strategijami optimizacije stroškov

#### Ključni koncepti za obvladovanje
- Kvote virov Azure in omejitve zmogljivosti
- Kriteriji izbire SKU-jev in optimizacija stroškov
- Avtomatizirani validacijski skripti in testiranje
- Načrtovanje nameščanja in ocena tveganj

#### Praktične vaje
1. **Analiza zmogljivosti**: Analizirajte zahteve po virih za svoje aplikacije
2. **Optimizacija SKU-jev**: Primerjajte in izberite stroškovno učinkovite storitvene nivoje
3. **Avtomatizacija validacije**: Uvedite skripte za prednameščanje
4. **Načrtovanje stroškov**: Ustvarite ocene stroškov nameščanja in proračune

#### Vprašanja za ocenjevanje
- Kako validirate Azure zmogljivost pred nameščanjem?
- Kateri dejavniki vplivajo na odločitve pri izbiri SKU-jev?
- Kako avtomatizirate predhodno validacijo nameščanja?
- Katere strategije pomagajo optimizirati stroške nameščanja?

---

### Poglavje 7: Odpravljanje težav in razhroščevanje (9. teden)
**Trajanje**: 1-1,5 ure | **Zahtevnost**: ⭐⭐

#### Učni cilji
- Razviti sistematične pristope k razhroščevanju AZD nameščenj
- Reševati pogoste težave z nameščanjem in konfiguracijo
- Razhroščevati AI-specifične težave in težave z zmogljivostjo
- Uvesti spremljanje in opozarjanje za proaktivno zaznavanje težav

#### Ključni koncepti za obvladovanje
- Diagnostične tehnike in strategije beleženja
- Pogosti vzorci napak in njihovi rešitve
- Spremljanje in optimizacija zmogljivosti
- Postopki odziva na incidente in okrevanja

#### Praktične vaje
1. **Diagnostične veščine**: Vadba z namerno pokvarjenimi nameščanji
2. **Analiza dnevnikov**: Uporaba Azure Monitor in Application Insights učinkovito
3. **Optimizacija zmogljivosti**: Izboljšajte delovanje počasnih aplikacij
4. **Postopki okrevanja**: Uvedite varnostne kopije in obnovitev po nesrečah

#### Vprašanja za ocenjevanje
- Kateri so najpogostejši razlogi za napake pri AZD nameščanju?
- Kako razhroščujete težave z overjanjem in dovoljenji?
- Kateri sistemi spremljanja pomagajo preprečiti produkcijske težave?
- Kako optimizirate delovanje aplikacij v Azure?

---

### Poglavje 8: Produkcijski in podjetniški vzorci (10.-11. teden)
**Trajanje**: 2-3 ure | **Zahtevnost**: ⭐⭐⭐⭐

#### Učni cilji
- Uvesti strategije nameščanja na ravni podjetja
- Načrtovati varnostne vzorce in okvire skladnosti
- Ustanoviti spremljanje, upravljanje in nadzor stroškov
- Ustvariti razširljive CI/CD pipe z integracijo AZD
- Uporabiti najboljše prakse za produkcijska nameščanja kontejnerskih aplikacij (varnost, spremljanje, stroški, CI/CD)

#### Ključni koncepti za obvladovanje
- Zahteve podjetniške varnosti in skladnosti
- Okviri upravljanja in izvajanje politik
- Napredno spremljanje in upravljanje stroškov
- CI/CD integracija in avtomatizirani nameščevalni pipelini
- Vzorci nameščanja blue-green in canary za kontejnerizirane delovne obremenitve

#### Praktične vaje
1. **Podjetniška varnost**: Uvedite celovite varnostne vzorce
2. **Okvir upravljanja**: Nastavite Azure Policy in upravljanje virov
3. **Napredno spremljanje**: Ustvarite nadzorne plošče in avtomatizirana opozorila
4. **CI/CD integracija**: Zgradite avtomatizirane pipeline za nameščanje
5. **Proizvodni Container Apps**: Uporabite varnost, spremljanje in optimizacijo stroškov za [Arhitektura mikrostoritev](../../../examples/container-app/microservices) primer

#### Vprašanja za ocenjevanje
- Kako vpeljete podjetniško varnost v AZD nameščanjih?
- Kateri vzorci upravljanja zagotavljajo skladnost in nadzor stroškov?
- Kako oblikujete razširljivo spremljanje za proizvodne sisteme?
- Kateri CI/CD vzorci najbolje delujejo z AZD delovnimi tokovi?

#### Cilji učenja
- Razumeti osnovne koncepte in temeljne pojme Azure Developer CLI
- Uspešno namestiti in konfigurirati azd v vašem razvojnem okolju
- Dokončati svojo prvo namestitev z uporabo obstoječe predloge
- Premikati se po strukturi projekta azd in razumeti ključne komponente

#### Ključni koncepti za obvladovanje
- Predloge, okolja in storitve
- Struktura konfiguracije azure.yaml
- Osnovna azd ukaza (init, up, down, deploy)
- Načela infrastrukture kot kode
- Azure avtorizacija in avtorizacija

#### Vaje za prakso

**Vaja 1.1: Namestitev in nastavitev**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Vaja 1.2: Prva namestitev**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
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

#### Vprašanja za samoocenjevanje
1. Kateri so trije osnovni koncepti arhitekture azd?
2. Kakšen je namen datoteke azure.yaml?
3. Kako okolja pomagajo upravljati različne cilje namestitve?
4. Katere metode preverjanja pristnosti je mogoče uporabiti z azd?
5. Kaj se zgodi, ko prvič zaženete `azd up`?

---

## Okvir za sledenje napredku in ocenjevanje
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Vaja 2.2: Napredna konfiguracija**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Vaja 2.3: Varnostna konfiguracija**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Vprašanja za samopreizkus
1. Kako azd upravlja s prednostjo okolijskih spremenljivk?
2. Kaj so namestitveni kaveljci in kdaj jih morate uporabiti?
3. Kako konfigurirati različne SKU-je za različna okolja?
4. Kakšne varnostne posledice imajo različni načini preverjanja pristnosti?
5. Kako upravljate s skrivnostmi in občutljivimi konfiguracijskimi podatki?

### Modul 3: Namestitev in oskrba (4. teden)

#### Cilji učenja
- Obvladati delovne tokove namestitve in najboljše prakse
- Razumeti infrastrukturo kot kodo s predlogami Bicep
- Implementirati kompleksne večstoritevne arhitekture
- Optimizirati zmogljivost in zanesljivost namestitve

#### Ključni pojmi za obvladati
- Struktura predloge Bicep in moduli
- Odvisnosti virov in vrstni red
- Strategije namestitve (modro-zelena, postopne posodobitve)
- Namestitve v več regijah
- Migracije podatkovnih baz in upravljanje podatkov

#### Vaje za prakso

**Vaja 3.1: Po meri prilagojena infrastruktura**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Vaja 3.2: Večstoritevna aplikacija**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Vaja 3.3: Integracija podatkovne baze**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Vprašanja za samooceno
1. Kakšne so prednosti uporabe Bicepa v primerjavi z ARM predlogami?
2. Kako obravnavate migracije podatkovnih baz pri nameščanju z azd?
3. Katere strategije obstajajo za nameščanja brez izpadov?
4. Kako upravljate odvisnosti med storitvami?
5. Kakšna so razmišljanja glede nameščanja v več regijah?

### Modul 4: Validacija pred nameščanjem (5. teden)

#### Cilji učenja
- Izvedite celovite preglede pred nameščanjem
- Obvladujte načrtovanje zmogljivosti in preverjanje virov
- Razumite izbiro SKU in optimizacijo stroškov
- Zgradite avtomatizirane preverjalne cevovode

#### Ključni pojmi za osvojitev
- Kvote in omejitve virov Azure
- Merila za izbiro SKU in vpliv na stroške
- Avtomatizirani preverjalni skripti in orodja
- Metode načrtovanja zmogljivosti
- Testiranje zmogljivosti in optimizacija

#### Vaje za prakso

**Vaja 4.1: Načrtovanje zmogljivosti**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Vaja 4.2: Preverjanje pred zagonom**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Vaja 4.3: Optimizacija SKU**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Vprašanja za samooceno
1. Kateri dejavniki bi morali vplivati na odločitve pri izbiri SKU?
2. Kako preverite razpoložljivost virov Azure pred nameščanjem?
3. Kateri so ključni sestavni deli sistema preverjanja pred zagonom?
4. Kako ocenjujete in nadzorujete stroške nameščanja?
5. Katero spremljanje je bistveno za načrtovanje zmogljivosti?

### Modul 5: Odkrivanje in odpravljanje napak (6. teden)

#### Cilji učenja
- Obvladujte sistematične metode odpravljanja težav
- Razvijte strokovnost pri odpravljanju zapletenih težav z nameščanjem
- Izvedite celovito spremljanje in alarmiranje
- Zgradite postopke za odziv na incidente in obnovo

#### Ključni pojmi za osvojitev
- Pogosti vzorci napak pri nameščanju
- Analiza dnevnikov in tehnike korelacije
- Spremljanje zmogljivosti in optimizacija
- Zaznavanje in odzivanje na varnostne incidente
- Obnova po katastrofi in neprekinjeno poslovanje

#### Vaje za prakso

**Vaja 5.1: Scenariji odpravljanja težav**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Vaja 5.2: Implementacija spremljanja**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Vaja 5.3: Odziv na incidente**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Vprašanja za samooceno
1. Kakšen je sistematičen pristop k odpravljanju težav pri nameščanju z azd?
2. Kako korelirate dnevnike med več storitvami in viri?
3. Kateri merilniki spremljanja so najbolj ključni za zgodnje odkrivanje težav?
4. Kako izvedete učinkovite postopke za obnovo po katastrofi?
5. Kateri so ključni sestavni deli načrta odziva na incidente?

### Modul 6: Napredne teme in najboljše prakse (7.-8. teden)

#### Cilji učenja
- Izvedite poslovne vzorce nameščanja na ravni podjetja
- Obvladujte integracijo in avtomatizacijo CI/CD
- Razvijajte lastne predloge in prispevajte skupnosti
- Razumite napredne varnostne in skladnostne zahteve

#### Ključni pojmi za osvojitev
- Vzorce integracije CI/CD cevovodov
- Razvoj in distribucija prilagojenih predlog
- Upravljanje podjetja in skladnost
- Napredne omrežne in varnostne konfiguracije
- Optimizacija zmogljivosti in upravljanje stroškov

#### Vaje za prakso

**Vaja 6.1: Integracija CI/CD**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Vaja 6.2: Razvoj prilagojenih predlog**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Vaja 6.3: Implementacija v podjetju**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Vprašanja za samooceno
1. Kako integrirate azd v obstoječe delovne procese CI/CD?
2. Katera so ključna razmišljanja za razvoj prilagojenih predlog?
3. Kako izvedete upravljanje in skladnost v nameščanju z azd?
4. Katere so najboljše prakse za nameščanja na ravni podjetja?
5. Kako učinkovito prispevate k skupnosti azd?

## Praktični projekti

### Projekt 1: Osebna portfeljska spletna stran
**Zahtevnost**: Začetnik  
**Trajanje**: 1-2 tedna

Ustvarite in namestite osebno portfeljsko spletno stran z uporabo:
- Gostovanje statične spletne strani na Azure Storage
- Konfiguracija prilagojene domene
- Integracija CDN za globalno zmogljivost
- Avtomatiziran cevovod za nameščanje

**Dobave**:
- Delujoča spletna stran nameščena na Azure
- Prilagojena azd predloga za nameščanje portfelja
- Dokumentacija procesa nameščanja
- Analiza stroškov in priporočila za optimizacijo

### Projekt 2: Aplikacija za upravljanje opravil
**Zahtevnost**: Srednja  
**Trajanje**: 2-3 tedne

Ustvarite celovito aplikacijo za upravljanje opravil z:
- Frontend v React, nameščen v App Service
- Backend API v Node.js z avtentikacijo
- Podatkovno bazo PostgreSQL z migracijami
- Spremljanje z Application Insights

**Dobave**:
- Celovita aplikacija z uporabniško avtentikacijo
- Shema podatkovne baze in migracijski skripti
- Nadzorne plošče za spremljanje in pravila alarmiranja
- Konfiguracija za več okolij nameščanja

### Projekt 3: Platforma za e-trgovino s mikro-storitvami
**Zahtevnost**: Napredno  
**Trajanje**: 4-6 tednov

Oblikujte in izvedite platformo za e-trgovino na osnovi mikro-storitev:
- Več API storitev (katalog, naročila, plačila, uporabniki)
- Integracija sporočilnega čakalnika z Service Bus
- Redis predpomnilnik za optimizacijo zmogljivosti
- Celovito beleženje in spremljanje

**Referenčni primer**: Oglejte si [Arhitekturo mikro-storitev](../../../examples/container-app/microservices) za vzorčni primer dvoslužbene učenja in navodila za nameščanje. Čakalniki, vzdrževanje, avtentikacija, obdelava plačil in utrjevanje produkcije so ločeni projekti.

**Dobave**:
- Celovita arhitektura mikro-storitev
- Vzorci komunikacije med storitvami
- Testiranje zmogljivosti in optimizacija
- Produkcijsko varna izvedba varnosti

## Vrednotenje in certifikacija

### Preverjanja znanja

Izvedite te preglede po vsakem modulu:

**Vrednotenje modula 1**: Osnovni pojmi in namestitev
- VPrašanja z več izbirami o ključnih konceptih
- Praktične naloge namestitve in konfiguracije
- Preprosta vaja nameščanja

**Vrednotenje modula 2**: Konfiguracija in okolja
- Scenariji upravljanja okolij
- Vaje za odpravljanje težav s konfiguracijo
- Izvedba varnostne konfiguracije

**Vrednotenje modula 3**: Nameščanje in zagotavljanje
- Izzivi načrtovanja infrastrukture
- Scenariji nameščanja z več storitvami
- Vaje za optimizacijo zmogljivosti

**Vrednotenje modula 4**: Validacija pred nameščanjem
- Študije primerov načrtovanja zmogljivosti
- Scenariji optimizacije stroškov
- Izvedba preverjalnih cevovodov

**Vrednotenje modula 5**: Odkrivanje in odpravljanje napak
- Vaje za diagnostiko težav
- Naloge za implementacijo spremljanja
- Simulacije odziva na incidente

**Vrednotenje modula 6**: Napredne teme
- Oblikovanje CI/CD cevovodov
- Razvoj prilagojenih predlog
- Scenariji arhitekture podjetja

### Zaključni glavni projekt

Oblikujte in izvedite celovito rešitev, ki pokaže obvladovanje vseh konceptov:

**Zahteve**:
- Večnivojska arhitektura aplikacije
- Več okolij za nameščanje
- Celovito spremljanje in alarmiranje
- Izvedba varnosti in skladnosti
- Optimizacija stroškov in nastavitev zmogljivosti
- Popolna dokumentacija in priročniki

**Kriteriji ocenjevanja**:
- Tehnična kakovost izvedbe
- Popolnost dokumentacije
- Upoštevanje varnosti in najboljših praks
- Optimizacija zmogljivosti in stroškov
- Učinkovitost odpravljanja težav in spremljanja

## Študijski viri in reference

### Uradna dokumentacija
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Dokumentacija Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Viri skupnosti
- [Galerija predlog AZD](https://azure.github.io/awesome-azd/)
- [Organizacija Azure-Samples na GitHubu](https://github.com/Azure-Samples)
- [GitHub repozitorij Azure Developer CLI](https://github.com/Azure/azure-dev)

### Praktična okolja
- [Brezplačen Azure račun](https://azure.microsoft.com/free/)
- [Brezplačni nivo Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Dodatna orodja
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Paket razširitev za Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Priporočila študijskega urnika

### Redno študijsko obdobje (8 tednov)
- **Tedni 1-2**: Moduli 1-2 (Uvod, konfiguracija)
- **Tedni 3-4**: Moduli 3-4 (Nameščanje, pred-nameščanje)
- **Tedni 5-6**: Moduli 5-6 (Odpravljanje težav, napredne teme)
- **Tedni 7-8**: Praktični projekti in zaključna ocena

### Delo občasno (16 tednov)
- **Tedni 1-4**: Modul 1 (Uvod)
- **Tedni 5-7**: Modul 2 (Konfiguracija in okolja)
- **Tedni 8-10**: Modul 3 (Nameščanje in zagotavljanje)
- **Tedni 11-12**: Modul 4 (Validacija pred nameščanjem)
- **Tedni 13-14**: Modul 5 (Odpravljanje težav in odpravljanje napak)
- **Tedni 15-16**: Modul 6 (Napredne teme in vrednotenje)

---

## Okvir sledenja napredku in ocenjevanja

### Kontrolni seznam dokončanja poglavij

Spremljajte svoj napredek skozi vsako poglavje s temi merljivimi rezultati:

#### 📚 Poglavje 1: Osnove in hiter začetek
- [ ] **Namestitev končana**: AZD nameščen in preverjen na vaši platformi
- [ ] **Prvo nameščanje**: Uspešno nameščena predloga todo-nodejs-mongo
- [ ] **Nastavitev okolja**: Konfigurirane začetne spremenljivke okolja
- [ ] **Ravnanje z viri**: Raziskane nameščene vire v Azure portalu
- [ ] **Obvladovanje ukazov**: Udomačeni z osnovnimi AZD ukazi

#### 🤖 Poglavje 2: Razvoj z AI na prvem mestu  
- [ ] **Nameščanje AI predloge**: Uspešno nameščena azure-search-openai-demo
- [ ] **Izvedba RAG**: Konfigurirano indeksiranje in pridobivanje dokumentov
- [ ] **Nastavitev modelov**: Nastavljenih več AI modelov z različnimi nameni
- [ ] **Spremljanje AI**: Implementiran Application Insights za AI delovne obremenitve
- [ ] **Optimizacija zmogljivosti**: Nastavljena zmogljivost AI aplikacije

#### ⚙️ Poglavje 3: Konfiguracija in avtentikacija
- [ ] **Nastavitev več okolij**: Konfigurirana razvojna, preizkusna in produkcijska okolja
- [ ] **Izvedba varnosti**: Nastavljena avtentikacija z upravljano identiteto
- [ ] **Upravljanje skrivnosti**: Integriran Azure Key Vault za občutljive podatke
- [ ] **Upravljanje parametrov**: Ustvarjene konfiguracije za posamezna okolja
- [ ] **Obvladovanje avtentikacije**: Implementirani varni vzorci dostopa

#### 🏗️ Poglavje 4: Infrastruktura kot koda in nameščanje
- [ ] **Ustvarjanje prilagojenih predlog**: Zgrajena predloga za večstoritevno aplikacijo
- [ ] **Obvladovanje Bicepa**: Ustvarjeni modularni, ponovno uporabni infrastrukturni elementi
- [ ] **Avtomatizacija nameščanja**: Implementirani pred in po nameščanju
- [ ] **Načrtovanje arhitekture**: Nameščena kompleksna mikro-storitvena arhitektura
- [ ] **Optimizacija predlog**: Optimizirane predloge za zmogljivost in stroške

#### 🎯 Poglavje 5: Rešitve AI z več agenti
- [ ] **Pregled arhitekture maloprodaje**: Identificirane manjkajoče sestavine aplikacije in načrt njihove izvedbe ter validacije
- [ ] **Prilagoditev agentov**: Spremenjeno vedenje agentov za stranke in zaloge
- [ ] **Razširljivost arhitekture**: Implementirano uravnoteženje obremenitve in avtomatsko skaliranje
- [ ] **Spremljanje produkcije**: Nastavljeno celovito spremljanje in alarmiranje
- [ ] **Nastavitev zmogljivosti**: Optimizirana zmogljivost sistema z več agenti

#### 🔍 Poglavje 6: Validacija in načrtovanje pred nameščanjem
- [ ] **Analiza zmogljivosti**: Analizirane zahteve virov za aplikacije
- [ ] **Optimizacija SKU**: Izbrane stroškovno učinkovite stopnje storitev
- [ ] **Avtomatizacija validacije**: Implementirani skripti za preverjanje pred nameščanjem
- [ ] **Načrtovanje stroškov**: Ustvarjene ocene stroškov nameščanja in proračuni
- [ ] **Ocenjevanje tveganj**: Identificirana in ublažena tveganja nameščanja

#### 🚨 Poglavje 7: Odkrivanje in odpravljanje napak
- [ ] **Diagnostične veščine**: Uspešno odpravljene namensko pokvarjene nameščanja
- [ ] **Analiza dnevnikov**: Uporabljeno Azure Monitor in Application Insights učinkovito
- [ ] **Optimizacija zmogljivosti**: Optimizirane počasi delujoče aplikacije
- [ ] **Postopki obnove**: Implementirano varnostno kopiranje in obnova po katastrofi
- [ ] **Nastavitev spremljanja**: Ustvarjeno proaktivno spremljanje in alarmiranje

#### 🏢 Poglavje 8: Produkcijski in podjetniški vzorci
- [ ] **Podjetniška varnost**: Implementirani celoviti varnostni vzorci
- [ ] **Okvir upravljanja**: Nastavljena Azure politika in upravljanje virov
- [ ] **Napredno spremljanje**: Ustvarjene nadzorne plošče in avtomatizirano alarmiranje
- [ ] **Integracija CI/CD**: Zgrajeni avtomatizirani cevovodi nameščanja
- [ ] **Izvedba skladnosti**: Izpolnjene zahteve poslovne skladnosti

### Časovni načrt učenja in mejniki

#### Tedna 1-2: Gradnja temeljev
- **Mejnik**: Nameščena prva AI aplikacija z uporabo AZD
- **Validacija**: Delujoča aplikacija dostopna preko javnega URL
- **Veščine**: Osnovni delovni postopki AZD in integracija AI storitev

#### Tedna 3-4: Obvladovanje konfiguracije
- **Mejnik**: Večokoljsko nameščanje z varno avtentikacijo
- **Validacija**: Enaka aplikacija nameščena v razvojno/preizkusno/produkcijsko okolje
- **Veščine**: Upravljanje okolij in izvedba varnosti

#### Tedna 5-6: Strokovnost infrastrukture
- **Mejnik**: Prilagojena predloga za kompleksno večstoritevno aplikacijo
- **Validacija**: Ponovno uporabna predloga nameščena s strani drugega člana ekipe
- **Veščine**: Obvladovanje Bicepa in avtomatizacija infrastrukture

#### Tedna 7-8: Napredna izvedba AI
- **Mejnik**: Produkcijsko pripravljena rešitev AI z več agenti
- **Validacija**: Sistem, ki obvladuje resnične obremenitve s spremljanjem
- **Veščine**: Orkestracija več agentov in optimizacija zmogljivosti

#### Tedna 9-10: Pripravljenost za produkcijo
- **Mejnik**: Podjetniško nameščanje z izpolnitvijo vseh zahtev
- **Validacija**: Izpolnjene varnostne preglede in revizijo optimizacije stroškov
- **Veščine**: Upravljanje, spremljanje in integracija CI/CD

### Vrednotenje in certifikacija

#### Metode preverjanja znanja
1. **Praktične implementacije**: Delujoče aplikacije za vsak razdelek
2. **Pregledi kode**: Ocena kakovosti predlog in konfiguracij
3. **Reševanje problemov**: Scenariji in rešitve za odpravljanje težav
4. **Poučevanje vrstnikov**: Razlaga konceptov drugim učencem
5. **Prispevek skupnosti**: Deljenje predlog ali izboljšav

#### Rezultati poklicnega razvoja
- **Projekti v portfelju**: Učenje implementacij in arhitekturnih vaj; pripravljenost za produkcijo zahteva ločeno izvedbo in pregled
- **Tehnične veščine**: Strokovno znanje standardnih industrijskih AZD in AI implementacij
- **Sposobnosti reševanja problemov**: Samostojno odkrivanje in optimizacija težav
- **Priznanje v skupnosti**: Aktivno sodelovanje v razvijalski skupnosti Azure
- **Napredovanje v karieri**: Veščine, neposredno uporabne za vloge v oblaku in AI

#### Merila uspeha
- **Stopnja uspešnosti implementacij**: >95 % uspešnih implementacij
- **Čas odpravljanja težav**: <30 minut za običajne težave
- **Optimizacija zmogljivosti**: Dokazane izboljšave pri stroških in zmogljivosti
- **Varnostni pregled**: Dokumentiranje kontrol in preostalih vrzeli glede na zahteve vaše organizacije; zaključek tečaja ne potrjuje skladnosti
- **Prenos znanja**: Sposobnost mentoriranja drugih razvijalcev

### Neprestano učenje in sodelovanje v skupnosti

#### Ostani na tekočem
- **Azure posodobitve**: Spremljajte izdaje Azure Developer CLI
- **Skupnostni dogodki**: Sodelujte na dogodkih Azure in AI razvijalcev
- **Dokumentacija**: Prispevajte v dokumentacijo in primere skupnosti
- **Povratne informacije**: Podajte povratne informacije o vsebini tečaja in storitvah Azure

#### Razvoj kariere
- **Profesionalno omrežje**: Povežite se z Azure in AI strokovnjaki
- **Priložnosti za nastop**: Predstavite pridobljeno znanje na konferencah ali srečanjih
- **Prispevek odprti kodi**: Prispevajte k AZD predlogam in orodjem
- **Mentorstvo**: Usmerjajte druge razvijalce na njihovi poti učenja AZD

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../README.md)
- **📖 Začni z učenjem**: [Poglavje 1: Osnove in hitro začetek](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledenje napredku**: Spremljajte svoj napredek skozi celovit osem-poglavni sistem učenja
- **🤝 Skupnost**: [Azure Discord](https://discord.gg/microsoft-azure) za podporo in razprave

**Sledenje napredku študija**: Uporabite ta strukturiran vodič za obvladovanje Azure Developer CLI z naprednim, praktičnim učenjem z merljivimi rezultati in koristmi za poklicni razvoj.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
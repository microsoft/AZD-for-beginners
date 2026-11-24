# Studijski vodič - Sveobuhvatni ciljevi učenja

**Navigacija kroz put učenja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Početak učenja**: [Poglavlje 1: Osnove i Brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Praćenje napretka**: [Završetak tečaja](../README.md#-course-completion--certification)

## Uvod

Ovaj sveobuhvatni studijski vodič pruža strukturirane ciljeve učenja, ključne koncepte, praktične vježbe i materijale za procjenu kako bi vam pomogao da savladate Azure Developer CLI (azd). Koristite ovaj vodič za praćenje svog napretka i osigurajte da ste pokrili sve bitne teme.

## Ciljevi učenja

Završetkom ovog studijskog vodiča, moći ćete:
- Savladati sve temeljne i napredne koncepte Azure Developer CLI
- Razviti praktične vještine u implementaciji i upravljanju Azure aplikacijama
- Izgraditi samopouzdanje u rješavanju problema i optimizaciji implementacija
- Razumjeti prakse implementacije spremne za produkciju i sigurnosne aspekte

## Ishodi učenja

Nakon završetka svih dijelova ovog studijskog vodiča, moći ćete:
- Dizajnirati, implementirati i upravljati cjelovitim arhitekturama aplikacija koristeći azd
- Primijeniti sveobuhvatne strategije nadzora, sigurnosti i optimizacije troškova
- Samostalno rješavati složene probleme implementacije
- Kreirati prilagođene predloške i doprinositi azd zajednici

## Struktura učenja kroz 8 poglavlja

### Poglavlje 1: Osnove & Brzi početak (Tjedan 1)
**Trajanje**: 30-45 minuta | **Složenost**: ⭐

#### Ciljevi učenja
- Razumjeti temeljne koncepte i terminologiju Azure Developer CLI
- Uspješno instalirati i konfigurirati AZD na vašoj razvojnoj platformi
- Implementirati svoju prvu aplikaciju koristeći postojeći predložak
- Efektivno navigirati AZD sučeljem naredbenog retka

#### Ključni koncepti za savladati
- Struktura i komponente AZD projekta (azure.yaml, infra/, src/)
- Radni tokovi implementacije na temelju predložaka
- Osnove konfiguracije okoline
- Upravljanje grupama resursa i pretplatama

#### Praktične vježbe
1. **Provjera instalacije**: Instalirajte AZD i provjerite pomoću `azd version`
2. **Prva implementacija**: Uspješno implementirajte todo-nodejs-mongo predložak
3. **Postavljanje okoline**: Konfigurirajte svoje prve varijable okoline
4. **Istraživanje resursa**: Pregledajte implementirane resurse u Azure Portalu

#### Pitanja za procjenu
- Koje su ključne komponente AZD projekta?
- Kako inicijalizirati novi projekt iz predloška?
- Koja je razlika između `azd up` i `azd deploy`?
- Kako upravljati višestrukim okolinama pomoću AZD?

---

### Poglavlje 2: AI-prvo programiranje (Tjedan 2)
**Trajanje**: 4-5 sati uključujući radionicu | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Integrirati Microsoft Foundry usluge u AZD radne tokove
- Koristiti GA `microsoft.foundry` paket s AZD verzijom 1.37.0+ za razvoj s hostiranim agentom
- Implementirati i konfigurirati AI-pokretane aplikacije
- Razumjeti obrasce implementacije RAG (Retrieval-Augmented Generation)
- Upravljati implementacijama i skaliranjem AI modela

#### Ključni koncepti za savladati
- Integracija i upravljanje API-jem Microsoft Foundry Models usluge
- Konfiguracija AI pretraživanja i vektorsko indeksiranje
- Strategije implementacije modela i planiranje kapaciteta
- Praćenje AI aplikacija i optimizacija performansi
- Lokalni Agent Inspector nasuprot tragovima u cloudu, implementacija iz izvornog koda i kontrola evaluacijskih resursa u verzioniranju

#### Praktične vježbe
1. **Implementacija AI chata**: Implementirajte azure-search-openai-demo predložak
2. **RAG implementacija**: Konfigurirajte indeksiranje i dohvat dokumenata
3. **Konfiguracija modela**: Postavite višestruke AI modele za različite svrhe
4. **Praćenje AI-a**: Implementirajte Application Insights za AI radna opterećenja
5. **GA hostirani agent**: Slijedite [upute za hostirani agent](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); usporedite lokalne i cloud odgovore, pregledajte rezultat evaluacije i provjerite vlasništvo čišćenja

#### Pitanja za procjenu
- Kako konfigurirati Microsoft Foundry Models usluge u AZD predlošku?
- Koje su ključne komponente RAG arhitekture?
- Kako upravljati kapacitetom i skaliranjem AI modela?
- Koje metrike praćenja su važne za AI aplikacije?
- Koji su dodaci uključeni u `microsoft.foundry`, i zašto se evaluacije instaliraju zasebno?
- Zašto lokalni testovi agenta i dalje generiraju troškove Azure modela?
- Što `azd down` ostavlja nakon ponovne upotrebe postojećeg Foundry projekta?

---

### Poglavlje 3: Konfiguracija & Autentikacija (Tjedan 3)
**Trajanje**: 45-60 minuta | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Savladati strategije konfiguracije i upravljanja okolinama
- Implementirati sigurnosne obrasce autentikacije i upravljanog identiteta
- Organizirati resurse pravilnim konvencijama imenovanja
- Konfigurirati višestruke okoline implementacije (razvoj, test, produkcija)

#### Ključni koncepti za savladati
- Hijerarhija okoline i prednost konfiguracije
- Upravljani identitet i autentikacija servisnog računa
- Integracija Key Vault-a za upravljanje tajnama
- Upravljanje parametrima specifičnim za okolinu

#### Praktične vježbe
1. **Postavljanje višestrukih okolina**: Konfigurirajte razvojne, testne i produkcijske okoline
2. **Sigurnosna konfiguracija**: Implementirajte autentikaciju upravljanim identitetom
3. **Upravljanje tajnama**: Integrirajte Azure Key Vault za osjetljive podatke
4. **Upravljanje parametrima**: Kreirajte konfiguracije specifične za okoline

#### Pitanja za procjenu
- Kako konfigurirati različite okoline pomoću AZD?
- Koje su prednosti korištenja upravljanog identiteta u odnosu na servisne račune?
- Kako sigurno upravljati tajnama aplikacija?
- Koja je hijerarhija konfiguracije u AZD?

---

### Poglavlje 4: Infrastruktura kao kod & Implementacija (Tjedan 4-5)
**Trajanje**: 1-1.5 sati | **Složenost**: ⭐⭐⭐

#### Ciljevi učenja
- Kreirati i prilagoditi Bicep predloške infrastrukture
- Implementirati napredne obrasce i radne tokove implementacije
- Razumjeti strategije za dodjeljivanje resursa
- Dizajnirati skalabilne višeservisne arhitekture

- Implementirati aplikacije u kontejnerima koristeći Azure Container Apps i AZD


#### Ključni koncepti za savladati
- Struktura Bicep predložaka i najbolje prakse
- Ovisnosti resursa i redoslijed implementacije
- Datoteke s parametrima i modularnost predložaka
- Prilagođeni hookovi i automatizacija implementacije
- Obrasci implementacije aplikacija u kontejnerima (brzi početak, produkcija, mikroservisi)

#### Praktične vježbe
1. **Izrada prilagođenog predloška**: Izradite predložak za višeservisnu aplikaciju
2. **Ovladavanje Bicepom**: Kreirajte modularne, ponovno upotrebljive komponente infrastrukture
3. **Automatizacija implementacije**: Implementirajte hookove prije i poslije implementacije
4. **Dizajn arhitekture**: Implementirajte složenu mikroservisnu arhitekturu
5. **Implementacija aplikacije u kontejneru**: Implementirajte primjere [Simple Flask API](../../../examples/container-app/simple-flask-api) i [Microservices Architecture](../../../examples/container-app/microservices) koristeći AZD

#### Pitanja za procjenu
- Kako kreirati prilagođene Bicep predloške za AZD?
- Koje su najbolje prakse za organizaciju infrastrukturalnog koda?
- Kako upravljati ovisnostima resursa u predlošcima?
- Koji obrasci implementacije podržavaju ažuriranja bez zastoja?

---

### Poglavlje 5: Više-agentna AI rješenja (Tjedan 6-7)
**Trajanje**: 2-3 sata | **Složenost**: ⭐⭐⭐⭐

#### Ciljevi učenja
- Dizajnirati i implementirati AI arhitekture s više agenata
- Orkestrirati koordinaciju i komunikaciju agenata
- Implementirati produkcijska AI rješenja s nadzorom
- Razumjeti specijalizaciju agenata i obrasce radnih tokova
- Integrirati kontejnerizirane mikroservise kao dio multi-agentnih rješenja

#### Ključni koncepti za savladati
- Obrasci arhitekture više agenata i dizajnerska načela
- Protokoli komunikacije agenata i protok podataka
- Strategije balansiranja opterećenja i skaliranja AI agenata
- Praćenje produkcije za sustave s više agenata
- Komunikacija servis-servis u kontejneriziranim okruženjima

#### Praktične vježbe
1. **Pregled maloprodajne arhitekture**: Analizirajte plan maloprodaje i odredite koje komponente aplikacija treba implementirati prije implementacije
2. **Prilagodba agenata**: Modificirajte ponašanja agenata Customer i Inventory
3. **Skaliranje arhitekture**: Implementirajte balansiranje opterećenja i automatsko skaliranje
4. **Praćenje produkcije**: Postavite sveobuhvatni nadzor i upozorenja
5. **Integracija mikroservisa**: Proširite primjer [Microservices Architecture](../../../examples/container-app/microservices) kako biste podržali radne tokove bazirane na agentima

#### Pitanja za procjenu
- Kako dizajnirati učinkovite obrasce komunikacije više agenata?
- Koji su ključni čimbenici za skaliranje AI radnih opterećenja agenata?
- Kako pratiti i otkloniti pogreške u AI sustavima s više agenata?
- Koji obrasci produkcije osiguravaju pouzdanost AI agenata?

---

### Poglavlje 6: Validacija i planiranje prije implementacije (Tjedan 8)
**Trajanje**: 1 sat | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Izvesti sveobuhvatno planiranje kapaciteta i validaciju resursa
- Odabrati optimalne Azure SKU-ove za isplativost
- Implementirati automatizirane pre-flight provjere i validacije
- Planirati implementacije uz strategije optimizacije troškova

#### Ključni koncepti za savladati
- Kvote resursa i ograničenja kapaciteta u Azureu
- Kriteriji odabira SKU-a i optimizacija troškova
- Automatizirani skripti za validaciju i testiranje
- Planiranje implementacije i procjena rizika

#### Praktične vježbe
1. **Analiza kapaciteta**: Analizirajte zahtjeve za resursima za svoje aplikacije
2. **Optimizacija SKU-a**: Usporedite i odaberite isplative slojeve usluga
3. **Automatizacija validacije**: Implementirajte skripte za provjeru prije implementacije
4. **Planiranje troškova**: Izradite procjene troškova implementacije i proračune

#### Pitanja za procjenu
- Kako validirati Azure kapacitet prije implementacije?
- Koji čimbenici utječu na odluke o odabiru SKU-a?
- Kako automatizirati validaciju prije implementacije?
- Koje strategije pomažu u optimizaciji troškova implementacije?

---

### Poglavlje 7: Rješavanje problema & Otklanjanje pogrešaka (Tjedan 9)
**Trajanje**: 1-1.5 sati | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Razviti sustavne pristupe otklanjanju pogrešaka u AZD implementacijama
- Riješiti uobičajene probleme implementacije i konfiguracije
- Otklanjati AI-specifične probleme i probleme s performansama
- Implementirati nadzor i upozorenja za proaktivno otkrivanje problema

#### Ključni koncepti za savladati
- Dijagnostičke tehnike i strategije zapisivanja
- Uobičajeni obrasci pogrešaka i njihova rješenja
- Praćenje performansi i optimizacija
- Postupci reagiranja i oporavka u incidentima

#### Praktične vježbe
1. **Dijagnostičke vještine**: Vježbajte s namjerno neispravnim implementacijama
2. **Analiza zapisa**: Koristite Azure Monitor i Application Insights učinkovito
3. **Podešavanje performansi**: Optimizirajte aplikacije s lošim performansama
4. **Postupci oporavka**: Implementirajte sigurnosne kopije i oporavak od katastrofe

#### Pitanja za procjenu
- Koji su najčešći neuspjesi implementacije AZD-a?
- Kako otkloniti probleme s autentikacijom i dopuštenjima?
- Koje strategije nadzora pomažu u sprečavanju problema u produkciji?
- Kako optimizirati performanse aplikacija u Azureu?

---

### Poglavlje 8: Produkcijski & Enterprise obrasci (Tjedan 10-11)
**Trajanje**: 2-3 sata | **Složenost**: ⭐⭐⭐⭐

#### Ciljevi učenja
- Implementirati strategije implementacije razine poduzeća
- Dizajnirati sigurnosne obrasce i okvire usklađenosti
- Uspostaviti nadzor, upravljanje i kontrolu troškova
- Kreirati skalabilne CI/CD pipelineove s AZD integracijom
- Primijeniti najbolje prakse za produkcijsku implementaciju aplikacija u kontejnerima (sigurnost, nadzor, troškovi, CI/CD)

#### Ključni koncepti za savladati
- Zahtjevi sigurnosti i usklađenosti na razini poduzeća
- Okviri upravljanja i implementacija politika
- Napredni nadzor i upravljanje troškovima
- Integracija CI/CD i automatizirani pipelineovi implementacije
- Blue-green i canary obrasci implementacije za kontejnerizirana radna opterećenja

#### Praktične vježbe
1. **Poduzećna sigurnost**: Implementirajte sveobuhvatne sigurnosne obrasce
2. **Okvir upravljanja**: Postavite Azure Policy i upravljanje resursima
3. **Napredni nadzor**: Kreirajte nadzorne ploče i automatizirana upozorenja
4. **CI/CD integracija**: Izradite automatizirane pipelineove implementacije
5. **Produkciona kontejnerska aplikacija**: Primijenite sigurnost, nadzor i optimizaciju troškova na [Microservices Architecture](../../../examples/container-app/microservices) primjer

#### Pitanja za procjenu
- Kako implementirati sigurnost poduzeća u AZD implementacijama?
- Koji obrasci upravljanja osiguravaju usklađenost i kontrolu troškova?
- Kako dizajnirati skalabilan nadzor za produkcijske sustave?
- Koji CI/CD obrasci najbolje funkcioniraju s AZD radnim tokovima?

#### Ciljevi učenja
- Razumjeti osnove i ključne koncepte Azure Developer CLI
- Uspješno instalirati i konfigurirati azd u vašem razvojnome okruženju
- Završiti svoju prvu implementaciju koristeći postojeći predložak
- Kretati se strukturom azd projekta i razumjeti ključne komponente

#### Ključni pojmovi za savladati
- Predlošci, okruženja i servisi
- Struktura konfiguracije azure.yaml
- Osnovne azd naredbe (init, up, down, deploy)
- Principi infrastrukture kao koda
- Azure autentikacija i autorizacija

#### Vježbe za prakticiranje

**Vježba 1.1: Instalacija i postavljanje**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Vježba 1.2: Prva implementacija**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Vježba 1.3: Analiza strukture projekta**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Pitanja za samoocjenu
1. Koja su tri temeljna koncepta azd arhitekture?
2. Koja je svrha datoteke azure.yaml?
3. Kako okruženja pomažu u upravljanju različitim ciljevima implementacije?
4. Koje metode autentifikacije se mogu koristiti s azd?
5. Što se događa kada prvi put pokrenete `azd up`?

---

## Okvir za praćenje napretka i procjenu
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Vježba 2.2: Napredno konfiguriranje**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Vježba 2.3: Sigurnosno konfiguriranje**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Pitanja za samoprocjenu
1. Kako azd upravlja prioritetom varijabli okoline?
2. Što su deployment hooks i kada ih trebate koristiti?
3. Kako konfigurirate različite SKU za različite okoline?
4. Koje su sigurnosne implikacije različitih metoda autentifikacije?
5. Kako upravljate tajnama i osjetljivim konfiguracijskim podacima?

### Modul 3: Deploy i Provisioning (Tjedan 4)

#### Ciljevi učenja
- Ovladati radnim tokovima deploya i najboljim praksama
- Razumjeti Infrastructure as Code s Bicep predlošcima
- Implementirati složene višeservice arhitekture
- Optimizirati performanse i pouzdanost deploya

#### Ključni pojmovi za ovladati
- Struktura Bicep predložaka i moduli
- Ovisnosti resursa i redoslijed
- Strategije deploya (blue-green, rolling updates)
- Deployi u više regija
- Migracije baza podataka i upravljanje podacima

#### Praktične vježbe

**Vježba 3.1: Prilagođena infrastruktura**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Vježba 3.2: Višeservisna aplikacija**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Vježba 3.3: Integracija baze podataka**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Pitanja za samoocjenu
1. Koje su prednosti korištenja Bicepa u odnosu na ARM predloške?
2. Kako rukujete migracijama baza podataka u azd implementacijama?
3. Koje postoje strategije za implementacije bez zastoja?
4. Kako upravljate ovisnostima između servisa?
5. Koja su razmatranja za implementacije u više regija?

### Modul 4: Validacija prije implementacije (tjedan 5)

#### Ciljevi učenja
- Provesti sveobuhvatne provjere prije implementacije
- Ovladati planiranjem kapaciteta i validacijom resursa
- Razumjeti odabir SKU i optimizaciju troškova
- Izgraditi automatizirane validacijske pipeline

#### Ključni pojmovi za usvajanje
- Kvote i ograničenja Azure resursa
- Kriteriji odabira SKU i implikacije troškova
- Automatizirani validacijski skripti i alati
- Metodologije planiranja kapaciteta
- Testiranje performansi i optimizacija

#### Vježbe za praksu

**Vježba 4.1: Planiranje kapaciteta**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Vježba 4.2: Pre-ulazna validacija**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Vježba 4.3: Optimizacija SKU**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Pitanja za samoocjenu
1. Koji čimbenici bi trebali utjecati na odluke pri odabiru SKU?
2. Kako validirati dostupnost Azure resursa prije implementacije?
3. Koje su ključne komponente sustava pre-ulazne provjere?
4. Kako procjenjujete i kontrolirate troškove implementacije?
5. Koji je esencijalni monitoring za planiranje kapaciteta?

### Modul 5: Otklanjanje poteškoća i ispravljanje pogrešaka (tjedan 6)

#### Ciljevi učenja
- Ovladati sustavnim metodologijama otklanjanja poteškoća
- Razviti stručnost u ispravljanju složenih problema implementacije
- Provesti sveobuhvatni monitoring i upozorenja
- Izgraditi procedure za odgovor na incidente i oporavak

#### Ključni pojmovi za usvajanje
- Uobičajeni obrasci neuspjeha implementacije
- Tehnike analize i korelacije zapisa
- Praćenje performansi i optimizacija
- Otkrivanje sigurnosnih incidenata i reakcija
- Oporavak od katastrofa i kontinuitet poslovanja

#### Vježbe za praksu

**Vježba 5.1: Scenariji otklanjanja poteškoća**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Vježba 5.2: Implementacija monitoringa**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Vježba 5.3: Odgovor na incident**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Pitanja za samoocjenu
1. Koji je sustavni pristup otklanjanju poteškoća u azd implementacijama?
2. Kako korrelirati zapise preko više servisa i resursa?
3. Koji su metrički pokazatelji monitoringa najvažniji za rano otkrivanje problema?
4. Kako implementirati učinkovite procedure za oporavak od katastrofe?
5. Koje su ključne komponente plana odgovora na incidente?

### Modul 6: Napredne teme i najbolje prakse (tjedan 7-8)

#### Ciljevi učenja
- Implementirati obrasce implementacije razine poduzeća
- Ovladati integracijom i automatizacijom CI/CD
- Razvijati prilagođene predloške i doprinositi zajednici
- Razumjeti napredne sigurnosne i usklađenosti zahtjeve

#### Ključni pojmovi za usvajanje
- Obrasci integracije CI/CD pipeline
- Razvoj i distribucija prilagođenih predložaka
- Upravljanje poduzećem i usklađenost
- Napredne mrežne i sigurnosne konfiguracije
- Optimizacija performansi i upravljanje troškovima

#### Vježbe za praksu

**Vježba 6.1: Integracija CI/CD**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Vježba 6.2: Razvoj prilagođenih predložaka**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Vježba 6.3: Poduzećna implementacija**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Pitanja za samoocjenu
1. Kako integrirati azd u postojeće CI/CD tokove rada?
2. Koja su ključna razmatranja za razvoj prilagođenih predložaka?
3. Kako uvesti upravljanje i usklađenost u azd implementacije?
4. Koje su najbolje prakse za implementacije razine poduzeća?
5. Kako učinkovito doprinijeti zajednici azd?

## Praktični projekti

### Projekt 1: Osobna portfolio web stranica
**Težina**: Početnik  
**Trajanje**: 1-2 tjedna

Izradite i implementirajte osobnu portfolio web stranicu koristeći:
- Hosting statične web stranice na Azure Storage
- Konfiguraciju prilagođene domene
- CDN integraciju za globalne performanse
- Automatizirani pipeline za implementaciju

**Isporuke**:
- Funkcionalna web stranica implementirana na Azure
- Prilagođeni azd predložak za implementacije portfolija
- Dokumentacija procesa implementacije
- Analiza troškova i preporuke za optimizaciju

### Projekt 2: Aplikacija za upravljanje zadacima
**Težina**: Srednja  
**Trajanje**: 2-3 tjedna

Kreirajte full-stack aplikaciju za upravljanje zadacima s:
- React frontendom implementiranim na App Service
- Node.js API backendom s autentikacijom
- PostgreSQL bazom podataka s migracijama
- Monitoringom putem Application Insights

**Isporuke**:
- Potpuna aplikacija s autentikacijom korisnika
- Shema baze i migracijski skripti
- Upravljačke ploče za monitoring i pravila upozorenja
- Konfiguracija implementacije za više okruženja

### Projekt 3: Platforma za e-trgovinu temeljena na mikroservisima
**Težina**: Napredno  
**Trajanje**: 4-6 tjedana

Dizajnirajte i implementirajte platformu za e-trgovinu temeljenu na mikroservisima:
- Višestruke API usluge (katalog, narudžbe, plaćanja, korisnici)
- Integracija poruka kroz Service Bus
- Redis cache za optimizaciju performansi
- Sveobuhvatno vođenje zapisa i monitoring

**Referentni primjer**: Pogledajte [Microservices Architecture](../../../examples/container-app/microservices) za primjerni uzorak s dvije usluge i vodič za implementaciju. Redovi čekanja, trajnost, autentikacija, obrada plaćanja i prilagodba za produkciju su zasebni projekti.

**Isporuke**:
- Potpuna mikroservisna arhitektura
- Obrasci međuservisne komunikacije
- Testiranje performansi i optimizacija
- Sigurnosna implementacija spremna za produkciju

## Procjena i certifikacija

### Provjere znanja

Dovršite ove procjene nakon svakog modula:

**Procjena modula 1**: Osnovni koncepti i instalacija
- Pitanja s višestrukim izborom na temu osnovnih pojmova
- Praktični zadaci instalacije i konfiguracije
- Jednostavna vježba implementacije

**Procjena modula 2**: Konfiguracija i okruženja
- Scenariji upravljanja okruženjem
- Vježbe rješavanja problema konfiguracije
- Implementacija sigurnosne konfiguracije

**Procjena modula 3**: Implementacija i provisioniranje
- Izazovi dizajna infrastrukture
- Scenariji višeservisnih implementacija
- Vježbe optimizacije performansi

**Procjena modula 4**: Validacija prije implementacije
- Studije slučaja planiranja kapaciteta
- Scenariji optimizacije troškova
- Implementacija validacijskog pipelinea

**Procjena modula 5**: Otklanjanje poteškoća i ispravljanje pogrešaka
- Vježbe dijagnostike problema
- Zadaci implementacije monitoringa
- Simulacije odgovora na incidente

**Procjena modula 6**: Napredne teme
- Dizajn CI/CD pipelinea
- Razvoj prilagođenih predložaka
- Scenariji arhitekture poduzeća

### Završni projekt

Dizajnirajte i implementirajte cjelovito rješenje koje demonstrira usvajanje svih koncepata:

**Zahtjevi**:
- Višenivojska arhitektura aplikacije
- Višestruka okruženja za implementaciju
- Sveobuhvatni monitoring i upozorenja
- Implementacija sigurnosti i usklađenosti
- Optimizacija troškova i podešavanje performansi
- Potpuna dokumentacija i priručnici

**Kriteriji ocjenjivanja**:
- Kvaliteta tehničke implementacije
- Potpunost dokumentacije
- Poštivanje sigurnosti i najboljih praksi
- Optimizacija performansi i troškova
- Učinkovitost u otklanjanju poteškoća i monitoringu

## Resursi za učenje i reference

### Službena dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Zajednički resursi
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Praksa okruženja
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Dodatni alati
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Preporuke za raspored učenja

### Puno radno vrijeme (8 tjedana)
- **Tjedni 1-2**: Moduli 1-2 (Uvod, konfiguracija)
- **Tjedni 3-4**: Moduli 3-4 (Implementacija, prije implementacije)
- **Tjedni 5-6**: Moduli 5-6 (Otklanjanje poteškoća, napredne teme)
- **Tjedni 7-8**: Praktični projekti i završna procjena

### Nepuno radno vrijeme (16 tjedana)
- **Tjedni 1-4**: Modul 1 (Uvod)
- **Tjedni 5-7**: Modul 2 (Konfiguracija i okruženja)
- **Tjedni 8-10**: Modul 3 (Implementacija i provisioniranje)
- **Tjedni 11-12**: Modul 4 (Validacija prije implementacije)
- **Tjedni 13-14**: Modul 5 (Otklanjanje poteškoća i debugging)
- **Tjedni 15-16**: Modul 6 (Napredne teme i procjena)

---

## Okviri za praćenje napretka i ocjenjivanje

### Popis dovršetka poglavlja

Pratite svoj napredak kroz svako poglavlje s ovim mjerljivim ishodima:

#### 📚 Poglavlje 1: Osnove i brz početak
- [ ] **Instalacija dovršena**: AZD instaliran i verificiran na vašoj platformi
- [ ] **Prva implementacija**: Uspješno implementiran predložak todo-nodejs-mongo
- [ ] **Postavljanje okruženja**: Konfigurirane prve varijable okruženja
- [ ] **Navigacija resursima**: Istraženi implementirani resursi u Azure Portalu
- [ ] **Ovladavanje naredbama**: Ugodno snalaženje u osnovnim AZD naredbama

#### 🤖 Poglavlje 2: AI-First razvoj  
- [ ] **Implementacija AI predloška**: Uspješno implementiran azure-search-openai-demo
- [ ] **Implementacija RAG-a**: Konfigurirano indeksiranje i dohvaćanje dokumenata
- [ ] **Konfiguracija modela**: Postavljeno više AI modela za različite svrhe
- [ ] **AI monitoring**: Implementiran Application Insights za AI radne opterećenja
- [ ] **Optimizacija performansi**: Podešavanje performansi AI aplikacije

#### ⚙️ Poglavlje 3: Konfiguracija i autentikacija
- [ ] **Postavljanje više okruženja**: Konfigurirana razvojna, testna i produkcijska okruženja
- [ ] **Implementacija sigurnosti**: Postavljena autentikacija upravljane identitete
- [ ] **Upravljanje tajnama**: Integriran Azure Key Vault za osjetljive podatke
- [ ] **Upravljanje parametrima**: Kreirane konfiguracije specifične za okruženja
- [ ] **Ovladavanje autentikacijom**: Implementirani sigurni obrasci pristupa

#### 🏗️ Poglavlje 4: Infrastruktura kao kod i implementacija
- [ ] **Kreiranje prilagođenih predložaka**: Izgrađen predložak za višeservisnu aplikaciju
- [ ] **Ovladavanje Bicepom**: Kreirani modularni, ponovo upotrebljivi infrastrukturni dijelovi
- [ ] **Automatizacija implementacije**: Implementirani pre- i post-implementacijski hookovi
- [ ] **Dizajn arhitekture**: Implementirana složena mikroservisna arhitektura
- [ ] **Optimizacija predložaka**: Optimizirani predlošci za performanse i troškove

#### 🎯 Poglavlje 5: Višagentna AI rješenja
- [ ] **Pregled arhitekture maloprodaje**: Identificirani nedostajući dijelovi aplikacije te planirane implementacije i validacije
- [ ] **Prilagodba agenata**: Modificirano ponašanje agenata za kupce i inventar
- [ ] **Skaliranje arhitekture**: Primijenjeno uravnoteženje opterećenja i automatsko skaliranje
- [ ] **Monitoring u produkciji**: Postavljen sveobuhvatan monitoring i alerti
- [ ] **Podešavanje performansi**: Optimizirane performanse višagentnog sustava

#### 🔍 Poglavlje 6: Validacija prije implementacije i planiranje
- [ ] **Analiza kapaciteta**: Analizirani zahtjevi za resursima aplikacija
- [ ] **Optimizacija SKU-a**: Odabrani isplativi slojevi usluga
- [ ] **Automatizacija validacije**: Implementirani skripte za provjere prije implementacije
- [ ] **Planiranje troškova**: Izrađene procjene troškova i budžeti implementacije
- [ ] **Procjena rizika**: Identificirani i ublaženi rizici implementacije

#### 🚨 Poglavlje 7: Otklanjanje poteškoća i debugging
- [ ] **Dijagnostičke vještine**: Uspješno ispravljene namjerno pokvarene implementacije
- [ ] **Analiza zapisa**: Učinkovito korišten Azure Monitor i Application Insights
- [ ] **Podešavanje performansi**: Optimizirane spore aplikacije
- [ ] **Postupci oporavka**: Implementirani backup i oporavak od katastrofe
- [ ] **Postavljanje monitoringa**: Kreiran proaktivan monitoring i upozorenja

#### 🏢 Poglavlje 8: Produkcijski i poduzećni obrasci
- [ ] **Sigurnost poduzeća**: Implementirani sveobuhvatni sigurnosni obrasci
- [ ] **Okviri upravljanja**: Postavljena Azure Policy i upravljanje resursima
- [ ] **Napredni monitoring**: Kreirane nadzorne ploče i automatizirana upozorenja
- [ ] **Integracija CI/CD**: Izgrađeni automatizirani pipelineovi za implementaciju
- [ ] **Implementacija usklađenosti**: Zadovoljeni zahtjevi usklađenosti poduzeća

### Vremenski okvir i ključni događaji u učenju

#### Tjedni 1-2: Izgradnja temelja
- **Ključni događaj**: Implementirati prvu AI aplikaciju koristeći AZD
- **Validacija**: Funkcionalna aplikacija dostupna putem javnog URL-a
- **Vještine**: Osnovni AZD tijekovi rada i integracija AI usluge

#### Tjedni 3-4: Ovladavanje konfiguracijom
- **Ključni događaj**: Implementacija u više okruženja s sigurnom autentikacijom
- **Validacija**: Ista aplikacija implementirana u dev/test/prod
- **Vještine**: Upravljanje okruženjima i implementacija sigurnosti

#### Tjedni 5-6: Stručnost u infrastrukturi
- **Ključni događaj**: Prilagođeni predložak za složenu višeservisnu aplikaciju
- **Validacija**: Ponovno upotrebljiv predložak implementirao drugi član tima
- **Vještine**: Ovladavanje Bicepom i automatizacija infrastrukture

#### Tjedni 7-8: Napredna AI implementacija
- **Ključni događaj**: AI rješenje za višagentnu produkciju
- **Validacija**: Sustav podnosi stvarni teret s monitoringom
- **Vještine**: Orkestracija višagenata i optimizacija performansi

#### Tjedni 9-10: Spremnost za produkciju
- **Ključni događaj**: Implementacija razine poduzeća s potpunom usklađenošću
- **Validacija**: Prolazak sigurnosne revizije i revizije optimizacije troškova
- **Vještine**: Upravljanje, monitoring i integracija CI/CD

### Procjena i certifikacija

#### Metode validacije znanja
1. **Praktične implementacije**: Funkcionalne aplikacije za svaki poglavlje
2. **Code Reviews**: Predlošci i ocjena kvalitete konfiguracije
3. **Rješavanje problema**: Scenariji i rješenja za otklanjanje poteškoća
4. **Podučavanje kolega**: Objašnjavanje pojmova drugim polaznicima
5. **Doprinos zajednici**: Dijeljenje predložaka ili poboljšanja

#### Ishodi profesionalnog razvoja
- **Portfolio projekti**: Vježbe implementacije i arhitekture; spremnost za produkciju zahtijeva zasebnu implementaciju i pregled
- **Tehničke vještine**: Stručno znanje industrijskih standarda za AZD i AI implementacije
- **Sposobnosti rješavanja problema**: Samostalno otklanjanje poteškoća i optimizacija
- **Prepoznavanje u zajednici**: Aktivno sudjelovanje u Azure developerskoj zajednici
- **Napredak u karijeri**: Vještine izravno primjenjive na uloge u cloud i AI domeni

#### Metrike uspjeha
- **Stopa uspješnih implementacija**: >95% uspješnih implementacija
- **Vrijeme rješavanja problema**: <30 minuta za uobičajene probleme
- **Optimizacija performansi**: Dokaziva poboljšanja u troškovima i performansama
- **Sigurnosna provjera**: Dokumentirajte kontrole i preostale nedostatke u skladu sa zahtjevima vaše organizacije; završetak tečaja ne certifikata usklađenost
- **Prijenos znanja**: Sposobnost mentoriranja drugih developera

### Kontinuirano učenje i angažman u zajednici

#### Ostanite u toku
- **Azure novosti**: Pratite bilješke o izdanjima Azure Developer CLI-a
- **Događanja u zajednici**: Sudjelujte na događajima za Azure i AI developere
- **Dokumentacija**: Pridonosite dokumentaciji i primjerima za zajednicu
- **Povratne informacije**: Dajte povratne informacije o sadržaju tečaja i Azure uslugama

#### Razvoj karijere
- **Profesionalna mreža**: Povežite se s Azure i AI stručnjacima
- **Prilike za javni nastup**: Prezentirajte naučeno na konferencijama ili susretima
- **Doprinos open source-u**: Doprinesite AZD predlošcima i alatima
- **Mentorstvo**: Vodite druge developere u njihovom AZD učenju

---

**Navigacija po poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Početak učenja**: [Poglavlje 1: Osnove i brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Praćenje napretka**: Pratite svoj napredak kroz sveobuhvatan 8-poglavlja sustav učenja
- **🤝 Zajednica**: [Azure Discord](https://discord.gg/microsoft-azure) za podršku i raspravu

**Praćenje napretka u učenju**: Koristite ovaj strukturirani vodič za savladavanje Azure Developer CLI kroz progresivno, praktično učenje s mjerljivim rezultatima i profesionalnim koristima.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
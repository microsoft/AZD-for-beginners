# Vodič za učenje - Sveobuhvatni ciljevi učenja

**Navigacija putem puta učenja**
- **📚 Početna stranica tečaja**: [AZD Za početnike](../README.md)
- **📖 Početak učenja**: [Poglavlje 1: Osnova i Brzi početak](../README.md#-poglavlje-1-osnova--brzi-početak)
- **🎯 Praćenje napretka**: [Dovršenje tečaja](../README.md#-dovršenje-tečaja--certifikacija)

## Uvod

Ovaj sveobuhvatni vodič za učenje pruža strukturirane ciljeve učenja, ključne pojmove, praktične vježbe i materijale za procjenu kako biste savladali Azure Developer CLI (azd). Koristite ovaj vodič za praćenje napretka i osigurajte da ste pokrili sve važne teme.

## Ciljevi učenja

Nakon dovršetka ovog vodiča za učenje, moći ćete:
- Savladati sve osnovne i napredne pojmove Azure Developer CLI-a
- Razviti praktične vještine u implementaciji i upravljanju Azure aplikacijama
- Izgraditi samopouzdanje u rješavanju problema i optimiziranju implementacija
- Razumjeti prakse implementacije spremne za proizvodnju i sigurnosne aspekte

## Ishodi učenja

Nakon dovršetka svih odjeljaka ovog vodiča za učenje, moći ćete:
- Dizajnirati, implementirati i upravljati kompletnim arhitekturama aplikacija koristeći azd
- Provoditi sveobuhvatne strategije nadzora, sigurnosti i optimizacije troškova
- Samostalno rješavati složene probleme implementacije
- Kreirati prilagođene predloške i doprinositi zajednici azd-a

## Struktura učenja u 8 poglavlja

### Poglavlje 1: Osnova i Brzi početak (1. tjedan)
**Trajanje**: 30-45 minuta | **Složenost**: ⭐

#### Ciljevi učenja
- Razumjeti osnovne koncepte i terminologiju Azure Developer CLI-a
- Uspješno instalirati i konfigurirati AZD na svojoj razvojnoj platformi
- Implementirati svoju prvu aplikaciju koristeći postojeći predložak
- Efikasno se kretati kroz AZD sučelje naredbenog retka

#### Ključni pojmovi za savladati
- Struktura i komponente AZD projekta (azure.yaml, infra/, src/)
- Radni tijekovi implementacije temeljeni na predlošcima
- Osnove konfiguracije okruženja
- Upravljanje grupama resursa i pretplatama

#### Praktične vježbe
1. **Provjera instalacije**: Instalirajte AZD i provjerite s `azd version`
2. **Prva implementacija**: Uspješno implementirajte predložak todo-nodejs-mongo
3. **Postavljanje okruženja**: Konfigurirajte svoje prve varijable okruženja
4. **Istraživanje resursa**: Pregledajte implementirane resurse u Azure portalu

#### Pitanja za procjenu
- Koje su ključne komponente AZD projekta?
- Kako inicijalizirati novi projekt iz predloška?
- Koja je razlika između `azd up` i `azd deploy`?
- Kako upravljati višestrukim okruženjima pomoću AZD-a?

---

### Poglavlje 2: AI-prvo programiranje (2. tjedan)
**Trajanje**: 1-2 sata | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Integrirati Microsoft Foundry usluge s AZD radnim tokovima
- Implementirati i konfigurirati AI-pokretane aplikacije
- Razumjeti uzorke implementacije RAG (Retrieval-Augmented Generation)
- Upravljati implementacijama i skaliranjem AI modela

#### Ključni pojmovi za savladati
- Integracija Microsoft Foundry Models usluga i upravljanje API-jem
- Konfiguracija AI pretraživanja i vektorsko indeksiranje
- Strategije implementacije modela i planiranje kapaciteta
- Praćenje i optimizacija performansi AI aplikacija

#### Praktične vježbe
1. **Implementacija AI chata**: Implementirajte predložak azure-search-openai-demo
2. **RAG implementacija**: Konfigurirajte indeksiranje i dohvaćanje dokumenata
3. **Konfiguracija modela**: Postavite više AI modela s različitim svrhema
4. **Praćenje AI-a**: Implementirajte Application Insights za AI radna opterećenja

#### Pitanja za procjenu
- Kako konfigurirati Microsoft Foundry Models usluge u AZD predlošku?
- Koje su ključne komponente RAG arhitekture?
- Kako upravljati kapacitetom i skaliranjem AI modela?
- Koji su važni metrički podaci za praćenje AI aplikacija?

---

### Poglavlje 3: Konfiguracija i autentikacija (3. tjedan)
**Trajanje**: 45-60 minuta | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Savladati strategije konfiguracije i upravljanja okruženjima
- Implementirati sigurne obrasce autentikacije i upravljane identitete
- Organizirati resurse s pravilnim konvencijama imenovanja
- Konfigurirati višestruke implementacije okruženja (razvoj, testiranje, produkcija)

#### Ključni pojmovi za savladati
- Hijerarhija okruženja i redoslijed konfiguracije
- Upravljana identiteta i autentikacija servisnih računa
- Integracija Key Vaulta za upravljanje tajnama
- Upravljanje parametrima specifičnim za okruženja

#### Praktične vježbe
1. **Postavljanje višestrukog okruženja**: Konfigurirajte razvoj, testiranje i produkcijska okruženja
2. **Konfiguracija sigurnosti**: Implementirajte autentikaciju pomoću upravljanih identiteta
3. **Upravljanje tajnama**: Integrirajte Azure Key Vault za osjetljive podatke
4. **Upravljanje parametrima**: Kreirajte konfiguracije specifične za okruženja

#### Pitanja za procjenu
- Kako konfigurirati različita okruženja pomoću AZD-a?
- Koje su prednosti upravljane identitete u odnosu na servisne račune?
- Kako sigurno upravljati tajnama aplikacije?
- Koja je hijerarhija konfiguracije u AZD-u?

---

### Poglavlje 4: Infrastruktura kao kod i implementacija (4.-5. tjedan)
**Trajanje**: 1-1.5 sati | **Složenost**: ⭐⭐⭐

#### Ciljevi učenja
- Kreirati i prilagoditi Bicep infrastrukturne predloške
- Implementirati napredne obrasce i tokove rada implementacije
- Razumjeti strategije provisioniranja resursa
- Dizajnirati skalabilne višeservisne arhitekture

- Implementirati kontejnerizirane aplikacije koristeći Azure Container Apps i AZD


#### Ključni pojmovi za savladati
- Struktura Bicep predloška i najbolje prakse
- Ovisnosti o resursima i redoslijed implementacije
- Datoteke parametara i modularnost predložaka
- Prilagođeni hookovi i automatizacija implementacije
- Obrasci implementacije Container App (brzi početak, produkcija, mikroservisi)

#### Praktične vježbe
1. **Izrada prilagođenog predloška**: Izgradite predložak aplikacije s više servisa
2. **Savladavanje Bicepa**: Kreirajte modularne i višekratno upotrebljive infrastrukturne komponente
3. **Automatizacija implementacije**: Implementirajte hookove prije i poslije implementacije
4. **Dizajn arhitekture**: Implementirajte složenu arhitekturu mikroservisa
5. **Implementacija Container App**: Implementirajte primjere [Simple Flask API](../../../examples/container-app/simple-flask-api) i [Microservices Architecture](../../../examples/container-app/microservices) koristeći AZD

#### Pitanja za procjenu
- Kako kreirati prilagođene Bicep predloške za AZD?
- Koje su najbolje prakse za organizaciju infrastrukturnog koda?
- Kako rukovati ovisnostima resursa u predlošcima?
- Koji obrasci implementacije podržavaju nadogradnje bez prekida?

---

### Poglavlje 5: AI rješenja s više agenata (6.-7. tjedan)
**Trajanje**: 2-3 sata | **Složenost**: ⭐⭐⭐⭐

#### Ciljevi učenja
- Dizajnirati i implementirati AI arhitekture s više agenata
- Koordinirati suradnju i komunikaciju agenata
- Implementirati proizvodno spremna AI rješenja s nadzorom
- Razumjeti specijalizaciju agenata i obrasce radnih tokova
- Integrirati kontejnerizirane mikroservise kao dio rješenja s više agenata

#### Ključni pojmovi za savladati
- Obrasci arhitekture s više agenata i principi dizajna
- Protokoli komunikacije agenata i protok podataka
- Strategije balansiranja opterećenja i skaliranja AI agenata
- Praćenje proizvodnje za sustave s više agenata
- Komunikacija službe prema službi u kontejneriziranim okruženjima

#### Praktične vježbe
1. **Implementacija maloprodajnog rješenja**: Implementirajte cjeloviti scenarij maloprodaje s više agenata
2. **Prilagodba agenta**: Izmijenite ponašanja agenata Customer i Inventory
3. **Skaliranje arhitekture**: Implementirajte balansiranje opterećenja i automatsko skaliranje
4. **Praćenje proizvodnje**: Postavite sveobuhvatno praćenje i upozoravanje
5. **Integracija mikroservisa**: Proširite primjer [Microservices Architecture](../../../examples/container-app/microservices) za podršku radnih tokova temeljenih na agentima

#### Pitanja za procjenu
- Kako dizajnirati učinkovite obrasce komunikacije više agenata?
- Koji su ključni čimbenici za skaliranje radnih opterećenja AI agenata?
- Kako pratiti i otkloniti pogreške u sustavima AI s više agenata?
- Koji obrasci proizvodnje osiguravaju pouzdanost AI agenata?

---

### Poglavlje 6: Validacija i planiranje prije implementacije (8. tjedan)
**Trajanje**: 1 sat | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Provesti sveobuhvatno planiranje kapaciteta i validaciju resursa
- Odabrati optimalne Azure SKU-ove za isplativost
- Implementirati automatizirane prelipte provjere i validacije
- Planirati implementacije sa strategijama optimizacije troškova

#### Ključni pojmovi za savladati
- Kvote Azure resursa i ograničenja kapaciteta
- Kriteriji odabira SKU-a i optimizacija troškova
- Automatizirani validacijski skripti i testiranje
- Planiranje implementacije i procjena rizika

#### Praktične vježbe
1. **Analiza kapaciteta**: Analizirajte zahtjeve resursa za svoje aplikacije
2. **Optimizacija SKU-a**: Usporedite i odaberite isplative razine usluga
3. **Automatizacija validacije**: Implementirajte skripte za provjere prije implementacije
4. **Planiranje troškova**: Kreirajte procjene troškova i budžete za implementacije

#### Pitanja za procjenu
- Kako validirati Azure kapacitet prije implementacije?
- Koji čimbenici utječu na odluke o odabiru SKU-a?
- Kako automatizirati validaciju prije implementacije?
- Koje strategije pomažu optimizirati troškove implementacije?

---

### Poglavlje 7: Rješavanje problema i otklanjanje pogrešaka (9. tjedan)
**Trajanje**: 1-1.5 sati | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Razviti sistematske pristupe otklanjanju pogrešaka za AZD implementacije
- Rješavati uobičajene probleme implementacije i konfiguracije
- Otklanjati AI-specifične probleme i probleme performansi
- Implementirati praćenje i upozoravanje za proaktivno otkrivanje problema

#### Ključni pojmovi za savladati
- Dijagnostičke tehnike i strategije zapisivanja logova
- Uobičajeni obrasci pogrešaka i njihova rješenja
- Praćenje i optimizacija performansi
- Postupci odgovora na incidente i oporavka

#### Praktične vježbe
1. **Dijagnostičke vještine**: Vježbajte s namjerno pogrešnim implementacijama
2. **Analiza logova**: Efektivno koristite Azure Monitor i Application Insights
3. **Optimizacija performansi**: Optimizirajte aplikacije s lošim performansama
4. **Postupci oporavka**: Implementirajte sigurnosne kopije i oporavak od katastrofe

#### Pitanja za procjenu
- Koji su najčešći problemi pri implementaciji AZD-a?
- Kako otkloniti probleme s autentikacijom i dozvolama?
- Koje strategije praćenja pomažu spriječiti probleme u produkciji?
- Kako optimizirati performanse aplikacija u Azureu?

---

### Poglavlje 8: Obrasci za proizvodnju i poduzeća (10.-11. tjedan)
**Trajanje**: 2-3 sata | **Složenost**: ⭐⭐⭐⭐

#### Ciljevi učenja
- Implementirati strategije implementacije na razini poduzeća
- Dizajnirati sigurnosne obrasce i okvire usklađenosti
- Uspostaviti nadzor, upravljanje i kontrolu troškova
- Kreirati skalabilne CI/CD procese integrirane s AZD-om
- Primijeniti najbolje prakse za proizvodne implementacije Container App (sigurnost, nadzor, troškovi, CI/CD)

#### Ključni pojmovi za savladati
- Zahtjevi sigurnosti i usklađenosti poduzeća
- Okviri upravljanja i implementacija pravila
- Napredni nadzor i upravljanje troškovima
- CI/CD integracija i automatizirani pipelineovi implementacije
- Strategije plavo-zelene i kanareve implementacije za kontejnerizirana radna opterećenja

#### Praktične vježbe
1. **Sigurnost poduzeća**: Implementirajte sveobuhvatne sigurnosne obrasce
2. **Okvir upravljanja**: Postavite Azure Policy i upravljanje resursima
3. **Napredni nadzor**: Kreirajte nadzorne ploče i automatizirana upozorenja
4. **CI/CD integracija**: Izgradite automatizirane pipelineove implementacije
5. **Proizvodne Container App**: Primijenite sigurnost, nadzor i optimizaciju troškova na primjer [Microservices Architecture](../../../examples/container-app/microservices)

#### Pitanja za procjenu
- Kako implementirati sigurnost poduzeća u AZD implementacijama?
- Koji obrasci upravljanja osiguravaju usklađenost i kontrolu troškova?
- Kako dizajnirati skalabilan nadzor za proizvodne sustave?
- Koji CI/CD obrasci najbolje funkcioniraju s AZD radnim tokovima?

#### Ciljevi učenja
- Razumjeti osnovne pojmove i temeljne koncepte Azure Developer CLI-a
- Uspješno instalirati i konfigurirati azd u razvojnom okruženju
- Dovršiti prvu implementaciju koristeći postojeći predložak
- Navigirati strukturom azd projekta i razumjeti ključne komponente

#### Ključni pojmovi za savladati
- Predlošci, okruženja i servisi
- Struktura konfiguracije azure.yaml
- Osnovne azd naredbe (init, up, down, deploy)
- Principi Infrastrukture kao koda
- Azure autentikacija i autorizacija

#### Praktične vježbe

**Vježba 1.1: Instalacija i postavljanje**
```bash
# Završite ove zadatke:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Vježba 1.2: Prva implementacija**
```bash
# Postavite jednostavnu web aplikaciju:
1. Initialize project: azd init --template todo-nodejs-mongo
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
1. Koja su tri osnovna koncepta azd arhitekture?
2. Koja je svrha datoteke azure.yaml?
3. Kako okruženja pomažu upravljati različitim ciljevima implementacije?
4. Koje metode autentikacije se mogu koristiti s azd-om?
5. Što se događa kad prvi put pokrenete `azd up`?

---

## Praćenje napretka i okvir za procjenu
```bash
# Kreirajte i konfigurirajte višestruke okoline:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Vježba 2.2: Napredna konfiguracija**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Vježba 2.3: Konfiguracija sigurnosti**
```bash
# Provedite najbolje sigurnosne prakse:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Pitanja za samoocjenu
1. Kako azd obrađuje redoslijed važnosti varijabli okruženja?
2. Što su hookovi za implementaciju i kada ih treba koristiti?
3. Kako konfigurirati različite SKU-ove za različita okruženja?
4. Koji su sigurnosni aspekti različitih metoda autentikacije?
5. Kako upravljati tajnama i osjetljivim konfiguracijskim podacima?

### Modul 3: Implementacija i provisioniranje (4. tjedan)

#### Ciljevi učenja
- Savladati tokove rada implementacije i najbolje prakse
- Razumjeti infrastrukturu kao kod kroz Bicep predloške
- Implementirati složene višeservisne arhitekture
- Optimizirati izvedbu i pouzdanost implementacije

#### Ključni pojmovi za savladati
- Struktura Bicep predloška i moduli
- Ovisnosti resursa i njihov redoslijed
- Strategije implementacije (plavo-zelena, postupne nadogradnje)
- Implementacije u više regija
- Migracije baza podataka i upravljanje podacima

#### Praktične vježbe

**Vježba 3.1: Prilagođena infrastruktura**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Vježba 3.2: Aplikacija s više servisa**
```bash
# Implementirajte arhitekturu mikroservisa:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Vježba 3.3: Integracija baze podataka**
```bash
# Implementirajte obrasce implementacije baze podataka:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Pitanja za samoocjenu
1. Koje su prednosti korištenja Bicep-a u odnosu na ARM predloške?
2. Kako upravljati migracijama baza podataka u azd implementacijama?
3. Koje strategije postoje za implementacije bez zastoja?
4. Kako upravljati ovisnostima između servisa?
5. Koji čimbenici su važni za implementacije u više regija?

### Modul 4: Validacija prije implementacije (5. tjedan)

#### Ciljevi učenja
- Provedite opsežne provjere prije implementacije
- Savladajte planiranje kapaciteta i provjeru resursa
- Razumite odabir SKU-a i optimizaciju troškova
- Izgradite automatizirane pipelineove za validaciju

#### Ključni koncepti za savladati
- Kvote i ograničenja Azure resursa
- Kriteriji za odabir SKU-a i implikacije troškova
- Skripte i alati za automatiziranu validaciju
- Metodologije planiranja kapaciteta
- Testiranje performansi i optimizacija

#### Vježbe za praksu

**Vježba 4.1: Planiranje kapaciteta**
```bash
# Implementirajte provjeru kapaciteta:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Vježba 4.2: Validacija prije implementacije**
```powershell
# Izgradite sveobuhvatan tijek provjere valjanosti:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Vježba 4.3: Optimizacija SKU-a**
```bash
# Optimizirajte konfiguracije usluga:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Pitanja za samoocjenu
1. Koji čimbenici trebaju utjecati na odluke pri odabiru SKU-a?
2. Kako potvrđujete dostupnost Azure resursa prije implementacije?
3. Koje su ključne komponente sustava za provjeru prije implementacije?
4. Kako procjenjujete i kontrolirate troškove implementacije?
5. Koji nadzor je ključan za planiranje kapaciteta?

### Modul 5: Rješavanje problema i otklanjanje pogrešaka (Tjedan 6)

#### Ciljevi učenja
- Savladajte sustavne metodologije rješavanja problema
- Razvijte stručnost u otklanjanju složenih problema implementacije
- Provedite opsežni nadzor i upozoravanje
- Izgradite procedure odgovora na incidente i oporavka

#### Ključni koncepti za savladati
- Uobičajeni obrasci neuspjeha implementacije
- Tehnike analize i korelacije zapisa
- Praćenje performansi i optimizacija
- Otkrivanje i odgovor na sigurnosne incidente
- Oporavak od katastrofa i kontinuitet poslovanja

#### Vježbe za praksu

**Vježba 5.1: Scenariji za rješavanje problema**
```bash
# Vježbajte rješavanje uobičajenih problema:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Vježba 5.2: Implementacija nadzora**
```bash
# Postavite sveobuhvatno praćenje:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Vježba 5.3: Odgovor na incidente**
```bash
# Izradite postupke odgovora na incidente:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Pitanja za samoocjenu
1. Koji je sustavni pristup rješavanju problema u azd implementacijama?
2. Kako povezujete zapise iz više usluga i resursa?
3. Koji su nadzorni metrički podaci najvažniji za rano otkrivanje problema?
4. Kako provodite učinkovite procedure oporavka od katastrofa?
5. Koje su ključne komponente plana odgovora na incident?

### Modul 6: Napredne teme i najbolje prakse (Tjedan 7-8)

#### Ciljevi učenja
- Provedite obrasce implementacije razine poduzeća
- Savladajte integraciju CI/CD i automatizaciju
- Razvijte prilagođene predloške i doprinesite zajednici
- Razumite napredne sigurnosne i usklađene zahtjeve

#### Ključni koncepti za savladati
- Obrasci integracije CI/CD pipelineova
- Razvoj i distribucija prilagođenih predložaka
- Upravljanje poduzećem i usklađenost
- Napredne mrežne i sigurnosne konfiguracije
- Optimizacija performansi i upravljanje troškovima

#### Vježbe za praksu

**Vježba 6.1: Integracija CI/CD**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Vježba 6.2: Razvoj prilagođenih predložaka**
```bash
# Stvorite i objavite prilagođene predloške:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Vježba 6.3: Implementacija za poduzeća**
```bash
# Implementirajte značajke razine poduzeća:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Pitanja za samoocjenu
1. Kako integrirati azd u postojeće CI/CD tijekove rada?
2. Koji su ključni čimbenici u razvoju prilagođenih predložaka?
3. Kako implementirati upravljanje i usklađenost u azd implementacijama?
4. Koje su najbolje prakse za implementacije u razmjeru poduzeća?
5. Kako učinkovito doprinijeti azd zajednici?

## Praktični projekti

### Projekt 1: Osobna portfolio web stranica
**Složenost**: Početnik  
**Trajanje**: 1-2 tjedna

Izgradite i implementirajte osobnu portfolio web stranicu koristeći:
- Hosting statične web stranice na Azure Storageu
- Konfiguraciju prilagođene domene
- CDN integraciju za globalne performanse
- Automatizirani pipeline za implementaciju

**Isporuke**:
- Funkcionalna web stranica implementirana na Azure
- Prilagođeni azd predložak za portfolio implementacije
- Dokumentacija procesa implementacije
- Analiza troškova i preporuke za optimizaciju

### Projekt 2: Aplikacija za upravljanje zadacima
**Složenost**: Srednje napredno  
**Trajanje**: 2-3 tjedna

Izradite full-stack aplikaciju za upravljanje zadacima s:
- React frontendom implementiranim na App Service
- Node.js API backendom s autentifikacijom
- PostgreSQL bazom podataka s migracijama
- Monitoringom putem Application Insights

**Isporuke**:
- Potpuna aplikacija s korisničkom autentifikacijom
- Shema baze podataka i skripte za migracije
- Nadzorne ploče i pravila upozoravanja
- Konfiguracija višestrukih okruženja za implementaciju

### Projekt 3: Platforma za e-trgovinu bazirana na mikroservisima
**Složenost**: Napredno  
**Trajanje**: 4-6 tjedana

Dizajnirajte i implementirajte platformu za e-trgovinu temeljenu na mikroservisima:
- Više API servisa (katalog, narudžbe, plaćanja, korisnici)
- Integracija message queue s Service Busom
- Redis cache za optimizaciju performansi
- Sveobuhvatno zapisivanje i monitoring

**Referentni primjer**: Pogledajte [Microservices Architecture](../../../examples/container-app/microservices) za predložak i vodič za implementaciju spreman za proizvodnju

**Isporuke**:
- Potpuna arhitektura mikroservisa
- Obrasci komunikacije između servisa
- Testiranje performansi i optimizacija
- Implementacija sigurnosti spremna za produkciju

## Procjena i certifikacija

### Provjere znanja

Završite ove procjene nakon svakog modula:

**Procjena modula 1**: Osnovni pojmovi i instalacija  
- Pitanja s višestrukim izborom na temelju osnovnih pojmova  
- Praktični zadaci instalacije i konfiguracije  
- Jednostavna vježba implementacije  

**Procjena modula 2**: Konfiguracija i okruženja  
- Scenariji upravljanja okruženjima  
- Vježbe za rješavanje problema u konfiguraciji  
- Implementacija sigurnosne konfiguracije  

**Procjena modula 3**: Implementacija i provisioniranje  
- Izazovi u dizajnu infrastrukture  
- Scenariji implementacije s više servisa  
- Vježbe optimizacije performansi  

**Procjena modula 4**: Validacija prije implementacije  
- Studije slučaja planiranja kapaciteta  
- Scenariji optimizacije troškova  
- Implementacija pipelinea za validaciju  

**Procjena modula 5**: Rješavanje problema i otklanjanje pogrešaka  
- Vježbe dijagnostike problema  
- Zadaci implementacije nadzora  
- Simulacije odgovora na incidente  

**Procjena modula 6**: Napredne teme  
- Dizajn CI/CD pipelineova  
- Razvoj prilagođenih predložaka  
- Scenariji arhitekture za poduzeća  

### Završni glavni projekt

Dizajnirajte i implementirajte cjelovito rješenje koje prikazuje ovladavanje svim konceptima:

**Zahtjevi**:
- Arhitektura višeslojne aplikacije  
- Višestruka okruženja za implementaciju  
- Opsežan nadzor i upozoravanje  
- Implementacija sigurnosti i usklađenosti  
- Optimizacija troškova i podešavanje performansi  
- Potpuna dokumentacija i vodiči za rad  

**Kriteriji procjene**:
- Kvaliteta tehničke implementacije  
- Potpunost dokumentacije  
- Pridržavanje sigurnosnih i najboljih praksi  
- Optimizacija performansi i troškova  
- Učinkovitost rješavanja problema i nadzora  

## Resursi za učenje i reference

### Službena dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Resursi zajednice
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Prakse okruženja
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Dodatni alati
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Preporuke za studijski raspored

### Studij puno radno vrijeme (8 tjedana)
- **Tjedni 1-2**: Moduli 1-2 (Uvod, konfiguracija)
- **Tjedni 3-4**: Moduli 3-4 (Implementacija, prije implementacije)
- **Tjedni 5-6**: Moduli 5-6 (Rješavanje problema, napredne teme)
- **Tjedni 7-8**: Praktični projekti i završna procjena

### Studij pola radnog vremena (16 tjedana)
- **Tjedni 1-4**: Modul 1 (Uvod)
- **Tjedni 5-7**: Modul 2 (Konfiguracija i okruženja)
- **Tjedni 8-10**: Modul 3 (Implementacija i provisioniranje)
- **Tjedni 11-12**: Modul 4 (Validacija prije implementacije)
- **Tjedni 13-14**: Modul 5 (Rješavanje problema i otklanjanje pogrešaka)
- **Tjedni 15-16**: Modul 6 (Napredne teme i procjena)

---

## Praćenje napretka i okvir za procjenu

### Popis za dovršetak poglavlja

Pratite svoj napredak kroz svako poglavlje koristeći ove mjerljive ishode:

#### 📚 Poglavlje 1: Osnove i brzi početak
- [ ] **Instalacija dovršena**: AZD instaliran i verificiran na vašoj platformi
- [ ] **Prva implementacija**: Uspješno implementiran predložak todo-nodejs-mongo
- [ ] **Postavljanje okruženja**: Konfigurirane prve varijable okruženja
- [ ] **Navigacija resursa**: Istraženi implementirani resursi u Azure Portalu
- [ ] **Ovladavanje naredbama**: Ugodno rukovanje osnovnim AZD naredbama

#### 🤖 Poglavlje 2: AI-Prvi razvoj  
- [ ] **Implementacija AI predloška**: Uspješno implementiran azure-search-openai-demo
- [ ] **RAG implementacija**: Konfigurirano indeksiranje i dohvat dokumenata
- [ ] **Konfiguracija modela**: Postavljeno više AI modela s različitim namjenama
- [ ] **AI nadzor**: Implementiran Application Insights za AI radna opterećenja
- [ ] **Optimizacija performansi**: Podešavanje performansi AI aplikacije

#### ⚙️ Poglavlje 3: Konfiguracija i autentifikacija
- [ ] **Postavljanje višestrukih okruženja**: Konfigurirani razvojna, testna i produkcijska okruženja
- [ ] **Implementacija sigurnosti**: Postavljena autentifikacija upravljane identitete
- [ ] **Upravljanje tajnama**: Integriran Azure Key Vault za osjetljive podatke
- [ ] **Upravljanje parametrima**: Kreirane konfiguracije specifične za okruženje
- [ ] **Ovladavanje autentifikacijom**: Implementirani sigurni obrasci pristupa

#### 🏗️ Poglavlje 4: Infrastruktura kao kod i implementacija
- [ ] **Kreiranje prilagođenog predloška**: Izgrađen predložak za aplikaciju s više servisa
- [ ] **Ovladavanje Bicepom**: Kreirani modularni, višekratno upotrebljivi infrastrukturni dijelovi
- [ ] **Automatizacija implementacije**: Provedeni hookovi prije i poslije implementacije
- [ ] **Dizajn arhitekture**: Implementirana složena arhitektura mikroservisa
- [ ] **Optimizacija predložaka**: Optimizirani predlošci za performanse i troškove

#### 🎯 Poglavlje 5: AI rješenja s više agenata
- [ ] **Implementacija rješenja za maloprodaju**: Implementiran cjeloviti scenarij s više agenata
- [ ] **Prilagodba agenata**: Modificirano ponašanje agenata za korisnike i inventar
- [ ] **Skaliranje arhitekture**: Provedeno balansiranje opterećenja i automatsko skaliranje
- [ ] **Nadzor produkcije**: Postavljen sveobuhvatan nadzor i upozoravanje
- [ ] **Podešavanje performansi**: Optimizirane performanse sustava s više agenata

#### 🔍 Poglavlje 6: Validacija prije implementacije i planiranje
- [ ] **Analiza kapaciteta**: Analizirani zahtjevi resursa za aplikacije
- [ ] **Optimizacija SKU-a**: Odabrane usluge koje su isplative
- [ ] **Automatizacija validacije**: Implementirane skripte za provjeru prije implementacije
- [ ] **Planiranje troškova**: Kreirani proračuni i procjene troškova za implementaciju
- [ ] **Procjena rizika**: Identificirani i umanjeni rizici implementacije

#### 🚨 Poglavlje 7: Rješavanje problema i otklanjanje pogrešaka
- [ ] **Dijagnostičke sposobnosti**: Uspješno otklonjene namjerno pokvarene implementacije
- [ ] **Analiza zapisa**: Učinkovito korišten Azure Monitor i Application Insights
- [ ] **Podešavanje performansi**: Optimizirane sporo radne aplikacije
- [ ] **Procedure oporavka**: Implementirani backup i oporavak od katastrofa
- [ ] **Postavljanje nadzora**: Kreiran proaktivan nadzor i upozoravanje

#### 🏢 Poglavlje 8: Produkcijski i korporativni obrasci
- [ ] **Sigurnost za poduzeća**: Implementirani opsežni sigurnosni obrasci
- [ ] **Okvir upravljanja**: Postavljen Azure Policy i upravljanje resursima
- [ ] **Napredni nadzor**: Kreirane nadzorne ploče i automatizirano upozoravanje
- [ ] **Integracija CI/CD**: Izgrađeni automatizirani pipelineovi za implementaciju
- [ ] **Implementacija usklađenosti**: Zadovoljeni zahtjevi usklađenosti poduzeća

### Vremenski plan učenja i prekretnice

#### Tjedni 1-2: Izgradnja temelja
- **Prekretnica**: Implementacija prve AI aplikacije koristeći AZD
- **Provjera**: Funkcionalna aplikacija dostupna preko javne URL adrese
- **Vještine**: Osnovni AZD tokovi rada i integracija AI servisa

#### Tjedni 3-4: Ovladavanje konfiguracijom
- **Prekretnica**: Implementacija u višestruka okruženja s sigurnom autentifikacijom
- **Provjera**: Ista aplikacija implementirana u razvojnom/testnom/produkcijskom okruženju
- **Vještine**: Upravljanje okruženjima i implementacija sigurnosti

#### Tjedni 5-6: Stručnost u infrastrukturi
- **Prekretnica**: Prilagođeni predložak za složenu aplikaciju s više servisa
- **Provjera**: Višekratni predložak implementira drugi član tima
- **Vještine**: Ovladavanje Bicepom i automatizacija infrastrukture

#### Tjedni 7-8: Napredna AI implementacija
- **Prekretnica**: Produkcijski spremno AI rješenje s više agenata
- **Provjera**: Sustav rukuje stvarnim opterećenjem uz nadzor
- **Vještine**: Orkestracija više agenata i optimizacija performansi

#### Tjedni 9-10: Spremnost za produkciju
- **Prekretnica**: Implementacija razine poduzeća s potpunom usklađenošću
- **Provjera**: Prolaz sigurnosne revizije i revizije optimizacije troškova
- **Vještine**: Upravljanje, monitoring i integracija CI/CD

### Procjena i certifikacija

#### Metode validacije znanja
1. **Praktične implementacije**: Funkcionalne aplikacije za svako poglavlje  
2. **Pregledi koda**: Procjena kvalitete predložaka i konfiguracija  
3. **Rješavanje problema**: Scenariji i rješenja za rješavanje problema  
4. **Podučavanje kolega**: Objašnjenje koncepata drugim učenicima  
5. **Doprinos zajednici**: Dijeljenje predložaka ili poboljšanja  

#### Ishodi profesionalnog razvoja
- **Projekti u portfelju**: 8 produkcijski spremnih implementacija  
- **Tehničke vještine**: Stručnost u industrijskim standardima za AZD i AI implementaciju  
- **Sposobnosti rješavanja problema**: Neovisno otklanjanje problema i optimizacija  
- **Priznanje zajednice**: Aktivno sudjelovanje u Azure zajednici developera  
- **Napredovanje u karijeri**: Vještine izravno primjenjive na uloge u oblaku i AI-u  

#### Mjerila uspjeha  
- **Stopa uspješnosti implementacija**: >95% uspješnih implementacija  
- **Vrijeme za otklanjanje problema**: <30 minuta za uobičajene probleme  
- **Optimizacija performansi**: Dokazive poboljšanja u troškovima i izvedbi  
- **Sigurnosna usklađenost**: Sve implementacije zadovoljavaju standarde sigurnosti poduzeća  
- **Prijenos znanja**: Sposobnost mentoriranja drugih developera  

### Kontinuirano učenje i angažman u zajednici  

#### Ostanite u toku  
- **Azure novosti**: Pratite bilješke o izdanju Azure Developer CLI  
- **Događaji zajednice**: Sudjelujte na Azure i AI događajima za developere  
- **Dokumentacija**: Doprinesite dokumentaciji i primjerima zajednice  
- **Povratna informacija**: Davanje povratnih informacija o sadržaju tečaja i Azure uslugama  

#### Razvoj karijere  
- **Profesionalna mreža**: Povežite se s Azure i AI stručnjacima  
- **Mogućnosti prezentiranja**: Izložite svoja saznanja na konferencijama ili meetup-ima  
- **Doprinos open source-u**: Doprinesite AZD predlošcima i alatima  
- **Mentorstvo**: Vodite druge developere u njihovom AZD putovanju učenja  

---

**Navigacija poglavljima:**  
- **📚 Početak tečaja**: [AZD za početnike](../README.md)  
- **📖 Počnite učiti**: [Poglavlje 1: Osnove i brzi početak](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Praćenje napretka**: Pratite svoj napredak kroz sveobuhvatan sustav učenja od 8 poglavlja  
- **🤝 Zajednica**: [Azure Discord](https://discord.gg/microsoft-azure) za podršku i raspravu  

**Praćenje napretka u učenju**: Koristite ovaj strukturirani vodič za savladavanje Azure Developer CLI kroz progresivno, praktično učenje s mjerljivim rezultatima i profesionalnim razvojnim prednostima.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati službenim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazuma ili kriva tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
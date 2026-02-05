# Vodič za učenje - Sveobuhvatni ciljevi učenja

**Navigacija kroz put učenja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Započni učenje**: [Poglavlje 1: Osnove i brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Praćenje napretka**: [Završetak tečaja](../README.md#-course-completion--certification)

## Uvod

Ovaj sveobuhvatni vodič za učenje pruža strukturirane ciljeve učenja, ključne koncepte, vježbe i materijale za procjenu kako biste savladali Azure Developer CLI (azd). Koristite ovaj vodič za praćenje napretka i osigurajte da ste obuhvatili sve bitne teme.

## Ciljevi učenja

Završetkom ovog vodiča za učenje, moći ćete:
- Savladati sve osnovne i napredne koncepte Azure Developer CLI-a
- Razviti praktične vještine u implementaciji i upravljanju Azure aplikacijama
- Steći samopouzdanje u rješavanju problema i optimizaciji implementacija
- Razumjeti prakse spremne za produkciju i sigurnosne aspekte implementacije

## Ishodi učenja

Nakon završetka svih dijelova ovog vodiča za učenje, moći ćete:
- Dizajnirati, implementirati i upravljati kompletnim arhitekturama aplikacija koristeći azd
- Provoditi sveobuhvatne strategije za praćenje, sigurnost i optimizaciju troškova
- Samostalno rješavati složene probleme implementacije
- Kreirati prilagođene predloške i doprinositi azd zajednici

## Struktura učenja u 8 poglavlja

### Poglavlje 1: Osnove i brzi početak (1. tjedan)
**Trajanje**: 30-45 minuta | **Složenost**: ⭐

#### Ciljevi učenja
- Razumjeti osnovne koncepte i terminologiju Azure Developer CLI-a
- Uspješno instalirati i konfigurirati AZD na vašoj razvojnoj platformi
- Implementirati svoju prvu aplikaciju koristeći postojeći predložak
- Učinkovito se kretati kroz AZD sučelje naredbenog retka

#### Ključni koncepti za savladavanje
- Struktura i komponente AZD projekta (azure.yaml, infra/, src/)
- Radni tijekovi implementacije temeljeni na predlošcima
- Osnove konfiguracije okruženja
- Upravljanje grupama resursa i pretplatama

#### Praktične vježbe
1. **Provjera instalacije**: Instalirajte AZD i provjerite s `azd version`
2. **Prva implementacija**: Uspješno implementirajte predložak todo-nodejs-mongo
3. **Postavljanje okruženja**: Konfigurirajte svoje prve varijable okruženja
4. **Istraživanje resursa**: Pregledajte implementirane resurse u Azure Portalu

#### Pitanja za procjenu
- Koje su osnovne komponente AZD projekta?
- Kako inicijalizirati novi projekt iz predloška?
- Koja je razlika između `azd up` i `azd deploy`?
- Kako upravljati višestrukim okruženjima s AZD-om?

---

### Poglavlje 2: Razvoj temeljen na AI-u (2. tjedan)
**Trajanje**: 1-2 sata | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Integrirati Microsoft Foundry usluge s AZD radnim tijekovima
- Implementirati i konfigurirati aplikacije temeljene na AI-u
- Razumjeti obrasce implementacije RAG-a (Retrieval-Augmented Generation)
- Upravljati implementacijama AI modela i skaliranjem

#### Ključni koncepti za savladavanje
- Integracija Azure OpenAI usluge i upravljanje API-jem
- Konfiguracija AI pretraživanja i indeksiranje vektora
- Strategije implementacije modela i planiranje kapaciteta
- Praćenje AI aplikacija i optimizacija performansi

#### Praktične vježbe
1. **Implementacija AI chata**: Implementirajte predložak azure-search-openai-demo
2. **RAG implementacija**: Konfigurirajte indeksiranje i dohvaćanje dokumenata
3. **Konfiguracija modela**: Postavite više AI modela s različitim namjenama
4. **Praćenje AI-a**: Implementirajte Application Insights za AI radna opterećenja

#### Pitanja za procjenu
- Kako konfigurirati Azure OpenAI usluge u AZD predlošku?
- Koje su ključne komponente RAG arhitekture?
- Kako upravljati kapacitetom i skaliranjem AI modela?
- Koje su metrike praćenja važne za AI aplikacije?

---

### Poglavlje 3: Konfiguracija i autentifikacija (3. tjedan)
**Trajanje**: 45-60 minuta | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Savladati strategije konfiguracije i upravljanja okruženjem
- Implementirati sigurne obrasce autentifikacije i upravljane identitete
- Organizirati resurse s pravilnim konvencijama imenovanja
- Konfigurirati implementacije za više okruženja (razvoj, testiranje, produkcija)

#### Ključni koncepti za savladavanje
- Hijerarhija okruženja i prioritet konfiguracije
- Upravljani identitet i autentifikacija servisnih principala
- Integracija Key Vault-a za upravljanje tajnama
- Upravljanje parametrima specifičnim za okruženje

#### Praktične vježbe
1. **Postavljanje više okruženja**: Konfigurirajte razvojna, testna i produkcijska okruženja
2. **Sigurnosna konfiguracija**: Implementirajte autentifikaciju upravljanim identitetom
3. **Upravljanje tajnama**: Integrirajte Azure Key Vault za osjetljive podatke
4. **Upravljanje parametrima**: Kreirajte konfiguracije specifične za okruženje

#### Pitanja za procjenu
- Kako konfigurirati različita okruženja s AZD-om?
- Koje su prednosti korištenja upravljanog identiteta u odnosu na servisne principe?
- Kako sigurno upravljati tajnama aplikacije?
- Koja je hijerarhija konfiguracije u AZD-u?

---

### Poglavlje 4: Infrastruktura kao kod i implementacija (4.-5. tjedan)
**Trajanje**: 1-1.5 sati | **Složenost**: ⭐⭐⭐

#### Ciljevi učenja
- Kreirati i prilagoditi Bicep predloške infrastrukture
- Implementirati napredne obrasce i radne tijekove implementacije
- Razumjeti strategije za dodjelu resursa
- Dizajnirati skalabilne arhitekture s više usluga

- Implementirati aplikacije u kontejnerima koristeći Azure Container Apps i AZD

#### Ključni koncepti za savladavanje
- Struktura Bicep predloška i najbolje prakse
- Ovisnosti resursa i redoslijed implementacije
- Datoteke parametara i modularnost predloška
- Prilagođeni hooks i automatizacija implementacije
- Obrasci implementacije aplikacija u kontejnerima (brzi početak, produkcija, mikroservisi)

#### Praktične vježbe
1. **Kreiranje prilagođenog predloška**: Izradite predložak aplikacije s više usluga
2. **Savladavanje Bicepa**: Kreirajte modularne, ponovno upotrebljive komponente infrastrukture
3. **Automatizacija implementacije**: Implementirajte pre/post hooks za implementaciju
4. **Dizajn arhitekture**: Implementirajte složenu arhitekturu mikroservisa
5. **Implementacija aplikacija u kontejnerima**: Implementirajte primjere [Simple Flask API](../../../examples/container-app/simple-flask-api) i [Microservices Architecture](../../../examples/container-app/microservices) koristeći AZD

#### Pitanja za procjenu
- Kako kreirati prilagođene Bicep predloške za AZD?
- Koje su najbolje prakse za organizaciju koda infrastrukture?
- Kako upravljati ovisnostima resursa u predlošcima?
- Koji obrasci implementacije podržavaju ažuriranja bez zastoja?

---

### Poglavlje 5: AI rješenja s više agenata (6.-7. tjedan)
**Trajanje**: 2-3 sata | **Složenost**: ⭐⭐⭐⭐

#### Ciljevi učenja
- Dizajnirati i implementirati arhitekture AI s više agenata
- Orkestrirati koordinaciju i komunikaciju agenata
- Implementirati AI rješenja spremna za produkciju s praćenjem
- Razumjeti specijalizaciju agenata i obrasce radnih tijekova
- Integrirati mikroservise u kontejnerima kao dio rješenja s više agenata

#### Ključni koncepti za savladavanje
- Obrasci arhitekture s više agenata i principi dizajna
- Protokoli komunikacije agenata i tok podataka
- Strategije balansiranja opterećenja i skaliranja za AI agente
- Praćenje produkcije za sustave s više agenata
- Komunikacija između usluga u okruženjima s kontejnerima

#### Praktične vježbe
1. **Implementacija rješenja za maloprodaju**: Implementirajte kompletan scenarij maloprodaje s više agenata
2. **Prilagodba agenata**: Modificirajte ponašanje agenata za kupce i inventar
3. **Skaliranje arhitekture**: Implementirajte balansiranje opterećenja i automatsko skaliranje
4. **Praćenje produkcije**: Postavite sveobuhvatno praćenje i upozorenja
5. **Integracija mikroservisa**: Proširite primjer [Microservices Architecture](../../../examples/container-app/microservices) kako bi podržavao radne tijekove temeljene na agentima

#### Pitanja za procjenu
- Kako dizajnirati učinkovite obrasce komunikacije agenata?
- Koji su ključni aspekti skaliranja radnih opterećenja AI agenata?
- Kako pratiti i otklanjati probleme u sustavima s više agenata?
- Koji obrasci produkcije osiguravaju pouzdanost za AI agente?

---

### Poglavlje 6: Validacija prije implementacije i planiranje (8. tjedan)
**Trajanje**: 1 sat | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Provoditi sveobuhvatno planiranje kapaciteta i validaciju resursa
- Odabrati optimalne Azure SKU-ove za isplativost
- Implementirati automatizirane provjere prije implementacije
- Planirati implementacije s strategijama optimizacije troškova

#### Ključni koncepti za savladavanje
- Azure kvote resursa i ograničenja kapaciteta
- Kriteriji za odabir SKU-ova i optimizacija troškova
- Automatizirani skripti za validaciju i testiranje
- Planiranje implementacije i procjena rizika

#### Praktične vježbe
1. **Analiza kapaciteta**: Analizirajte zahtjeve resursa za vaše aplikacije
2. **Optimizacija SKU-ova**: Usporedite i odaberite isplative razine usluga
3. **Automatizacija validacije**: Implementirajte skripte za provjeru prije implementacije
4. **Planiranje troškova**: Kreirajte procjene troškova implementacije i proračune

#### Pitanja za procjenu
- Kako validirati Azure kapacitet prije implementacije?
- Koji faktori utječu na odluke o odabiru SKU-ova?
- Kako automatizirati validaciju prije implementacije?
- Koje strategije pomažu optimizirati troškove implementacije?

---

### Poglavlje 7: Otklanjanje problema i ispravljanje grešaka (9. tjedan)
**Trajanje**: 1-1.5 sati | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Razviti sustavne pristupe otklanjanju problema za AZD implementacije
- Rješavati uobičajene probleme implementacije i konfiguracije
- Otklanjati specifične probleme vezane uz AI i performanse
- Implementirati praćenje i upozorenja za proaktivno otkrivanje problema

#### Ključni koncepti za savladavanje
- Tehnike dijagnostike i strategije zapisivanja
- Uobičajeni obrasci neuspjeha i njihova rješenja
- Praćenje performansi i optimizacija
- Postupci odgovora na incidente i oporavka

#### Praktične vježbe
1. **Dijagnostičke vještine**: Vježbajte s namjerno neispravnim implementacijama
2. **Analiza zapisa**: Učinkovito koristite Azure Monitor i Application Insights
3. **Optimizacija performansi**: Optimizirajte aplikacije s lošim performansama
4. **Postupci oporavka**: Implementirajte backup i oporavak od katastrofe

#### Pitanja za procjenu
- Koji su najčešći neuspjesi implementacije AZD-a?
- Kako otkloniti probleme s autentifikacijom i dozvolama?
- Koje strategije praćenja pomažu spriječiti probleme u produkciji?
- Kako optimizirati performanse aplikacija u Azure-u?

---

### Poglavlje 8: Produkcija i obrasci za poduzeća (10.-11. tjedan)
**Trajanje**: 2-3 sata | **Složenost**: ⭐⭐⭐⭐

#### Ciljevi učenja
- Implementirati strategije implementacije na razini poduzeća
- Dizajnirati sigurnosne obrasce i okvire za usklađenost
- Uspostaviti praćenje, upravljanje i kontrolu troškova
- Kreirati skalabilne CI/CD pipelineove s AZD integracijom
- Primijeniti najbolje prakse za produkcijske implementacije aplikacija u kontejnerima (sigurnost, praćenje, troškovi, CI/CD)

#### Ključni koncepti za savladavanje
- Sigurnosni zahtjevi i zahtjevi za usklađenost na razini poduzeća
- Okviri za upravljanje i implementaciju politika
- Napredno praćenje i upravljanje troškovima
- CI/CD integracija i automatizirani pipelineovi implementacije
- Strategije implementacije bez zastoja (blue-green, canary) za radna opterećenja u kontejnerima

#### Praktične vježbe
1. **Sigurnost na razini poduzeća**: Implementirajte sveobuhvatne sigurnosne obrasce
2. **Okvir za upravljanje**: Postavite Azure Policy i upravljanje resursima
3. **Napredno praćenje**: Kreirajte nadzorne ploče i automatizirana upozorenja
4. **CI/CD integracija**: Izgradite automatizirane pipelineove implementacije
5. **Produkcijske aplikacije u kontejnerima**: Primijenite sigurnost, praćenje i optimizaciju troškova na primjer [Microservices Architecture](../../../examples/container-app/microservices)

#### Pitanja za procjenu
- Kako implementirati sigurnost na razini poduzeća u AZD implementacijama?
- Koji obrasci upravljanja osiguravaju usklađenost i kontrolu troškova?
- Kako dizajnirati skalabilno praćenje za produkcijske sustave?
- Koji CI/CD obrasci najbolje funkcioniraju s AZD radnim tijekovima?

#### Ciljevi učenja
- Razumjeti osnove i ključne koncepte Azure Developer CLI-a
- Uspješno instalirati i konfigurirati azd na vašem razvojnom okruženju
- Završiti svoju prvu implementaciju koristeći postojeći predložak
- Navigirati kroz strukturu azd projekta i razumjeti ključne komponente

#### Ključni koncepti za savladavanje
- Predlošci, okruženja i usluge
- Struktura konfiguracije azure.yaml
- Osnovne azd naredbe (init, up, down, deploy)
- Principi infrastrukture kao koda
- Azure autentifikacija i autorizacija

#### Praktične vježbe

**Vježba 1.1: Instalacija i postavljanje**
```bash
# Dovršite ove zadatke:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Vježba 1.2: Prva implementacija**
```bash
# Implementirajte jednostavnu web aplikaciju:
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

#### Pitanja za samoprocjenu
1. Koja su tri osnovna koncepta azd arhitekture?
2. Koja je svrha datoteke azure.yaml?
3. Kako okruženja pomažu u upravljanju različitim ciljevima implementacije?
4. Koje metode autentifikacije se mogu koristiti s azd-om?
5. Što se događa kada prvi put pokrenete `azd up`?

---

## Praćenje napretka i okvir za procjenu
```bash
# Kreirajte i konfigurirajte više okruženja:
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

**Vježba 2.3: Sigurnosna konfiguracija**
@@
5. Koji su ključni faktori za implementaciju u više regija?

### Modul 4: Validacija prije implementacije (Tjedan 5)

#### Ciljevi učenja
- Provesti sveobuhvatne provjere prije implementacije
- Ovladati planiranjem kapaciteta i validacijom resursa
- Razumjeti odabir SKU-a i optimizaciju troškova
- Izgraditi automatizirane validacijske procese

#### Ključni koncepti za savladavanje
- Kvote i ograničenja resursa u Azureu
- Kriteriji za odabir SKU-a i utjecaj na troškove
- Automatizirani validacijski skripti i alati
- Metodologije planiranja kapaciteta
- Testiranje performansi i optimizacija

#### Vježbe

**Vježba 4.1: Planiranje kapaciteta**
```bash
# Provedi provjeru kapaciteta:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Vježba 4.2: Validacija prije implementacije**
```powershell
# Izgradite sveobuhvatni validacijski sustav:
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

#### Pitanja za samoprocjenu
1. Koji faktori trebaju utjecati na odluke o odabiru SKU-a?
2. Kako provjeriti dostupnost resursa u Azureu prije implementacije?
3. Koji su ključni elementi sustava za provjeru prije implementacije?
4. Kako procijeniti i kontrolirati troškove implementacije?
5. Koje je praćenje ključno za planiranje kapaciteta?

### Modul 5: Rješavanje problema i otklanjanje grešaka (Tjedan 6)

#### Ciljevi učenja
- Ovladati sustavnim metodologijama za rješavanje problema
- Razviti stručnost u otklanjanju složenih problema implementacije
- Implementirati sveobuhvatno praćenje i upozorenja
- Izgraditi procedure za odgovor na incidente i oporavak

#### Ključni koncepti za savladavanje
- Uobičajeni obrasci neuspjeha implementacije
- Analiza logova i tehnike korelacije
- Praćenje performansi i optimizacija
- Otkrivanje sigurnosnih incidenata i odgovor
- Oporavak od katastrofe i kontinuitet poslovanja

#### Vježbe

**Vježba 5.1: Scenariji rješavanja problema**
```bash
# Vježbajte rješavanje uobičajenih problema:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Vježba 5.2: Implementacija praćenja**
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
# Izradite procedure za odgovor na incidente:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Pitanja za samoprocjenu
1. Koji je sustavni pristup rješavanju problema azd implementacija?
2. Kako korelirati logove između više servisa i resursa?
3. Koje su metrike praćenja najvažnije za rano otkrivanje problema?
4. Kako implementirati učinkovite procedure za oporavak od katastrofe?
5. Koji su ključni elementi plana za odgovor na incidente?

### Modul 6: Napredne teme i najbolje prakse (Tjedan 7-8)

#### Ciljevi učenja
- Implementirati obrasce implementacije na razini poduzeća
- Ovladati integracijom i automatizacijom CI/CD-a
- Razviti prilagođene predloške i doprinijeti zajednici
- Razumjeti napredne sigurnosne zahtjeve i zahtjeve usklađenosti

#### Ključni koncepti za savladavanje
- Obrasci integracije CI/CD pipelinea
- Razvoj i distribucija prilagođenih predložaka
- Upravljanje i usklađenost na razini poduzeća
- Napredne konfiguracije mreže i sigurnosti
- Optimizacija performansi i upravljanje troškovima

#### Vježbe

**Vježba 6.1: Integracija CI/CD-a**
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
# Kreirajte i objavite prilagođene predloške:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Vježba 6.3: Implementacija na razini poduzeća**
```bash
# Implementirajte značajke na razini poduzeća:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Pitanja za samoprocjenu
1. Kako integrirati azd u postojeće CI/CD radne procese?
2. Koji su ključni faktori za razvoj prilagođenih predložaka?
3. Kako implementirati upravljanje i usklađenost u azd implementacijama?
4. Koje su najbolje prakse za implementacije na razini poduzeća?
5. Kako učinkovito doprinijeti azd zajednici?

## Praktični projekti

### Projekt 1: Osobna web stranica portfelja
**Složenost**: Početnik  
**Trajanje**: 1-2 tjedna

Izradite i implementirajte osobnu web stranicu portfelja koristeći:
- Hosting statičke web stranice na Azure Storageu
- Konfiguraciju prilagođene domene
- Integraciju CDN-a za globalne performanse
- Automatizirani proces implementacije

**Rezultati**:
- Funkcionalna web stranica implementirana na Azureu
- Prilagođeni azd predložak za implementaciju portfelja
- Dokumentacija procesa implementacije
- Preporuke za analizu i optimizaciju troškova

### Projekt 2: Aplikacija za upravljanje zadacima
**Složenost**: Srednje  
**Trajanje**: 2-3 tjedna

Izradite aplikaciju za upravljanje zadacima s punim stackom:
- React frontend implementiran na App Service
- Node.js API backend s autentifikacijom
- PostgreSQL baza podataka s migracijama
- Praćenje putem Application Insightsa

**Rezultati**:
- Kompletna aplikacija s korisničkom autentifikacijom
- Shema baze podataka i skripte za migraciju
- Nadzorne ploče za praćenje i pravila upozorenja
- Konfiguracija implementacije za više okruženja

### Projekt 3: Platforma za e-trgovinu temeljena na mikroservisima
**Složenost**: Napredno  
**Trajanje**: 4-6 tjedana

Dizajnirajte i implementirajte platformu za e-trgovinu temeljenu na mikroservisima:
- Više API servisa (katalog, narudžbe, plaćanja, korisnici)
- Integracija redova poruka sa Service Busom
- Redis cache za optimizaciju performansi
- Sveobuhvatno logiranje i praćenje

**Referentni primjer**: Pogledajte [Arhitektura mikroservisa](../../../examples/container-app/microservices) za predložak spreman za produkciju i vodič za implementaciju

**Rezultati**:
- Kompletna arhitektura mikroservisa
- Obrasci komunikacije između servisa
- Testiranje performansi i optimizacija
- Implementacija sigurnosti spremna za produkciju

## Procjena i certifikacija

### Provjere znanja

Dovršite ove procjene nakon svakog modula:

**Procjena modula 1**: Osnovni koncepti i instalacija
- Pitanja s višestrukim izborom o osnovnim konceptima
- Praktični zadaci instalacije i konfiguracije
- Jednostavna vježba implementacije

**Procjena modula 2**: Konfiguracija i okruženja
- Scenariji upravljanja okruženjima
- Vježbe za rješavanje problema s konfiguracijom
- Implementacija sigurnosne konfiguracije

**Procjena modula 3**: Implementacija i provisioniranje
- Izazovi dizajna infrastrukture
- Scenariji implementacije više servisa
- Vježbe optimizacije performansi

**Procjena modula 4**: Validacija prije implementacije
- Studije slučaja planiranja kapaciteta
- Scenariji optimizacije troškova
- Implementacija validacijskih procesa

**Procjena modula 5**: Rješavanje problema i otklanjanje grešaka
- Vježbe dijagnosticiranja problema
- Zadaci implementacije praćenja
- Simulacije odgovora na incidente

**Procjena modula 6**: Napredne teme
- Dizajn CI/CD pipelinea
- Razvoj prilagođenih predložaka
- Scenariji arhitekture na razini poduzeća

### Završni projekt

Dizajnirajte i implementirajte kompletno rješenje koje demonstrira savladavanje svih koncepata:

**Zahtjevi**:
- Arhitektura aplikacije s više slojeva
- Više okruženja za implementaciju
- Sveobuhvatno praćenje i upozorenja
- Implementacija sigurnosti i usklađenosti
- Optimizacija troškova i performansi
- Kompletna dokumentacija i priručnici

**Kriteriji za evaluaciju**:
- Kvaliteta tehničke implementacije
- Potpunost dokumentacije
- Poštivanje sigurnosnih i najboljih praksi
- Optimizacija performansi i troškova
- Učinkovitost rješavanja problema i praćenja

## Resursi za učenje i reference

### Službena dokumentacija
- [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Dokumentacija za Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Resursi zajednice
- [Galerija predložaka AZD](https://azure.github.io/awesome-azd/)
- [GitHub organizacija Azure-Samples](https://github.com/Azure-Samples)
- [GitHub repozitorij za Azure Developer CLI](https://github.com/Azure/azure-dev)

### Praktična okruženja
- [Besplatni Azure račun](https://azure.microsoft.com/free/)
- [Besplatni sloj Azure DevOpsa](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Dodatni alati
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Preporuke za raspored učenja

### Puno radno vrijeme (8 tjedana)
- **Tjedni 1-2**: Moduli 1-2 (Početak rada, Konfiguracija)
- **Tjedni 3-4**: Moduli 3-4 (Implementacija, Validacija prije implementacije)
- **Tjedni 5-6**: Moduli 5-6 (Rješavanje problema, Napredne teme)
- **Tjedni 7-8**: Praktični projekti i završna procjena

### Pola radnog vremena (16 tjedana)
- **Tjedni 1-4**: Modul 1 (Početak rada)
- **Tjedni 5-7**: Modul 2 (Konfiguracija i okruženja)
- **Tjedni 8-10**: Modul 3 (Implementacija i provisioniranje)
- **Tjedni 11-12**: Modul 4 (Validacija prije implementacije)
- **Tjedni 13-14**: Modul 5 (Rješavanje problema i otklanjanje grešaka)
- **Tjedni 15-16**: Modul 6 (Napredne teme i procjena)

---

## Praćenje napretka i okvir za procjenu

### Popis za provjeru završetka poglavlja

Pratite svoj napredak kroz svako poglavlje pomoću ovih mjerljivih rezultata:

#### 📚 Poglavlje 1: Osnove i brzi početak
- [ ] **Instalacija dovršena**: AZD instaliran i provjeren na vašoj platformi
- [ ] **Prva implementacija**: Uspješno implementiran todo-nodejs-mongo predložak
- [ ] **Postavljanje okruženja**: Konfigurirane prve varijable okruženja
- [ ] **Navigacija resursima**: Istraženi implementirani resursi u Azure Portalu
- [ ] **Ovladavanje naredbama**: Ugodno korištenje osnovnih AZD naredbi

#### 🤖 Poglavlje 2: Razvoj temeljen na AI-u  
- [ ] **Implementacija AI predloška**: Uspješno implementiran azure-search-openai-demo
- [ ] **Implementacija RAG-a**: Konfigurirano indeksiranje i dohvaćanje dokumenata
- [ ] **Konfiguracija modela**: Postavljeni različiti AI modeli s različitim namjenama
- [ ] **Praćenje AI-a**: Implementiran Application Insights za AI radna opterećenja
- [ ] **Optimizacija performansi**: Poboljšane performanse AI aplikacije

#### ⚙️ Poglavlje 3: Konfiguracija i autentifikacija
- [ ] **Postavljanje više okruženja**: Konfigurirana razvojna, testna i produkcijska okruženja
- [ ] **Implementacija sigurnosti**: Postavljena autentifikacija putem upravljanog identiteta
- [ ] **Upravljanje tajnama**: Integriran Azure Key Vault za osjetljive podatke
- [ ] **Upravljanje parametrima**: Kreirane konfiguracije specifične za okruženje
- [ ] **Ovladavanje autentifikacijom**: Implementirani sigurni obrasci pristupa

#### 🏗️ Poglavlje 4: Infrastruktura kao kod i implementacija
- [ ] **Izrada prilagođenog predloška**: Izgrađen predložak za aplikaciju s više servisa
- [ ] **Ovladavanje Bicepom**: Kreirane modularne, ponovno upotrebljive komponente infrastrukture
- [ ] **Automatizacija implementacije**: Implementirani pre/post hooks za implementaciju
- [ ] **Dizajn arhitekture**: Implementirana složena arhitektura mikroservisa
- [ ] **Optimizacija predloška**: Optimizirani predlošci za performanse i troškove

#### 🎯 Poglavlje 5: AI rješenja s više agenata
- [ ] **Implementacija rješenja za maloprodaju**: Implementiran kompletan scenarij maloprodaje s više agenata
- [ ] **Prilagodba agenata**: Modificirano ponašanje agenata za korisnike i inventar
- [ ] **Skaliranje arhitekture**: Implementirano balansiranje opterećenja i automatsko skaliranje
- [ ] **Praćenje u produkciji**: Postavljeno sveobuhvatno praćenje i upozorenja
- [ ] **Optimizacija performansi**: Poboljšane performanse sustava s više agenata

#### 🔍 Poglavlje 6: Validacija prije implementacije i planiranje
- [ ] **Analiza kapaciteta**: Analizirani zahtjevi za resursima aplikacija
- [ ] **Optimizacija SKU-a**: Odabrani troškovno učinkoviti servisi
- [ ] **Automatizacija validacije**: Implementirani skripti za provjeru prije implementacije
- [ ] **Planiranje troškova**: Kreirane procjene troškova implementacije i proračuni
- [ ] **Procjena rizika**: Identificirani i ublaženi rizici implementacije

#### 🚨 Poglavlje 7: Rješavanje problema i otklanjanje grešaka
- [ ] **Dijagnostičke vještine**: Uspješno otklonjeni namjerno izazvani problemi implementacije
- [ ] **Analiza logova**: Učinkovito korištenje Azure Monitora i Application Insightsa
- [ ] **Optimizacija performansi**: Poboljšane performanse sporih aplikacija
- [ ] **Procedure oporavka**: Implementirani backup i oporavak od katastrofe
- [ ] **Postavljanje praćenja**: Kreirano proaktivno praćenje i upozorenja

#### 🏢 Poglavlje 8: Produkcija i obrasci na razini poduzeća
- [ ] **Sigurnost na razini poduzeća**: Implementirani sveobuhvatni sigurnosni obrasci
- [ ] **Okvir upravljanja**: Postavljena Azure Policy i upravljanje resursima
- [ ] **Napredno praćenje**: Kreirane nadzorne ploče i automatizirana upozorenja
- [ ] **Integracija CI/CD-a**: Izgrađeni automatizirani procesi implementacije
- [ ] **Implementacija usklađenosti**: Zadovoljeni zahtjevi usklađenosti na razini poduzeća

### Vremenski okvir učenja i prekretnice

#### Tjedan 1-2: Izgradnja temelja
- **Prekretnica**: Implementacija prve AI aplikacije koristeći AZD
- **Validacija**: Funkcionalna aplikacija dostupna putem javnog URL-a
- **Vještine**: Osnovni AZD radni procesi i integracija AI servisa

#### Tjedan 3-4: Ovladavanje konfiguracijom
- **Prekretnica**: Implementacija u više okruženja sa sigurnom autentifikacijom
- **Validacija**: Ista aplikacija implementirana u razvojno/testno/produkcijsko okruženje
- **Vještine**: Upravljanje okruženjima i implementacija sigurnosti

#### Tjedan 5-6: Stručnost u infrastrukturi
- **Prekretnica**: Prilagođeni predložak za složenu aplikaciju s više servisa
- **Validacija**: Ponovno upotrebljiv predložak implementiran od strane drugog člana t
5. **Doprinos zajednici**: Podijelite predloške ili poboljšanja

#### Ishodi profesionalnog razvoja
- **Projekti za portfelj**: 8 implementacija spremnih za produkciju
- **Tehničke vještine**: Stručnost u industrijskim standardima AZD i AI implementacijama
- **Sposobnosti rješavanja problema**: Samostalno otklanjanje poteškoća i optimizacija
- **Prepoznavanje u zajednici**: Aktivno sudjelovanje u Azure zajednici za razvojne programere
- **Napredak u karijeri**: Vještine direktno primjenjive na uloge u oblaku i AI-u

#### Metrike uspjeha
- **Stopa uspješnih implementacija**: >95% uspješnih implementacija
- **Vrijeme otklanjanja poteškoća**: <30 minuta za uobičajene probleme
- **Optimizacija performansi**: Vidljiva poboljšanja u troškovima i performansama
- **Sigurnosna usklađenost**: Sve implementacije zadovoljavaju standarde sigurnosti za poduzeća
- **Prenošenje znanja**: Sposobnost mentoriranja drugih programera

### Kontinuirano učenje i angažman u zajednici

#### Ostanite u toku
- **Azure novosti**: Pratite bilješke o izdanjima Azure Developer CLI
- **Događaji zajednice**: Sudjelujte u događajima za Azure i AI programere
- **Dokumentacija**: Doprinesite dokumentaciji zajednice i primjerima
- **Povratne informacije**: Pružite povratne informacije o sadržaju tečaja i Azure uslugama

#### Razvoj karijere
- **Profesionalna mreža**: Povežite se s Azure i AI stručnjacima
- **Prilike za govore**: Predstavite svoja saznanja na konferencijama ili okupljanjima
- **Doprinos otvorenom kodu**: Doprinesite AZD predlošcima i alatima
- **Mentorstvo**: Vodite druge programere u njihovom AZD procesu učenja

---

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Započnite učenje**: [Poglavlje 1: Osnove i brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Praćenje napretka**: Pratite svoj napredak kroz sveobuhvatan sustav učenja od 8 poglavlja
- **🤝 Zajednica**: [Azure Discord](https://discord.gg/microsoft-azure) za podršku i raspravu

**Praćenje napretka u učenju**: Koristite ovaj strukturirani vodič za savladavanje Azure Developer CLI-a kroz progresivno, praktično učenje s mjerljivim ishodima i profesionalnim razvojnim prednostima.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o odricanju odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:15:27+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "hr"
}
-->
# Vodič za učenje - AZD za početnike

## Uvod

Ovaj sveobuhvatni vodič za učenje pruža strukturirane ciljeve učenja, ključne koncepte, vježbe i materijale za procjenu kako biste savladali Azure Developer CLI (azd). Koristite ovaj vodič za praćenje napretka i osigurajte da ste pokrili sve bitne teme.

## Ciljevi učenja

Završetkom ovog vodiča za učenje, moći ćete:
- Savladati sve osnovne i napredne koncepte Azure Developer CLI-a
- Razviti praktične vještine u implementaciji i upravljanju Azure aplikacijama
- Steći samopouzdanje u rješavanju problema i optimizaciji implementacija
- Razumjeti prakse implementacije spremne za produkciju i sigurnosne aspekte

## Ishodi učenja

Nakon završetka svih dijelova ovog vodiča, moći ćete:
- Dizajnirati, implementirati i upravljati kompletnim arhitekturama aplikacija koristeći azd
- Provoditi sveobuhvatne strategije za praćenje, sigurnost i optimizaciju troškova
- Samostalno rješavati složene probleme implementacije
- Kreirati prilagođene predloške i doprinositi azd zajednici

## Struktura tečaja

### Modul 1: Početak rada (1.-2. tjedan)

#### Ciljevi učenja
- Razumjeti osnove i ključne koncepte Azure Developer CLI-a
- Uspješno instalirati i konfigurirati azd u svom razvojnom okruženju
- Izvršiti svoju prvu implementaciju koristeći postojeći predložak
- Navigirati kroz strukturu azd projekta i razumjeti ključne komponente

#### Ključni koncepti za savladavanje
- Predlošci, okruženja i usluge
- Struktura konfiguracije azure.yaml
- Osnovne azd naredbe (init, up, down, deploy)
- Principi infrastrukture kao koda
- Azure autentifikacija i autorizacija

#### Vježbe

**Vježba 1.1: Instalacija i postavljanje**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Vježba 1.2: Prva implementacija**
```bash
# Deploy a simple web application:
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
1. Koja su tri ključna koncepta azd arhitekture?
2. Koja je svrha datoteke azure.yaml?
3. Kako okruženja pomažu u upravljanju različitim ciljevima implementacije?
4. Koje metode autentifikacije se mogu koristiti s azd-om?
5. Što se događa kada prvi put pokrenete `azd up`?

### Modul 2: Konfiguracija i okruženja (3. tjedan)

#### Ciljevi učenja
- Savladati upravljanje okruženjima i konfiguracijom
- Razumjeti napredne konfiguracije azure.yaml datoteke
- Implementirati postavke i varijable specifične za okruženje
- Konfigurirati autentifikaciju za različite scenarije

#### Ključni koncepti za savladavanje
- Hijerarhija okruženja i prioritet varijabli
- Konfiguracija usluga i parametri
- Hookovi i događaji životnog ciklusa
- Metode autentifikacije (korisnik, servisni principal, upravljani identitet)
- Upravljanje konfiguracijskim datotekama

#### Vježbe

**Vježba 2.1: Postavljanje više okruženja**
```bash
# Create and configure multiple environments:
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
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Pitanja za samoprocjenu
1. Kako azd upravlja prioritetima varijabli okruženja?
2. Što su hookovi za implementaciju i kada ih treba koristiti?
3. Kako konfigurirati različite SKU-ove za različita okruženja?
4. Koje su sigurnosne implikacije različitih metoda autentifikacije?
5. Kako upravljati tajnama i osjetljivim konfiguracijskim podacima?

### Modul 3: Implementacija i provisioniranje (4. tjedan)

#### Ciljevi učenja
- Savladati tijekove implementacije i najbolje prakse
- Razumjeti infrastrukturu kao kod koristeći Bicep predloške
- Implementirati složene arhitekture s više usluga
- Optimizirati performanse i pouzdanost implementacije

#### Ključni koncepti za savladavanje
- Struktura i moduli Bicep predloška
- Ovisnosti resursa i redoslijed
- Strategije implementacije (blue-green, rolling updates)
- Implementacije u više regija
- Migracije baza podataka i upravljanje podacima

#### Vježbe

**Vježba 3.1: Prilagođena infrastruktura**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Vježba 3.2: Aplikacija s više usluga**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Vježba 3.3: Integracija baze podataka**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Pitanja za samoprocjenu
1. Koje su prednosti korištenja Bicep-a u odnosu na ARM predloške?
2. Kako upravljati migracijama baza podataka u azd implementacijama?
3. Koje strategije postoje za implementacije bez zastoja?
4. Kako upravljati ovisnostima između usluga?
5. Koji su ključni aspekti implementacija u više regija?

### Modul 4: Validacija prije implementacije (5. tjedan)

#### Ciljevi učenja
- Provoditi sveobuhvatne provjere prije implementacije
- Savladati planiranje kapaciteta i validaciju resursa
- Razumjeti odabir SKU-ova i optimizaciju troškova
- Izgraditi automatizirane validacijske procese

#### Ključni koncepti za savladavanje
- Kvote i ograničenja Azure resursa
- Kriteriji za odabir SKU-ova i implikacije troškova
- Automatizirani validacijski skripti i alati
- Metodologije planiranja kapaciteta
- Testiranje performansi i optimizacija

#### Vježbe

**Vježba 4.1: Planiranje kapaciteta**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Vježba 4.2: Validacija prije implementacije**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Vježba 4.3: Optimizacija SKU-ova**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Pitanja za samoprocjenu
1. Koji faktori trebaju utjecati na odluke o odabiru SKU-ova?
2. Kako validirati dostupnost Azure resursa prije implementacije?
3. Koji su ključni dijelovi sustava za provjeru prije implementacije?
4. Kako procijeniti i kontrolirati troškove implementacije?
5. Koje su ključne metrike za planiranje kapaciteta?

### Modul 5: Rješavanje problema i otklanjanje grešaka (6. tjedan)

#### Ciljevi učenja
- Savladati sustavne metodologije za rješavanje problema
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
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Vježba 5.2: Implementacija praćenja**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Vježba 5.3: Odgovor na incidente**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Pitanja za samoprocjenu
1. Koji je sustavni pristup rješavanju problema azd implementacija?
2. Kako korelirati logove između više usluga i resursa?
3. Koje su najvažnije metrike za rano otkrivanje problema?
4. Kako implementirati učinkovite procedure za oporavak od katastrofe?
5. Koji su ključni dijelovi plana za odgovor na incidente?

### Modul 6: Napredne teme i najbolje prakse (7.-8. tjedan)

#### Ciljevi učenja
- Implementirati obrasce implementacije na razini poduzeća
- Savladati integraciju i automatizaciju CI/CD-a
- Razviti prilagođene predloške i doprinositi zajednici
- Razumjeti napredne sigurnosne zahtjeve i zahtjeve usklađenosti

#### Ključni koncepti za savladavanje
- Obrasci integracije CI/CD pipeline-a
- Razvoj i distribucija prilagođenih predložaka
- Upravljanje i usklađenost na razini poduzeća
- Napredne mrežne i sigurnosne konfiguracije
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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Vježba 6.3: Implementacija na razini poduzeća**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Pitanja za samoprocjenu
1. Kako integrirati azd u postojeće CI/CD tijekove rada?
2. Koji su ključni aspekti razvoja prilagođenih predložaka?
3. Kako implementirati upravljanje i usklađenost u azd implementacijama?
4. Koje su najbolje prakse za implementacije na razini poduzeća?
5. Kako učinkovito doprinositi azd zajednici?

## Praktični projekti

### Projekt 1: Osobna web stranica portfelja
**Složenost**: Početnik  
**Trajanje**: 1-2 tjedna

Izradite i implementirajte osobnu web stranicu portfelja koristeći:
- Hosting statičke web stranice na Azure Storage-u
- Konfiguraciju prilagođene domene
- Integraciju CDN-a za globalne performanse
- Automatizirani pipeline za implementaciju

**Rezultati**:
- Funkcionalna web stranica implementirana na Azure-u
- Prilagođeni azd predložak za implementaciju portfelja
- Dokumentacija procesa implementacije
- Preporuke za analizu i optimizaciju troškova

### Projekt 2: Aplikacija za upravljanje zadacima
**Složenost**: Srednje  
**Trajanje**: 2-3 tjedna

Izradite aplikaciju za upravljanje zadacima s punim stackom koristeći:
- React frontend implementiran na App Service
- Node.js API backend s autentifikacijom
- PostgreSQL bazu podataka s migracijama
- Praćenje putem Application Insights-a

**Rezultati**:
- Kompletna aplikacija s korisničkom autentifikacijom
- Shema baze podataka i skripte za migraciju
- Nadzorne ploče za praćenje i pravila upozorenja
- Konfiguracija implementacije za više okruženja

### Projekt 3: Platforma za e-trgovinu temeljena na mikroservisima
**Složenost**: Napredno  
**Trajanje**: 4-6 tjedana

Dizajnirajte i implementirajte platformu za e-trgovinu temeljenu na mikroservisima:
- Više API usluga (katalog, narudžbe, plaćanja, korisnici)
- Integracija redova poruka putem Service Bus-a
- Redis cache za optimizaciju performansi
- Sveobuhvatno logiranje i praćenje

**Rezultati**:
- Kompletna arhitektura mikroservisa
- Obrasci komunikacije između usluga
- Testiranje performansi i optimizacija
- Sigurnosna implementacija spremna za produkciju

## Procjena i certifikacija

### Provjere znanja

Dovršite ove procjene nakon svakog modula:

**Procjena modula 1**: Osnovni koncepti i instalacija
- Pitanja s višestrukim izborom o ključnim konceptima
- Praktični zadaci instalacije i konfiguracije
- Jednostavna vježba implementacije

**Procjena modula 2**: Konfiguracija i okruženja
- Scenariji upravljanja okruženjima
- Vježbe za rješavanje problema s konfiguracijom
- Implementacija sigurnosne konfiguracije

**Procjena modula 3**: Implementacija i provisioniranje
- Izazovi dizajna infrastrukture
- Scenariji implementacije s više usluga
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
- Dizajn CI/CD pipeline-a
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
- Kompletna dokumentacija i runbookovi

**Kriteriji evaluacije**:
- Kvaliteta tehničke implementacije
- Potpunost dokumentacije
- Poštivanje sigurnosnih i najboljih praksi
- Optimizacija performansi i troškova
- Učinkovitost rješavanja problema i praćenja

## Resursi za učenje i reference

### Službena dokumentacija
- [Azure Developer CLI Dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Arhitekturni centar](https://learn.microsoft.com/en-us/azure/architecture/)

### Zajednički resursi
- [AZD Galerija predložaka](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub organizacija](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub repozitorij](https://github.com/Azure/azure-dev)

### Praktična okruženja
- [Azure Besplatni račun](https://azure.microsoft.com/free/)
- [Azure DevOps Besplatni nivo](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Dodatni alati
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Preporuke za raspored učenja

### Puno radno vrijeme (8 tjedana)
- **1.-2. tjedan**: Moduli 1-2 (Početak rada, Konfiguracija)
- **3.-4. tjedan**: Moduli 3-4 (Implementacija, Validacija prije implementacije)
- **5.-6. tjedan**: Moduli 5-6 (Rješavanje problema, Napredne teme)
- **7.-8. tjedan**: Praktični projekti i završna procjena

### Pola radnog vremena (16 tjedana)
- **1.-4. tjedan**: Modul 1 (Početak rada)
- **5.-7. tjedan**: Modul 2 (Konfiguracija i okruženja)
- **8.-10. tjedan**: Modul 3 (Implementacija i provisioniranje)
- **11.-12. tjedan**: Modul 4 (Validacija prije implementacije)
- **13.-14. tjedan**: Modul 5 (Rješavanje problema i otklanjanje grešaka)
- **15.-16. tjedan**: Modul 6 (Napredne teme i procjena)

### Samostalno učenje
- Završite svaki modul vlastitim tempom
- Posvetite dodatno vrijeme izazovnim konceptima
- Ponavljajte vježbe dok ne postignete savladavanje
- Pridružite se zajedničkim raspravama i postavljajte pitanja

## Savjeti za uspjeh

### Učinkovite strategije učenja
1. **Redovito vježbajte**: Često implementirajte aplikacije kako biste izgradili rutinu
2. **Eksperimentirajte bez straha**: Koristite razvojna okruženja za isprobavanje novih konfiguracija
3. **Dokumentirajte svoje učenje**: Vodite bilješke o rješenjima problema na koje naiđete
4. **Pridružite se zajednici**: Sudjelujte u raspravama i doprinosite projektima
5.
3. **Doprinesite otvorenom kodu**: Podijelite svoje predloške i rješenja s zajednicom  
4. **Podučavajte druge**: Objašnjavanje pojmova drugima učvršćuje vaše vlastito razumijevanje  
5. **Budite znatiželjni**: Neprestano istražujte nove Azure usluge i obrasce integracije  

---

**Navigacija**  
- **Prethodna lekcija**: [FAQ](faq.md)  
- **Sljedeća lekcija**: [Changelog](../changelog.md)  

**Praćenje napretka u učenju**: Koristite ovaj vodič za praćenje svog obrazovnog puta i osigurajte sveobuhvatno razumijevanje svih Azure Developer CLI koncepata i praksi.

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane stručnjaka. Ne preuzimamo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije proizašle iz korištenja ovog prijevoda.
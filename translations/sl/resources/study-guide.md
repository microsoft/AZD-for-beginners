<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-10T07:16:16+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "sl"
}
-->
# Vodnik za študij - AZD za začetnike

## Uvod

Ta obsežen študijski vodnik ponuja strukturirane učne cilje, ključne koncepte, praktične vaje in ocenjevalne materiale, ki vam bodo pomagali obvladati Azure Developer CLI (azd). Uporabite ta vodnik za spremljanje napredka in zagotovite, da ste pokrili vse bistvene teme.

## Učni cilji

Z dokončanjem tega študijskega vodnika boste:
- Obvladali vse osnovne in napredne koncepte Azure Developer CLI
- Razvili praktične veščine za uvajanje in upravljanje aplikacij na Azure
- Pridobili samozavest pri odpravljanju težav in optimizaciji uvajanj
- Razumeli prakse za uvajanje v produkcijo ter varnostne vidike

## Rezultati učenja

Po zaključku vseh poglavij tega študijskega vodnika boste sposobni:
- Načrtovati, uvajati in upravljati celotne arhitekture aplikacij z uporabo azd
- Uvesti celovite strategije za spremljanje, varnost in optimizacijo stroškov
- Samostojno odpravljati zapletene težave pri uvajanju
- Ustvariti prilagojene predloge in prispevati k skupnosti azd

## Struktura tečaja

### Modul 1: Začetek (1.–2. teden)

#### Učni cilji
- Razumeti osnove in ključne koncepte Azure Developer CLI
- Uspešno namestiti in konfigurirati azd v vašem razvojnem okolju
- Izvesti prvo uvajanje z uporabo obstoječega predloga
- Krmariti po strukturi projekta azd in razumeti ključne komponente

#### Ključni koncepti za obvladanje
- Predloge, okolja in storitve
- Konfiguracijska struktura azure.yaml
- Osnovni ukazi azd (init, up, down, deploy)
- Načela infrastrukture kot kode
- Avtentikacija in avtorizacija v Azure

#### Praktične vaje

**Vaja 1.1: Namestitev in nastavitev**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Vaja 1.2: Prvo uvajanje**
```bash
# Deploy a simple web application:
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
1. Kateri so trije ključni koncepti arhitekture azd?
2. Kakšen je namen datoteke azure.yaml?
3. Kako okolja pomagajo pri upravljanju različnih ciljev uvajanja?
4. Katere metode avtentikacije lahko uporabite z azd?
5. Kaj se zgodi, ko prvič zaženete `azd up`?

### Modul 2: Konfiguracija in okolja (3. teden)

#### Učni cilji
- Obvladati upravljanje okolij in konfiguracijo
- Razumeti napredne konfiguracije azure.yaml
- Uvesti nastavitve in spremenljivke, specifične za okolje
- Konfigurirati avtentikacijo za različne scenarije

#### Ključni koncepti za obvladanje
- Hierarhija okolij in prednost spremenljivk
- Konfiguracija storitev in parametrov
- Kljuke in dogodki življenjskega cikla
- Metode avtentikacije (uporabnik, storitveni skrbnik, upravljana identiteta)
- Upravljanje konfiguracijskih datotek

#### Praktične vaje

**Vaja 2.1: Nastavitev več okolij**
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Samoocenjevalna vprašanja
1. Kako azd obravnava prednost spremenljivk okolja?
2. Kaj so kljuke za uvajanje in kdaj jih uporabiti?
3. Kako konfigurirate različne SKU-je za različna okolja?
4. Kakšne so varnostne posledice različnih metod avtentikacije?
5. Kako upravljate skrivnosti in občutljive konfiguracijske podatke?

### Modul 3: Uvajanje in priprava infrastrukture (4. teden)

#### Učni cilji
- Obvladati delovne tokove uvajanja in najboljše prakse
- Razumeti infrastrukturo kot kodo z Bicep predlogami
- Uvesti zapletene arhitekture z več storitvami
- Optimizirati zmogljivost in zanesljivost uvajanja

#### Ključni koncepti za obvladanje
- Struktura in moduli Bicep predlog
- Odvisnosti virov in vrstni red
- Strategije uvajanja (blue-green, postopne posodobitve)
- Uvajanja v več regijah
- Migracije podatkov in upravljanje podatkovnih baz

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

**Vaja 3.2: Aplikacija z več storitvami**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Vaja 3.3: Integracija podatkovne baze**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Samoocenjevalna vprašanja
1. Kakšne so prednosti uporabe Bicep predlog v primerjavi z ARM predlogami?
2. Kako obravnavate migracije podatkovnih baz pri uvajanjih z azd?
3. Katere strategije obstajajo za uvajanje brez izpadov?
4. Kako upravljate odvisnosti med storitvami?
5. Kakšne so ključne točke za uvajanja v več regijah?

### Modul 4: Validacija pred uvajanjem (5. teden)

#### Učni cilji
- Uvesti celovite preveritve pred uvajanjem
- Obvladati načrtovanje zmogljivosti in validacijo virov
- Razumeti izbiro SKU-jev in optimizacijo stroškov
- Zgraditi avtomatizirane validacijske procese

#### Ključni koncepti za obvladanje
- Kvote in omejitve virov Azure
- Merila za izbiro SKU-jev in stroškovne posledice
- Avtomatizirani validacijski skripti in orodja
- Metodologije načrtovanja zmogljivosti
- Testiranje zmogljivosti in optimizacija

#### Praktične vaje

**Vaja 4.1: Načrtovanje zmogljivosti**
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Vaja 4.2: Validacija pred uvajanjem**
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Vaja 4.3: Optimizacija SKU-jev**
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Samoocenjevalna vprašanja
1. Katere dejavnike je treba upoštevati pri izbiri SKU-jev?
2. Kako preverite razpoložljivost virov Azure pred uvajanjem?
3. Katere so ključne komponente sistema za preverjanje pred uvajanjem?
4. Kako ocenjujete in nadzorujete stroške uvajanja?
5. Katero spremljanje je bistveno za načrtovanje zmogljivosti?

### Modul 5: Odpravljanje težav in razhroščevanje (6. teden)

#### Učni cilji
- Obvladati sistematične metodologije odpravljanja težav
- Razviti strokovno znanje za razhroščevanje zapletenih težav pri uvajanju
- Uvesti celovito spremljanje in opozarjanje
- Zgraditi postopke za odzivanje na incidente in obnovo

#### Ključni koncepti za obvladanje
- Pogosti vzorci napak pri uvajanju
- Analiza dnevnikov in tehnike korelacije
- Spremljanje zmogljivosti in optimizacija
- Zaznavanje varnostnih incidentov in odzivanje
- Obnova po katastrofi in poslovna kontinuiteta

#### Praktične vaje

**Vaja 5.1: Scenariji odpravljanja težav**
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Vaja 5.2: Implementacija spremljanja**
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Vaja 5.3: Odziv na incidente**
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Samoocenjevalna vprašanja
1. Kakšen je sistematičen pristop k odpravljanju težav pri uvajanjih z azd?
2. Kako korelirate dnevnike med več storitvami in viri?
3. Katere meritve spremljanja so najpomembnejše za zgodnje zaznavanje težav?
4. Kako implementirate učinkovite postopke za obnovo po katastrofi?
5. Katere so ključne komponente načrta za odzivanje na incidente?

### Modul 6: Napredne teme in najboljše prakse (7.–8. teden)

#### Učni cilji
- Uvesti vzorce uvajanja na ravni podjetja
- Obvladati integracijo CI/CD in avtomatizacijo
- Razviti prilagojene predloge in prispevati k skupnosti
- Razumeti napredne varnostne zahteve in zahteve skladnosti

#### Ključni koncepti za obvladanje
- Vzorci integracije CI/CD
- Razvoj in distribucija prilagojenih predlog
- Upravljanje in skladnost na ravni podjetja
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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Vaja 6.3: Implementacija na ravni podjetja**
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Samoocenjevalna vprašanja
1. Kako integrirate azd v obstoječe delovne tokove CI/CD?
2. Katere so ključne točke pri razvoju prilagojenih predlog?
3. Kako implementirate upravljanje in skladnost pri uvajanjih z azd?
4. Katere so najboljše prakse za uvajanja na ravni podjetja?
5. Kako učinkovito prispevate k skupnosti azd?

## Praktični projekti

### Projekt 1: Osebna spletna stran portfelja
**Kompleksnost**: Začetnik  
**Trajanje**: 1–2 tedna

Zgradite in uvedite osebno spletno stran portfelja z uporabo:
- Gostovanja statične spletne strani na Azure Storage
- Konfiguracije prilagojene domene
- Integracije CDN za globalno zmogljivost
- Avtomatiziranega uvajanja

**Rezultati**:
- Delujoča spletna stran, uvedena na Azure
- Prilagojen azd predlog za uvajanje portfelja
- Dokumentacija postopka uvajanja
- Priporočila za analizo stroškov in optimizacijo

### Projekt 2: Aplikacija za upravljanje nalog
**Kompleksnost**: Srednje zahtevno  
**Trajanje**: 2–3 tedne

Ustvarite aplikacijo za upravljanje nalog s polnim skladom z:
- React frontendom, uvedenim na App Service
- Node.js API backendom z avtentikacijo
- PostgreSQL podatkovno bazo z migracijami
- Spremljanjem z Application Insights

**Rezultati**:
- Popolna aplikacija z uporabniško avtentikacijo
- Shema podatkovne baze in skripti za migracijo
- Nadzorne plošče za spremljanje in pravila opozarjanja
- Konfiguracija uvajanja za več okolij

### Projekt 3: Platforma za e-trgovino z mikro storitvami
**Kompleksnost**: Napredno  
**Trajanje**: 4–6 tednov

Načrtujte in implementirajte platformo za e-trgovino z mikro storitvami:
- Več API storitev (katalog, naročila, plačila, uporabniki)
- Integracija sporočilne vrste z Service Bus
- Redis predpomnilnik za optimizacijo zmogljivosti
- Celovito beleženje in spremljanje

**Rezultati**:
- Popolna arhitektura mikro storitev
- Vzorci komunikacije med storitvami
- Testiranje zmogljivosti in optimizacija
- Implementacija varnosti, pripravljena za produkcijo

## Ocenjevanje in certifikacija

### Preverjanje znanja

Zaključite te ocene po vsakem modulu:

**Ocena modula 1**: Osnovni koncepti in namestitev
- Izbirna vprašanja o ključnih konceptih
- Praktične naloge za namestitev in konfiguracijo
- Enostavna vaja za uvajanje

**Ocena modula 2**: Konfiguracija in okolja
- Scenariji upravljanja okolij
- Naloge za odpravljanje težav pri konfiguraciji
- Implementacija varnostne konfiguracije

**Ocena modula 3**: Uvajanje in priprava infrastrukture
- Izzivi pri načrtovanju infrastrukture
- Scenariji uvajanja z več storitvami
- Naloge za optimizacijo zmogljivosti

**Ocena modula 4**: Validacija pred uvajanjem
- Študije primerov načrtovanja zmogljivosti
- Scenariji optimizacije stroškov
- Implementacija validacijskih procesov

**Ocena modula 5**: Odpravljanje težav in razhroščevanje
- Naloge za diagnozo težav
- Naloge za implementacijo spremljanja
- Simulacije odzivanja na incidente

**Ocena modula 6**: Napredne teme
- Načrtovanje CI/CD procesov
- Razvoj prilagojenih predlog
- Scenariji arhitekture na ravni podjetja

### Končni projekt

Načrtujte in implementirajte celovito rešitev, ki prikazuje obvladanje vseh konceptov:

**Zahteve**:
- Arhitektura aplikacije z več nivoji
- Več okolij za uvajanje
- Celovito spremljanje in opozarjanje
- Implementacija varnosti in skladnosti
- Optimizacija stroškov in zmogljivosti
- Popolna dokumentacija in priročniki

**Merila za ocenjevanje**:
- Kakovost tehnične implementacije
- Celovitost dokumentacije
- Upoštevanje varnosti in najboljših praks
- Optimizacija zmogljivosti in stroškov
- Učinkovitost pri odpravljanju težav in spremljanju

## Viri za študij in reference

### Uradna dokumentacija
- [Azure Developer CLI Dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Arhitekturni center](https://learn.microsoft.com/en-us/azure/architecture/)

### Viri skupnosti
- [Galerija predlog AZD](https://azure.github.io/awesome-azd/)
- [GitHub organizacija Azure-Samples](https://github.com/Azure-Samples)
- [GitHub repozitorij Azure Developer CLI](https://github.com/Azure/azure-dev)

### Praktična okolja
- [Brezplačni račun Azure](https://azure.microsoft.com/free/)
- [Brezplačna stopnja Azure DevOps](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Dodatna orodja
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Razširitveni paket Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Priporočila za urnik študija

### Študij s polnim delovnim časom (8 tednov)
- **1.–2. teden**: Modula 1–2 (Začetek, Konfiguracija)
- **3.–4. teden**: Modula 3–4 (Uvajanje, Validacija pred uvajanjem)
- **5.–6. teden**: Modula 5–6 (Odpravljanje težav, Napredne teme)
- **7.–8. teden**: Praktični projekti in končna ocena

### Študij s krajšim delovnim časom (16 tednov)
- **1.–4. teden**: Modul 1 (Začetek)
- **5.–7. teden**: Modul 2 (Konfiguracija in okolja)
- **8.–10. teden**: Modul 3 (Uvajanje in priprava infrastrukture)
- **11.–12. teden**: Modul 4 (Validacija pred uvajanjem)
- **13.–14. teden**: Modul 5 (Odpravljanje težav in razhroščevanje)
- **15.–16. teden**: Modul 6 (Napredne teme in ocena)

### Študij v lastnem tempu
- Zaključite vsak modul v svojem tempu
- Posvetite dodatni čas zahtevnim konceptom
- Ponavljajte vaje, dokler ne dosežete obvladanja
- Pridružite se razpravam v skupnosti in postavljajte vprašanja

## Nasveti za uspeh

### Učinkovite strategije učenja
1. **Redno vadite**: Pogosto uvajajte aplikacije, da pridobite praktične izkušnje
2. **Eksperimentirajte brez str
3. **Prispevajte k odprti kodi**: Delite svoje predloge in rešitve s skupnostjo  
4. **Poučujte druge**: Razlaganje konceptov drugim krepi vaše lastno razumevanje  
5. **Bodite radovedni**: Nenehno raziskujte nove storitve Azure in vzorce integracije  

---

**Navigacija**  
- **Prejšnja lekcija**: [FAQ](faq.md)  
- **Naslednja lekcija**: [Changelog](../changelog.md)  

**Sledenje napredku pri učenju**: Uporabite ta vodič za spremljanje svoje učne poti in zagotovite celovito pokritje vseh konceptov in praks Azure Developer CLI.  

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za strojno prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo strokovno človeško prevajanje. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
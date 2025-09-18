<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T13:09:12+00:00",
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
- Razvili praktične veščine za uvajanje in upravljanje aplikacij v Azure
- Pridobili samozavest pri odpravljanju težav in optimizaciji uvajanj
- Razumeli prakse za uvajanje v produkcijo in varnostne vidike

## Rezultati učenja

Po zaključku vseh poglavij tega vodnika boste sposobni:
- Načrtovati, uvajati in upravljati celotne arhitekture aplikacij z uporabo azd
- Uvesti celovite strategije za spremljanje, varnost in optimizacijo stroškov
- Samostojno odpravljati kompleksne težave pri uvajanju
- Ustvariti prilagojene predloge in prispevati k skupnosti azd

## Struktura učenja v 8 poglavjih

### Poglavje 1: Osnove in hitri začetek (1. teden)
**Trajanje**: 30-45 minut | **Kompleksnost**: ⭐

#### Učni cilji
- Razumeti osnovne koncepte in terminologijo Azure Developer CLI
- Uspešno namestiti in konfigurirati AZD na svoji razvojni platformi
- Uvesti svojo prvo aplikacijo z uporabo obstoječega predloga
- Učinkovito navigirati po ukazni vrstici AZD

#### Ključni koncepti za obvladanje
- Struktura projekta AZD in njegove komponente (azure.yaml, infra/, src/)
- Delovni tokovi uvajanja na podlagi predlog
- Osnove konfiguracije okolja
- Upravljanje skupin virov in naročnin

#### Praktične vaje
1. **Preverjanje namestitve**: Namestite AZD in preverite z `azd version`
2. **Prvo uvajanje**: Uspešno uvedite predlogo todo-nodejs-mongo
3. **Nastavitev okolja**: Konfigurirajte svoje prve okoljske spremenljivke
4. **Raziskovanje virov**: Preglejte uvedene vire v Azure Portalu

#### Ocenjevalna vprašanja
- Katere so osnovne komponente projekta AZD?
- Kako inicializirate nov projekt iz predloge?
- Kakšna je razlika med `azd up` in `azd deploy`?
- Kako upravljate več okolij z AZD?

---

### Poglavje 2: Razvoj, usmerjen na AI (2. teden)
**Trajanje**: 1-2 uri | **Kompleksnost**: ⭐⭐

#### Učni cilji
- Integrirati storitve Azure AI Foundry z delovnimi tokovi AZD
- Uvesti in konfigurirati aplikacije, ki temeljijo na AI
- Razumeti vzorce implementacije RAG (Retrieval-Augmented Generation)
- Upravljati uvajanje in skaliranje AI modelov

#### Ključni koncepti za obvladanje
- Integracija storitve Azure OpenAI in upravljanje API-jev
- Konfiguracija AI iskanja in indeksiranje vektorjev
- Strategije uvajanja modelov in načrtovanje zmogljivosti
- Spremljanje aplikacij AI in optimizacija zmogljivosti

#### Praktične vaje
1. **Uvajanje AI klepeta**: Uvedite predlogo azure-search-openai-demo
2. **Implementacija RAG**: Konfigurirajte indeksiranje in iskanje dokumentov
3. **Konfiguracija modelov**: Nastavite več AI modelov za različne namene
4. **Spremljanje AI**: Implementirajte Application Insights za delovne obremenitve AI

#### Ocenjevalna vprašanja
- Kako konfigurirate storitve Azure OpenAI v predlogi AZD?
- Katere so ključne komponente arhitekture RAG?
- Kako upravljate zmogljivost in skaliranje AI modelov?
- Katere metrike spremljanja so pomembne za aplikacije AI?

---

### Poglavje 3: Konfiguracija in avtentikacija (3. teden)
**Trajanje**: 45-60 minut | **Kompleksnost**: ⭐⭐

#### Učni cilji
- Obvladati strategije konfiguracije in upravljanja okolij
- Implementirati varne vzorce avtentikacije in upravljane identitete
- Organizirati vire z ustreznimi poimenovalnimi konvencijami
- Konfigurirati uvajanja v več okoljih (razvoj, testiranje, produkcija)

#### Ključni koncepti za obvladanje
- Hierarhija okolij in prednost konfiguracije
- Upravljana identiteta in avtentikacija s storitvenimi glavnimi identitetami
- Integracija Key Vault za upravljanje skrivnosti
- Upravljanje parametrov, specifičnih za okolje

#### Praktične vaje
1. **Nastavitev več okolij**: Konfigurirajte razvojna, testna in produkcijska okolja
2. **Konfiguracija varnosti**: Implementirajte avtentikacijo z upravljano identiteto
3. **Upravljanje skrivnosti**: Integrirajte Azure Key Vault za občutljive podatke
4. **Upravljanje parametrov**: Ustvarite konfiguracije, specifične za okolje

#### Ocenjevalna vprašanja
- Kako konfigurirate različna okolja z AZD?
- Kakšne so prednosti uporabe upravljane identitete v primerjavi s storitvenimi glavnimi identitetami?
- Kako varno upravljate skrivnosti aplikacij?
- Kakšna je hierarhija konfiguracije v AZD?

---

### Poglavje 4: Infrastruktura kot koda in uvajanje (4.-5. teden)
**Trajanje**: 1-1,5 ure | **Kompleksnost**: ⭐⭐⭐

#### Učni cilji
- Ustvariti in prilagoditi predloge infrastrukture Bicep
- Implementirati napredne vzorce uvajanja in delovne tokove
- Razumeti strategije zagotavljanja virov
- Načrtovati skalabilne arhitekture več storitev

#### Ključni koncepti za obvladanje
- Struktura predlog Bicep in najboljše prakse
- Odvisnosti virov in vrstni red uvajanja
- Datoteke parametrov in modularnost predlog
- Prilagojeni kljuki in avtomatizacija uvajanja

#### Praktične vaje
1. **Ustvarjanje prilagojenih predlog**: Zgradite predlogo aplikacije z več storitvami
2. **Obvladovanje Bicep**: Ustvarite modularne, ponovno uporabne komponente infrastrukture
3. **Avtomatizacija uvajanja**: Implementirajte kljuke pred/po uvajanju
4. **Načrtovanje arhitekture**: Uvedite kompleksno arhitekturo mikrostoritev

#### Ocenjevalna vprašanja
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
- Uvesti produkcijsko pripravljene AI rešitve s spremljanjem
- Razumeti specializacijo agentov in vzorce delovnih tokov

#### Ključni koncepti za obvladanje
- Vzorci arhitekture z več agenti in načela oblikovanja
- Protokoli komunikacije med agenti in tok podatkov
- Strategije uravnoteženja obremenitve in skaliranja za AI agente
- Spremljanje produkcije za sisteme z več agenti

#### Praktične vaje
1. **Uvajanje maloprodajne rešitve**: Uvedite celoten scenarij maloprodaje z več agenti
2. **Prilagoditev agentov**: Spremenite vedenje agentov za stranke in zaloge
3. **Skaliranje arhitekture**: Implementirajte uravnoteženje obremenitve in samodejno skaliranje
4. **Spremljanje produkcije**: Nastavite celovito spremljanje in opozarjanje

#### Ocenjevalna vprašanja
- Kako načrtujete učinkovite vzorce komunikacije med agenti?
- Katere so ključne zahteve za skaliranje delovnih obremenitev AI agentov?
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
- Avtomatizirani skripti za validacijo in testiranje
- Metodologije načrtovanja zmogljivosti
- Testiranje zmogljivosti in optimizacija

#### Praktične vaje
1. **Analiza zmogljivosti**: Analizirajte zahteve virov za svoje aplikacije
2. **Optimizacija SKU-jev**: Primerjajte in izberite stroškovno učinkovite storitvene nivoje
3. **Avtomatizacija validacije**: Implementirajte skripte za preverjanje pred uvajanjem
4. **Načrtovanje stroškov**: Ustvarite ocene stroškov uvajanja in proračune

#### Ocenjevalna vprašanja
- Kako validirate zmogljivosti Azure pred uvajanjem?
- Katere dejavnike upoštevate pri izbiri SKU-jev?
- Kako avtomatizirate validacijo pred uvajanjem?
- Katere strategije pomagajo optimizirati stroške uvajanja?
2. Kako preverite razpoložljivost Azure virov pred uvedbo?
3. Katere so ključne komponente sistema za preverjanje pred uvedbo?
4. Kako ocenite in nadzorujete stroške uvedbe?
5. Katero spremljanje je bistveno za načrtovanje kapacitet?

### Modul 5: Odpravljanje težav in razhroščevanje (6. teden)

#### Cilji učenja
- Obvladati sistematične metodologije odpravljanja težav
- Razviti strokovno znanje pri razhroščevanju kompleksnih težav pri uvedbi
- Uvesti celovito spremljanje in opozarjanje
- Zgraditi postopke odziva na incidente in okrevanja

#### Ključni koncepti za obvladovanje
- Pogosti vzorci neuspešnih uvedb
- Analiza dnevnikov in tehnike korelacije
- Spremljanje zmogljivosti in optimizacija
- Zaznavanje varnostnih incidentov in odziv nanje
- Obnovitev po katastrofi in poslovna kontinuiteta

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

**Vaja 5.2: Uvedba spremljanja**  
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

#### Vprašanja za samoocenjevanje
1. Kakšen je sistematičen pristop k odpravljanju težav pri azd uvedbah?
2. Kako korelirate dnevnike med več storitvami in viri?
3. Katere meritve spremljanja so najpomembnejše za zgodnje zaznavanje težav?
4. Kako uvedete učinkovite postopke za obnovitev po katastrofi?
5. Katere so ključne komponente načrta odziva na incidente?

### Modul 6: Napredne teme in najboljše prakse (7.–8. teden)

#### Cilji učenja
- Uvesti vzorce uvedb na ravni podjetja
- Obvladati integracijo in avtomatizacijo CI/CD
- Razviti prilagojene predloge in prispevati skupnosti
- Razumeti napredne zahteve glede varnosti in skladnosti

#### Ključni koncepti za obvladovanje
- Vzorci integracije CI/CD pipeline
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

**Vaja 6.3: Uvedba na ravni podjetja**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Vprašanja za samoocenjevanje
1. Kako integrirate azd v obstoječe CI/CD delovne tokove?
2. Katere so ključne točke pri razvoju prilagojenih predlog?
3. Kako uvedete upravljanje in skladnost pri azd uvedbah?
4. Katere so najboljše prakse za uvedbe na ravni podjetja?
5. Kako učinkovito prispevate skupnosti azd?

## Praktični projekti

### Projekt 1: Osebna spletna stran portfelja  
**Kompleksnost**: Začetnik  
**Trajanje**: 1–2 tedna  

Zgradite in uvedite osebno spletno stran portfelja z uporabo:
- Gostovanje statične spletne strani na Azure Storage
- Konfiguracija prilagojene domene
- Integracija CDN za globalno zmogljivost
- Avtomatiziran pipeline za uvedbo

**Rezultati**:
- Delujoča spletna stran, uvedena na Azure
- Prilagojen azd predlog za uvedbo portfelja
- Dokumentacija postopka uvedbe
- Priporočila za analizo stroškov in optimizacijo

### Projekt 2: Aplikacija za upravljanje nalog  
**Kompleksnost**: Srednje zahtevno  
**Trajanje**: 2–3 tedne  

Ustvarite aplikacijo za upravljanje nalog s polnim skladom:
- React frontend, uveden na App Service
- Node.js API backend z avtentikacijo
- PostgreSQL baza podatkov z migracijami
- Spremljanje z Application Insights

**Rezultati**:
- Popolna aplikacija z avtentikacijo uporabnikov
- Shema baze podatkov in skripte za migracijo
- Nadzorne plošče za spremljanje in pravila opozarjanja
- Konfiguracija uvedbe za več okolij

### Projekt 3: Platforma za e-trgovino z mikroservisi  
**Kompleksnost**: Napredno  
**Trajanje**: 4–6 tednov  

Oblikujte in izvedite platformo za e-trgovino, ki temelji na mikroservisih:
- Več API storitev (katalog, naročila, plačila, uporabniki)
- Integracija sporočilne vrste s Service Bus
- Redis predpomnilnik za optimizacijo zmogljivosti
- Celovito beleženje in spremljanje

**Rezultati**:
- Popolna arhitektura mikroservisov
- Vzorci komunikacije med storitvami
- Testiranje zmogljivosti in optimizacija
- Varnostna implementacija, pripravljena za produkcijo

## Ocena in certifikacija

### Preverjanje znanja

Opravite te ocene po vsakem modulu:

**Ocena modula 1**: Osnovni koncepti in namestitev  
- Izbirna vprašanja o osnovnih konceptih  
- Praktične naloge za namestitev in konfiguracijo  
- Enostavna vaja za uvedbo  

**Ocena modula 2**: Konfiguracija in okolja  
- Scenariji upravljanja okolij  
- Vaje za odpravljanje težav pri konfiguraciji  
- Implementacija varnostne konfiguracije  

**Ocena modula 3**: Uvedba in zagotavljanje virov  
- Izzivi pri oblikovanju infrastrukture  
- Scenariji uvedbe več storitev  
- Vaje za optimizacijo zmogljivosti  

**Ocena modula 4**: Preverjanje pred uvedbo  
- Študije primerov načrtovanja kapacitet  
- Scenariji optimizacije stroškov  
- Implementacija pipeline za preverjanje  

**Ocena modula 5**: Odpravljanje težav in razhroščevanje  
- Naloge za diagnozo težav  
- Naloge za uvedbo spremljanja  
- Simulacije odziva na incidente  

**Ocena modula 6**: Napredne teme  
- Oblikovanje CI/CD pipeline  
- Razvoj prilagojenih predlog  
- Scenariji arhitekture na ravni podjetja  

### Končni projekt

Oblikujte in izvedite celovito rešitev, ki prikazuje obvladovanje vseh konceptov:

**Zahteve**:
- Arhitektura aplikacije z več nivoji  
- Več okolij za uvedbo  
- Celovito spremljanje in opozarjanje  
- Implementacija varnosti in skladnosti  
- Optimizacija stroškov in zmogljivosti  
- Popolna dokumentacija in priročniki  

**Merila za ocenjevanje**:
- Kakovost tehnične izvedbe  
- Popolnost dokumentacije  
- Upoštevanje varnosti in najboljših praks  
- Optimizacija zmogljivosti in stroškov  
- Učinkovitost pri odpravljanju težav in spremljanju  

## Viri za učenje in reference

### Uradna dokumentacija
- [Azure Developer CLI Dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Skupnostni viri
- [Galerija predlog AZD](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organizacija](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repozitorij](https://github.com/Azure/azure-dev)  

### Praktična okolja
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Dodatna orodja
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Priporočila za urnik učenja

### Polni čas (8 tednov)
- **1.–2. teden**: Modula 1–2 (Začetek, Konfiguracija)  
- **3.–4. teden**: Modula 3–4 (Uvedba, Preverjanje pred uvedbo)  
- **5.–6. teden**: Modula 5–6 (Odpravljanje težav, Napredne teme)  
- **7.–8. teden**: Praktični projekti in končna ocena  

### Polovični čas (16 tednov)
- **1.–4. teden**: Modul 1 (Začetek)  
- **5.–7. teden**: Modul 2 (Konfiguracija in okolja)  
- **8.–10. teden**: Modul 3 (Uvedba in zagotavljanje virov)  
- **11.–12. teden**: Modul 4 (Preverjanje pred uvedbo)  
- **13.–14. teden**: Modul 5 (Odpravljanje težav in razhroščevanje)  
- **15.–16. teden**: Modul 6 (Napredne teme in ocena)  

---

## Sledenje napredku in okvir za ocenjevanje

### Seznam za dokončanje poglavij

Sledite svojemu napredku skozi vsako poglavje z merljivimi rezultati:

#### 📚 Poglavje 1: Osnove in hitri začetek  
- [ ] **Namestitev dokončana**: AZD nameščen in preverjen na vaši platformi  
- [ ] **Prva uvedba**: Uspešno uveden todo-nodejs-mongo predlog  
- [ ] **Nastavitev okolja**: Konfigurirane prve spremenljivke okolja  
- [ ] **Navigacija virov**: Raziskani uvedeni viri v Azure Portal  
- [ ] **Obvladovanje ukazov**: Obvladovanje osnovnih ukazov AZD  

#### 🤖 Poglavje 2: Razvoj, usmerjen v AI  
- [ ] **Uvedba AI predloga**: Uspešno uveden azure-search-openai-demo  
- [ ] **Implementacija RAG**: Konfigurirano indeksiranje in pridobivanje dokumentov  
- [ ] **Konfiguracija modela**: Nastavljeni več AI modeli z različnimi nameni  
- [ ] **Spremljanje AI**: Uveden Application Insights za AI delovne obremenitve  
- [ ] **Optimizacija zmogljivosti**: Izboljšana zmogljivost AI aplikacije  

#### ⚙️ Poglavje 3: Konfiguracija in avtentikacija  
- [ ] **Nastavitev več okolij**: Konfigurirana razvojna, testna in produkcijska okolja  
- [ ] **Implementacija varnosti**: Nastavljena avtentikacija z upravljano identiteto  
- [ ] **Upravljanje skrivnosti**: Integriran Azure Key Vault za občutljive podatke  
- [ ] **Upravljanje parametrov**: Ustvarjene konfiguracije, specifične za okolje  
- [ ] **Obvladovanje avtentikacije**: Uvedeni varni vzorci dostopa  

#### 🏗️ Poglavje 4: Infrastruktura kot koda in uvedba  
- [ ] **Ustvarjanje prilagojenih predlog**: Zgrajen predlog za aplikacijo z več storitvami  
- [ ] **Obvladovanje Bicep**: Ustvarjene modularne, ponovno uporabne komponente infrastrukture  
- [ ] **Avtomatizacija uvedbe**: Uvedeni predhodni/naknadni postopki uvedbe  
- [ ] **Oblikovanje arhitekture**: Uvedena kompleksna arhitektura mikroservisov  
- [ ] **Optimizacija predlog**: Optimizirani predlogi za zmogljivost in stroške  

#### 🎯 Poglavje 5: Rešitve AI z več agenti  
- [ ] **Uvedba maloprodajne rešitve**: Uveden popoln scenarij maloprodaje z več agenti  
- [ ] **Prilagoditev agentov**: Spremenjeno vedenje agentov za stranke in zaloge  
- [ ] **Skaliranje arhitekture**: Uvedeno uravnavanje obremenitve in samodejno skaliranje  
- [ ] **Spremljanje produkcije**: Nastavljeno celovito spremljanje in opozarjanje  
- [ ] **Izboljšanje zmogljivosti**: Optimizirana zmogljivost sistema z več agenti  

#### 🔍 Poglavje 6: Preverjanje pred uvedbo in načrtovanje  
- [ ] **Analiza kapacitet**: Analizirane zahteve po virih za aplikacije  
- [ ] **Optimizacija SKU**: Izbrane stroškovno učinkovite storitve  
- [ ] **Avtomatizacija preverjanja**: Uvedeni skripti za preverjanje pred uvedbo  
- [ ] **Načrtovanje stroškov**: Ustvarjene ocene stroškov uvedbe in proračuni  
- [ ] **Ocena tveganja**: Identificirana in zmanjšana tveganja uvedbe  

#### 🚨 Poglavje 7: Odpravljanje težav in razhroščevanje  
- [ ] **Diagnostične veščine**: Uspešno razhroščene namerno pokvarjene uvedbe  
- [ ] **Analiza dnevnikov**: Učinkovita uporaba Azure Monitor in Application Insights  
- [ ] **Optimizacija zmogljivosti**: Izboljšane počasne aplikacije  
- [ ] **Postopki okrevanja**: Uvedeni postopki za varnostno kopiranje in obnovitev  
- [ ] **Nastavitev spremljanja**: Ustvarjeno proaktivno spremljanje in opozarjanje  

#### 🏢 Poglavje 8: Produkcija in vzorci na ravni podjetja  
- [ ] **Varnost na ravni podjetja**: Uvedeni celoviti varnostni vzorci  
- [ ] **Okvir upravljanja**: Nastavljena Azure Policy in upravljanje virov  
- [ ] **Napredno spremljanje**: Ustvarjene nadzorne plošče in avtomatizirano opozarjanje  
- [ ] **Integracija CI/CD**: Zgrajeni avtomatizirani pipeline za uvedbo  
- [ ] **Implementacija skladnosti**: Izpolnjene zahteve skladnosti na ravni podjetja  

### Časovnica učenja in mejniki

#### 1.–2. teden: Gradnja temeljev  
- **Mejnik**: Uvedba prve AI aplikacije z uporabo AZD  
- **Preverjanje**: Delujoča aplikacija, dostopna prek javnega URL-ja  
- **Veščine**: Osnovni delovni tokovi AZD in integracija AI storitev  

#### 3.–4. teden: Obvladovanje konfiguracije  
- **Mejnik**: Uvedba v več okoljih z varno avtentikacijo  
- **Preverjanje**: Ista aplikacija, uvedena v razvojno/testno/produkcijsko okolje  
- **Veščine**: Upravljanje okolij in implementacija varnosti  

#### 5.–6. teden: Strokovno znanje o infrastrukturi  
- **Mejnik**: Prilagojen predlog za kompleksno aplikacijo z več storitvami  
- **Preverjanje**: Ponovno uporaben predlog, uveden s strani drugega člana ekipe  
- **Veščine**: Obvladovanje Bicep in avtomatizacija infrastrukture  

#### 7.–8. teden: Napredna implementacija AI  
- **Mejnik**: Produkcijsko pripravljena rešitev AI z več agenti  
- **Preverjanje**: Sistem, ki obvladuje obremenitev iz resničnega sveta s spremljanjem  
- **Veščine**: Orkestracija več agentov in optimizacija zmogljivosti  

#### 9.–10. teden: Pripravljenost za produkcijo  
- **Mejnik**: Uvedba na ravni podjetja z popolno skladnostjo  
- **Preverjanje**: Uvedba, ki prestane varnostni pregled in revizijo optimizacije stroškov  
- **Veščine**: Upravljanje, spremljanje in integracija CI/CD  

### Ocena in certifikacija

#### Metode preverjanja znanja  
1. **Praktične uvedbe**: Delujoče aplikacije za vsako poglavje  
2. **Pregledi kode**: Ocena kakovosti predlog in konfiguracij  
3. **Reševanje težav**: Scenariji odpravljanja težav in rešitve  
4. **Poučevanje vrstnikov**: Razlaga konceptov drugim učencem  
5. **Prispevek skupnosti**: Deljenje predlog ali izboljšav  

#### Rezultati
- **Dokumentacija**: Prispevajte k skupnostni dokumentaciji in primerom
- **Povratne informacije**: Podajte povratne informacije o vsebini tečaja in storitvah Azure

#### Razvoj kariere
- **Strokovna mreža**: Povežite se s strokovnjaki za Azure in umetno inteligenco
- **Priložnosti za govorjenje**: Predstavite svoje ugotovitve na konferencah ali srečanjih
- **Prispevek k odprti kodi**: Prispevajte k predlogam in orodjem AZD
- **Mentorstvo**: Vodite druge razvijalce na njihovi poti učenja AZD

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Začnite z učenjem**: [Poglavje 1: Osnove in hitri začetek](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Sledenje napredku**: Spremljajte svoj napredek skozi celovit 8-poglavni učni sistem
- **🤝 Skupnost**: [Azure Discord](https://discord.gg/microsoft-azure) za podporo in razpravo

**Sledenje napredku pri učenju**: Uporabite ta strukturiran vodnik za obvladovanje Azure Developer CLI z naprednim, praktičnim učenjem, merljivimi rezultati in koristmi za profesionalni razvoj.

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
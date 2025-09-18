<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T12:08:34+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "hr"
}
-->
# Vodič za učenje - Sveobuhvatni ciljevi učenja

**Navigacija kroz put učenja**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Započni učenje**: [Poglavlje 1: Osnove i brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Praćenje napretka**: [Završetak tečaja](../README.md#-course-completion--certification)

## Uvod

Ovaj sveobuhvatni vodič za učenje pruža strukturirane ciljeve učenja, ključne koncepte, praktične vježbe i materijale za procjenu kako biste savladali Azure Developer CLI (azd). Koristite ovaj vodič za praćenje napretka i osigurajte da ste obradili sve bitne teme.

## Ciljevi učenja

Završetkom ovog vodiča za učenje, moći ćete:
- Savladati sve osnovne i napredne koncepte Azure Developer CLI
- Razviti praktične vještine u implementaciji i upravljanju Azure aplikacijama
- Steći samopouzdanje u rješavanju problema i optimizaciji implementacija
- Razumjeti prakse implementacije spremne za produkciju i sigurnosne aspekte

## Ishodi učenja

Nakon završetka svih dijelova ovog vodiča, moći ćete:
- Dizajnirati, implementirati i upravljati kompletnim arhitekturama aplikacija koristeći azd
- Provoditi sveobuhvatne strategije za praćenje, sigurnost i optimizaciju troškova
- Samostalno rješavati složene probleme implementacije
- Kreirati prilagođene predloške i doprinositi azd zajednici

## Struktura učenja u 8 poglavlja

### Poglavlje 1: Osnove i brzi početak (1. tjedan)
**Trajanje**: 30-45 minuta | **Složenost**: ⭐

#### Ciljevi učenja
- Razumjeti osnovne koncepte i terminologiju Azure Developer CLI
- Uspješno instalirati i konfigurirati AZD na vašoj razvojnoj platformi
- Implementirati svoju prvu aplikaciju koristeći postojeći predložak
- Učinkovito se kretati kroz AZD sučelje naredbenog retka

#### Ključni koncepti za savladavanje
- Struktura projekta AZD i komponente (azure.yaml, infra/, src/)
- Radni tijekovi temeljeni na predlošcima
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
- Kako upravljate višestrukim okruženjima s AZD?

---

### Poglavlje 2: Razvoj temeljen na AI (2. tjedan)
**Trajanje**: 1-2 sata | **Složenost**: ⭐⭐

#### Ciljevi učenja
- Integrirati Azure AI Foundry usluge s AZD radnim tijekovima
- Implementirati i konfigurirati aplikacije temeljene na AI
- Razumjeti obrasce implementacije RAG (Retrieval-Augmented Generation)
- Upravljati implementacijama AI modela i skaliranjem

#### Ključni koncepti za savladavanje
- Integracija Azure OpenAI usluge i upravljanje API-jem
- Konfiguracija AI pretraživanja i indeksiranje vektora
- Strategije implementacije modela i planiranje kapaciteta
- Praćenje aplikacija temeljenih na AI i optimizacija performansi

#### Praktične vježbe
1. **Implementacija AI chata**: Implementirajte predložak azure-search-openai-demo
2. **RAG implementacija**: Konfigurirajte indeksiranje i dohvaćanje dokumenata
3. **Konfiguracija modela**: Postavite više AI modela s različitim namjenama
4. **Praćenje AI**: Implementirajte Application Insights za AI radna opterećenja

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
- Kako konfigurirati različita okruženja s AZD?
- Koje su prednosti korištenja upravljanog identiteta u odnosu na servisne principe?
- Kako sigurno upravljati tajnama aplikacije?
- Koja je hijerarhija konfiguracije u AZD?

---

### Poglavlje 4: Infrastruktura kao kod i implementacija (4.-5. tjedan)
**Trajanje**: 1-1.5 sati | **Složenost**: ⭐⭐⭐

#### Ciljevi učenja
- Kreirati i prilagoditi Bicep predloške infrastrukture
- Implementirati napredne obrasce i radne tijekove implementacije
- Razumjeti strategije za dodjelu resursa
- Dizajnirati skalabilne arhitekture s više usluga

#### Ključni koncepti za savladavanje
- Struktura Bicep predloška i najbolje prakse
- Ovisnosti resursa i redoslijed implementacije
- Datoteke parametara i modularnost predloška
- Prilagođeni hooks i automatizacija implementacije

#### Praktične vježbe
1. **Kreiranje prilagođenog predloška**: Izradite predložak aplikacije s više usluga
2. **Savladavanje Bicep-a**: Kreirajte modularne, višekratne komponente infrastrukture
3. **Automatizacija implementacije**: Implementirajte pre/post hooks za implementaciju
4. **Dizajn arhitekture**: Implementirajte složenu arhitekturu mikroservisa

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

#### Ključni koncepti za savladavanje
- Obrasci arhitekture s više agenata i principi dizajna
- Protokoli komunikacije agenata i tok podataka
- Strategije balansiranja opterećenja i skaliranja za AI agente
- Praćenje produkcije za sustave s više agenata

#### Praktične vježbe
1. **Implementacija rješenja za maloprodaju**: Implementirajte kompletan scenarij maloprodaje s više agenata
2. **Prilagodba agenata**: Modificirajte ponašanje agenata za kupce i inventar
3. **Skaliranje arhitekture**: Implementirajte balansiranje opterećenja i automatsko skaliranje
4. **Praćenje produkcije**: Postavite sveobuhvatno praćenje i upozorenja

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
- Kvote resursa Azure i ograničenja kapaciteta
- Kriteriji za odabir SKU-ova i optimizacija troškova
- Automatizirani skripti za validaciju i testiranje
- Metodologije planiranja kapaciteta
- Testiranje performansi i optimizacija

#### Praktične vježbe
1. **Analiza kapaciteta**: Analizirajte zahtjeve resursa za vaše aplikacije
2. **Optimizacija SKU-a**: Usporedite i odaberite isplative razine usluga
3. **Automatizacija validacije**: Implementirajte skripte za provjeru prije implementacije
4. **Planiranje troškova**: Kreirajte procjene troškova implementacije i proračune

#### Pitanja za procjenu
- Kako validirati kapacitet Azure prije implementacije?
- Koji faktori utječu na odluke o odabiru SKU-ova?
- Kako automatizirati validaciju prije implementacije?
- Koje strategije pomažu u optimizaciji troškova implementacije?
2. Kako provjeriti dostupnost Azure resursa prije implementacije?  
3. Koji su ključni elementi sustava za provjeru prije implementacije?  
4. Kako procijeniti i kontrolirati troškove implementacije?  
5. Koje su ključne aktivnosti praćenja za planiranje kapaciteta?

### Modul 5: Rješavanje problema i ispravljanje pogrešaka (Tjedan 6)

#### Ciljevi učenja  
- Usvojiti sustavne metodologije za rješavanje problema  
- Razviti stručnost u ispravljanju složenih problema implementacije  
- Implementirati sveobuhvatno praćenje i sustave upozorenja  
- Izgraditi procedure za odgovore na incidente i oporavak  

#### Ključni koncepti za usvajanje  
- Uobičajeni obrasci neuspjeha implementacije  
- Analiza i korelacija logova  
- Praćenje performansi i optimizacija  
- Otkrivanje sigurnosnih incidenata i odgovori  
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
2. Kako korelirati logove između više servisa i resursa?  
3. Koje su metrike praćenja najvažnije za rano otkrivanje problema?  
4. Kako implementirati učinkovite procedure za oporavak od katastrofe?  
5. Koji su ključni elementi plana odgovora na incidente?  

### Modul 6: Napredne teme i najbolje prakse (Tjedan 7-8)

#### Ciljevi učenja  
- Implementirati obrasce implementacije na razini poduzeća  
- Usvojiti integraciju i automatizaciju CI/CD sustava  
- Razviti prilagođene predloške i doprinijeti zajednici  
- Razumjeti napredne sigurnosne zahtjeve i zahtjeve usklađenosti  

#### Ključni koncepti za usvajanje  
- Obrasci integracije CI/CD sustava  
- Razvoj i distribucija prilagođenih predložaka  
- Upravljanje i usklađenost na razini poduzeća  
- Napredne konfiguracije mreže i sigurnosti  
- Optimizacija performansi i upravljanje troškovima  

#### Vježbe

**Vježba 6.1: Integracija CI/CD sustava**  
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
1. Kako integrirati azd u postojeće CI/CD radne tokove?  
2. Koji su ključni aspekti razvoja prilagođenih predložaka?  
3. Kako implementirati upravljanje i usklađenost u azd implementacijama?  
4. Koje su najbolje prakse za implementacije na razini poduzeća?  
5. Kako učinkovito doprinijeti azd zajednici?  

## Praktični projekti

### Projekt 1: Osobna web stranica portfelja  
**Složenost**: Početnik  
**Trajanje**: 1-2 tjedna  

Izradite i implementirajte osobnu web stranicu portfelja koristeći:  
- Hosting statičke web stranice na Azure Storage  
- Konfiguraciju prilagođene domene  
- Integraciju CDN-a za globalne performanse  
- Automatizirani sustav implementacije  

**Rezultati**:  
- Funkcionalna web stranica implementirana na Azure  
- Prilagođeni azd predložak za implementaciju portfelja  
- Dokumentacija procesa implementacije  
- Preporuke za analizu i optimizaciju troškova  

### Projekt 2: Aplikacija za upravljanje zadacima  
**Složenost**: Srednje  
**Trajanje**: 2-3 tjedna  

Izradite aplikaciju za upravljanje zadacima s punim sustavom:  
- React frontend implementiran na App Service  
- Node.js API backend s autentifikacijom  
- PostgreSQL baza podataka s migracijama  
- Praćenje putem Application Insights  

**Rezultati**:  
- Kompletna aplikacija s korisničkom autentifikacijom  
- Skripte za shemu baze podataka i migracije  
- Nadzorne ploče za praćenje i pravila upozorenja  
- Konfiguracija implementacije za više okruženja  

### Projekt 3: Mikroservisna platforma za e-trgovinu  
**Složenost**: Napredno  
**Trajanje**: 4-6 tjedana  

Dizajnirajte i implementirajte platformu za e-trgovinu temeljenu na mikroservisima:  
- Više API servisa (katalog, narudžbe, plaćanja, korisnici)  
- Integracija poruka putem Service Bus-a  
- Redis cache za optimizaciju performansi  
- Sveobuhvatno praćenje i logiranje  

**Rezultati**:  
- Kompletna arhitektura mikroservisa  
- Obrasci komunikacije između servisa  
- Testiranje performansi i optimizacija  
- Sigurnosna implementacija spremna za produkciju  

## Procjena i certifikacija

### Provjere znanja  

Dovršite ove procjene nakon svakog modula:  

**Procjena modula 1**: Osnovni koncepti i instalacija  
- Pitanja s višestrukim izborom o osnovnim konceptima  
- Praktični zadaci instalacije i konfiguracije  
- Jednostavna vježba implementacije  

**Procjena modula 2**: Konfiguracija i okruženja  
- Scenariji upravljanja okruženjima  
- Vježbe rješavanja problema s konfiguracijom  
- Implementacija sigurnosne konfiguracije  

**Procjena modula 3**: Implementacija i provisioniranje  
- Izazovi dizajna infrastrukture  
- Scenariji implementacije više servisa  
- Vježbe optimizacije performansi  

**Procjena modula 4**: Validacija prije implementacije  
- Studije slučaja planiranja kapaciteta  
- Scenariji optimizacije troškova  
- Implementacija validacijskih sustava  

**Procjena modula 5**: Rješavanje problema i ispravljanje pogrešaka  
- Vježbe dijagnosticiranja problema  
- Zadaci implementacije praćenja  
- Simulacije odgovora na incidente  

**Procjena modula 6**: Napredne teme  
- Dizajn CI/CD sustava  
- Razvoj prilagođenih predložaka  
- Scenariji arhitekture na razini poduzeća  

### Završni projekt  

Dizajnirajte i implementirajte kompletno rješenje koje demonstrira usvajanje svih koncepata:  

**Zahtjevi**:  
- Arhitektura aplikacije s više slojeva  
- Više okruženja za implementaciju  
- Sveobuhvatno praćenje i sustavi upozorenja  
- Implementacija sigurnosti i usklađenosti  
- Optimizacija troškova i performansi  
- Kompletna dokumentacija i priručnici  

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
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Zajednički resursi  
- [AZD Galerija predložaka](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organizacija](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repozitorij](https://github.com/Azure/azure-dev)  

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
- **Tjedni 1-2**: Moduli 1-2 (Početak, Konfiguracija)  
- **Tjedni 3-4**: Moduli 3-4 (Implementacija, Validacija prije implementacije)  
- **Tjedni 5-6**: Moduli 5-6 (Rješavanje problema, Napredne teme)  
- **Tjedni 7-8**: Praktični projekti i završna procjena  

### Pola radnog vremena (16 tjedana)  
- **Tjedni 1-4**: Modul 1 (Početak)  
- **Tjedni 5-7**: Modul 2 (Konfiguracija i okruženja)  
- **Tjedni 8-10**: Modul 3 (Implementacija i provisioniranje)  
- **Tjedni 11-12**: Modul 4 (Validacija prije implementacije)  
- **Tjedni 13-14**: Modul 5 (Rješavanje problema i ispravljanje pogrešaka)  
- **Tjedni 15-16**: Modul 6 (Napredne teme i procjena)  

---

## Praćenje napretka i okvir za procjenu  

### Popis za dovršetak poglavlja  

Pratite svoj napredak kroz svako poglavlje pomoću ovih mjerljivih rezultata:  

#### 📚 Poglavlje 1: Osnove i brzi početak  
- [ ] **Instalacija dovršena**: AZD instaliran i provjeren na vašoj platformi  
- [ ] **Prva implementacija**: Uspješno implementiran predložak todo-nodejs-mongo  
- [ ] **Postavljanje okruženja**: Konfigurirane prve varijable okruženja  
- [ ] **Navigacija resursima**: Istraženi implementirani resursi u Azure Portalu  
- [ ] **Ovladavanje naredbama**: Ugodno korištenje osnovnih AZD naredbi  

#### 🤖 Poglavlje 2: AI-prvi razvoj  
- [ ] **Implementacija AI predloška**: Uspješno implementiran azure-search-openai-demo  
- [ ] **RAG implementacija**: Konfigurirano indeksiranje i dohvaćanje dokumenata  
- [ ] **Konfiguracija modela**: Postavljeni različiti AI modeli za različite svrhe  
- [ ] **Praćenje AI-a**: Implementirani Application Insights za AI radne opterećenja  
- [ ] **Optimizacija performansi**: Poboljšane performanse AI aplikacije  

#### ⚙️ Poglavlje 3: Konfiguracija i autentifikacija  
- [ ] **Postavljanje više okruženja**: Konfigurirana razvojna, testna i produkcijska okruženja  
- [ ] **Implementacija sigurnosti**: Postavljena autentifikacija putem upravljanog identiteta  
- [ ] **Upravljanje tajnama**: Integriran Azure Key Vault za osjetljive podatke  
- [ ] **Upravljanje parametrima**: Kreirane konfiguracije specifične za okruženje  
- [ ] **Ovladavanje autentifikacijom**: Implementirani sigurni obrasci pristupa  

#### 🏗️ Poglavlje 4: Infrastruktura kao kod i implementacija  
- [ ] **Izrada prilagođenog predloška**: Izrađen predložak za aplikaciju s više servisa  
- [ ] **Ovladavanje Bicepom**: Kreirane modularne, višekratne komponente infrastrukture  
- [ ] **Automatizacija implementacije**: Implementirani pre/post skripti za implementaciju  
- [ ] **Dizajn arhitekture**: Implementirana složena arhitektura mikroservisa  
- [ ] **Optimizacija predloška**: Optimizirani predlošci za performanse i troškove  

#### 🎯 Poglavlje 5: AI rješenja s više agenata  
- [ ] **Implementacija rješenja za maloprodaju**: Implementiran kompletan scenarij maloprodaje s više agenata  
- [ ] **Prilagodba agenata**: Modificirano ponašanje agenata za korisnike i inventar  
- [ ] **Skaliranje arhitekture**: Implementirano balansiranje opterećenja i automatsko skaliranje  
- [ ] **Praćenje produkcije**: Postavljeno sveobuhvatno praćenje i sustavi upozorenja  
- [ ] **Optimizacija performansi**: Poboljšane performanse sustava s više agenata  

#### 🔍 Poglavlje 6: Validacija prije implementacije i planiranje  
- [ ] **Analiza kapaciteta**: Analizirani zahtjevi resursa za aplikacije  
- [ ] **Optimizacija SKU-a**: Odabrani troškovno učinkoviti servisi  
- [ ] **Automatizacija validacije**: Implementirani skripti za provjeru prije implementacije  
- [ ] **Planiranje troškova**: Izrađene procjene troškova implementacije i proračuni  
- [ ] **Procjena rizika**: Identificirani i ublaženi rizici implementacije  

#### 🚨 Poglavlje 7: Rješavanje problema i ispravljanje pogrešaka  
- [ ] **Dijagnostičke vještine**: Uspješno ispravljeni namjerno pokvareni implementacije  
- [ ] **Analiza logova**: Učinkovito korištenje Azure Monitora i Application Insightsa  
- [ ] **Optimizacija performansi**: Poboljšane performanse sporih aplikacija  
- [ ] **Procedure oporavka**: Implementirani backup i oporavak od katastrofe  
- [ ] **Postavljanje praćenja**: Kreirani proaktivni sustavi praćenja i upozorenja  

#### 🏢 Poglavlje 8: Produkcija i obrasci na razini poduzeća  
- [ ] **Sigurnost na razini poduzeća**: Implementirani sveobuhvatni sigurnosni obrasci  
- [ ] **Okvir upravljanja**: Postavljeni Azure Policy i upravljanje resursima  
- [ ] **Napredno praćenje**: Kreirane nadzorne ploče i automatizirana upozorenja  
- [ ] **Integracija CI/CD sustava**: Izgrađeni automatizirani sustavi implementacije  
- [ ] **Implementacija usklađenosti**: Zadovoljeni zahtjevi usklađenosti na razini poduzeća  

### Vremenska crta učenja i prekretnice  

#### Tjedan 1-2: Izgradnja temelja  
- **Prekretnica**: Implementacija prve AI aplikacije koristeći AZD  
- **Validacija**: Funkcionalna aplikacija dostupna putem javnog URL-a  
- **Vještine**: Osnovni radni tokovi AZD-a i integracija AI servisa  

#### Tjedan 3-4: Ovladavanje konfiguracijom  
- **Prekretnica**: Implementacija u više okruženja s sigurnom autentifikacijom  
- **Validacija**: Ista aplikacija implementirana u razvojno/testno/produkcijsko okruženje  
- **Vještine**: Upravljanje okruženjima i implementacija sigurnosti  

#### Tjedan 5-6: Stručnost u infrastrukturi  
- **Prekretnica**: Prilagođeni predložak za složenu aplikaciju s više servisa  
- **Validacija**: Višekratni predložak implementiran od strane drugog člana tima  
- **Vještine**: Ovladavanje Bicepom i automatizacija infrastrukture  

#### Tjedan 7-8: Napredna AI implementacija  
- **Prekretnica**: Produkcijski spremno AI rješenje s više agenata  
- **Validacija**: Sustav koji podnosi stvarno opterećenje uz praćenje  
- **Vještine**: Orkestracija sustava s više agenata i optimizacija performansi  

#### Tjedan 9-10: Spremnost za produkciju  
- **Prekretnica**: Implementacija na razini poduzeća s punom usklađenošću  
- **Validacija**: Prolazak sigurnosne revizije i optimizacija troškova  
- **Vještine**: Upravljanje, praćenje i integracija CI/CD sustava  

### Procjena i certifikacija  

#### Metode validacije znanja  
1. **Praktične implementacije**: Funkcionalne aplikacije za svako poglavlje  
2. **Pregledi koda**: Procjena kvalitete predložaka i konfiguracija  
3. **Rješavanje problema**: Scenariji rješavanja problema i rješenja  
4. **Podučavanje kolega**: Objašnjavanje koncepata
- **Dokumentacija**: Doprinesite dokumentaciji zajednice i primjerima
- **Povratne informacije**: Pružite povratne informacije o sadržaju tečaja i Azure uslugama

#### Razvoj karijere
- **Profesionalna mreža**: Povežite se s Azure i AI stručnjacima
- **Prilike za govorenje**: Predstavite svoja saznanja na konferencijama ili meetupovima
- **Doprinos otvorenom kodu**: Doprinesite AZD predlošcima i alatima
- **Mentorstvo**: Vodite druge developere kroz njihovo AZD obrazovanje

---

**Navigacija kroz poglavlja:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Započnite učenje**: [Poglavlje 1: Osnove i brzi početak](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Praćenje napretka**: Pratite svoj napredak kroz sveobuhvatan sustav učenja od 8 poglavlja
- **🤝 Zajednica**: [Azure Discord](https://discord.gg/microsoft-azure) za podršku i raspravu

**Praćenje napretka u učenju**: Koristite ovaj strukturirani vodič za savladavanje Azure Developer CLI-a kroz progresivno, praktično učenje s mjerljivim rezultatima i profesionalnim razvojnim prednostima.

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za nesporazume ili pogrešne interpretacije koje mogu proizaći iz korištenja ovog prijevoda.
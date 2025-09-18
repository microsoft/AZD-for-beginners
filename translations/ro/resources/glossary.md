<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-18T11:11:31+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "ro"
}
-->
# Glosar - Termeni Azure și AZD

**Referință pentru toate capitolele**
- **📚 Acasă Curs**: [AZD Pentru Începători](../README.md)
- **📖 Învață Bazele**: [Capitolul 1: Bazele AZD](../docs/getting-started/azd-basics.md)
- **🤖 Termeni AI**: [Capitolul 2: Dezvoltare AI-First](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Introducere

Acest glosar cuprinzător oferă definiții pentru termeni, concepte și acronime utilizate în Azure Developer CLI și dezvoltarea în cloud Azure. Este o referință esențială pentru înțelegerea documentației tehnice, rezolvarea problemelor și comunicarea eficientă despre proiectele azd și serviciile Azure.

## Obiective de învățare

Prin utilizarea acestui glosar, vei:
- Înțelege terminologia și conceptele esențiale ale Azure Developer CLI
- Stăpâni vocabularul și termenii tehnici ai dezvoltării în cloud Azure
- Referi eficient terminologia pentru Infrastructure as Code și implementare
- Înțelege numele serviciilor Azure, acronimele și scopurile acestora
- Accesa definiții pentru terminologia de depanare și rezolvare a problemelor
- Învață concepte avansate de arhitectură și dezvoltare Azure

## Rezultate de învățare

Cu referințe regulate la acest glosar, vei putea:
- Comunica eficient folosind terminologia corectă a Azure Developer CLI
- Înțelege mai clar documentația tehnică și mesajele de eroare
- Naviga cu încredere printre serviciile și conceptele Azure
- Rezolva probleme utilizând vocabularul tehnic adecvat
- Contribui la discuțiile de echipă cu un limbaj tehnic precis
- Extinde sistematic cunoștințele despre dezvoltarea în cloud Azure

## A

**ARM Template**  
Șablon Azure Resource Manager. Format JSON pentru Infrastructure as Code utilizat pentru definirea și implementarea resurselor Azure în mod declarativ.

**App Service**  
Oferta platform-as-a-service (PaaS) a Azure pentru găzduirea aplicațiilor web, API-urilor REST și backend-urilor mobile fără gestionarea infrastructurii.

**Application Insights**  
Serviciul de monitorizare a performanței aplicațiilor (APM) al Azure care oferă informații detaliate despre performanța, disponibilitatea și utilizarea aplicațiilor.

**Azure CLI**  
Interfață de linie de comandă pentru gestionarea resurselor Azure. Utilizată de azd pentru autentificare și unele operațiuni.

**Azure Developer CLI (azd)**  
Instrument de linie de comandă centrat pe dezvoltatori care accelerează procesul de construire și implementare a aplicațiilor în Azure folosind șabloane și Infrastructure as Code.

**azure.yaml**  
Fișierul principal de configurare pentru un proiect azd care definește servicii, infrastructură și hook-uri de implementare.

**Azure Resource Manager (ARM)**  
Serviciul de implementare și gestionare al Azure care oferă un strat de gestionare pentru crearea, actualizarea și ștergerea resurselor.

## B

**Bicep**  
Limbaj specific domeniului (DSL) dezvoltat de Microsoft pentru implementarea resurselor Azure. Oferă o sintaxă mai simplă decât șabloanele ARM, compilându-se în ARM.

**Build**  
Procesul de compilare a codului sursă, instalarea dependențelor și pregătirea aplicațiilor pentru implementare.

**Blue-Green Deployment**  
Strategie de implementare care utilizează două medii de producție identice (blue și green) pentru a minimiza timpul de nefuncționare și riscurile.

## C

**Container Apps**  
Serviciul serverless al Azure pentru rularea aplicațiilor containerizate fără gestionarea infrastructurii complexe.

**CI/CD**  
Integrare continuă/Implementare continuă. Practici automatizate pentru integrarea modificărilor de cod și implementarea aplicațiilor.

**Cosmos DB**  
Serviciul de baze de date distribuite global și multi-model al Azure care oferă SLA-uri cuprinzătoare pentru debit, latență, disponibilitate și consistență.

**Configuration**  
Setări și parametri care controlează comportamentul aplicației și opțiunile de implementare.

## D

**Deployment**  
Procesul de instalare și configurare a aplicațiilor și dependențelor acestora pe infrastructura țintă.

**Docker**  
Platformă pentru dezvoltarea, livrarea și rularea aplicațiilor utilizând tehnologia de containerizare.

**Dockerfile**  
Fișier text care conține instrucțiuni pentru construirea unei imagini de container Docker.

## E

**Environment**  
O țintă de implementare care reprezintă o instanță specifică a aplicației tale (ex.: dezvoltare, testare, producție).

**Environment Variables**  
Valori de configurare stocate ca perechi cheie-valoare pe care aplicațiile le pot accesa în timpul rulării.

**Endpoint**  
URL sau adresă de rețea unde o aplicație sau un serviciu poate fi accesat.

## F

**Function App**  
Serviciul serverless de calcul al Azure care permite rularea codului bazat pe evenimente fără gestionarea infrastructurii.

## G

**GitHub Actions**  
Platformă CI/CD integrată cu depozitele GitHub pentru automatizarea fluxurilor de lucru.

**Git**  
Sistem de control al versiunilor distribuit utilizat pentru urmărirea modificărilor în codul sursă.

## H

**Hooks**  
Scripturi sau comenzi personalizate care rulează în puncte specifice ale ciclului de viață al implementării (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipul de serviciu Azure unde va fi implementată o aplicație (ex.: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Practica de definire și gestionare a infrastructurii prin cod, mai degrabă decât prin procese manuale.

**Init**  
Procesul de inițializare a unui nou proiect azd, de obicei dintr-un șablon.

## J

**JSON**  
JavaScript Object Notation. Format de schimb de date utilizat frecvent pentru fișiere de configurare și răspunsuri API.

**JWT**  
JSON Web Token. Standard pentru transmiterea securizată a informațiilor între părți sub formă de obiect JSON.

## K

**Key Vault**  
Serviciul Azure pentru stocarea și gestionarea securizată a secretelor, cheilor și certificatelor.

**Kusto Query Language (KQL)**  
Limbaj de interogare utilizat pentru analizarea datelor în Azure Monitor, Application Insights și alte servicii Azure.

## L

**Load Balancer**  
Serviciu care distribuie traficul de rețea primit între mai multe servere sau instanțe.

**Log Analytics**  
Serviciul Azure pentru colectarea, analizarea și acționarea pe baza datelor de telemetrie din medii cloud și on-premises.

## M

**Managed Identity**  
Funcționalitate Azure care oferă serviciilor Azure o identitate gestionată automat pentru autentificarea la alte servicii Azure.

**Microservices**  
Abordare arhitecturală în care aplicațiile sunt construite ca o colecție de servicii mici și independente.

**Monitor**  
Soluția unificată de monitorizare a Azure care oferă observabilitate completă pentru aplicații și infrastructură.

## N

**Node.js**  
Runtime JavaScript construit pe motorul V8 al Chrome pentru construirea aplicațiilor server-side.

**npm**  
Manager de pachete pentru Node.js care gestionează dependențele și pachetele.

## O

**Output**  
Valori returnate din implementarea infrastructurii care pot fi utilizate de aplicații sau alte resurse.

## P

**Package**  
Procesul de pregătire a codului aplicației și dependențelor pentru implementare.

**Parameters**  
Valori de intrare transmise șabloanelor de infrastructură pentru personalizarea implementărilor.

**PostgreSQL**  
Sistem de baze de date relaționale open-source, suportat ca serviciu gestionat în Azure.

**Provisioning**  
Procesul de creare și configurare a resurselor Azure definite în șabloanele de infrastructură.

## Q

**Quota**  
Limite privind cantitatea de resurse care pot fi create într-un abonament sau regiune Azure.

## R

**Resource Group**  
Container logic pentru resursele Azure care împărtășesc același ciclu de viață, permisiuni și politici.

**Resource Token**  
Șir unic generat de azd pentru a asigura unicitatea numelor resurselor în implementări.

**REST API**  
Stil arhitectural pentru proiectarea aplicațiilor de rețea utilizând metode HTTP.

**Rollback**  
Procesul de revenire la o versiune anterioară a unei aplicații sau configurații de infrastructură.

## S

**Service**  
Un component al aplicației tale definit în azure.yaml (ex.: frontend web, backend API, bază de date).

**SKU**  
Unitate de stocare. Reprezintă diferite niveluri de performanță sau categorii de servicii pentru resursele Azure.

**SQL Database**  
Serviciul de baze de date relaționale gestionat al Azure, bazat pe Microsoft SQL Server.

**Static Web Apps**  
Serviciul Azure pentru construirea și implementarea aplicațiilor web full-stack din depozite de cod sursă.

**Storage Account**  
Serviciul Azure care oferă stocare în cloud pentru obiecte de date, inclusiv blobs, fișiere, cozi și tabele.

**Subscription**  
Container de cont Azure care deține grupuri de resurse și resurse, cu gestionarea asociată a facturării și accesului.

## T

**Template**  
Structură predefinită de proiect care conține codul aplicației, definițiile infrastructurii și configurația pentru scenarii comune.

**Terraform**  
Instrument open-source pentru Infrastructure as Code care suportă mai mulți furnizori de cloud, inclusiv Azure.

**Traffic Manager**  
Balancer de trafic bazat pe DNS al Azure pentru distribuirea traficului între regiunile globale Azure.

## U

**URI**  
Uniform Resource Identifier. Șir care identifică o resursă specifică.

**URL**  
Uniform Resource Locator. Tip de URI care specifică locația unei resurse și modul de accesare a acesteia.

## V

**Virtual Network (VNet)**  
Bloc fundamental pentru rețelele private în Azure, oferind izolare și segmentare.

**VS Code**  
Visual Studio Code. Editor de cod popular cu integrare excelentă pentru Azure și azd.

## W

**Webhook**  
Callback HTTP declanșat de evenimente specifice, utilizat frecvent în pipeline-uri CI/CD.

**What-if**  
Funcționalitate Azure care arată ce modificări ar fi făcute de o implementare fără a o executa efectiv.

## Y

**YAML**  
YAML Ain't Markup Language. Standard de serializare a datelor, ușor de citit de oameni, utilizat pentru fișiere de configurare precum azure.yaml.

## Z

**Zone**  
Locații fizic separate într-o regiune Azure care oferă redundanță și disponibilitate ridicată.

---

## Acronime Comune

| Acronim | Formă Completă | Descriere |
|---------|----------------|-----------|
| AAD | Azure Active Directory | Serviciu de gestionare a identității și accesului |
| ACR | Azure Container Registry | Serviciu de registru pentru imagini de container |
| AKS | Azure Kubernetes Service | Serviciu Kubernetes gestionat |
| API | Application Programming Interface | Set de protocoale pentru construirea software-ului |
| ARM | Azure Resource Manager | Serviciul de implementare și gestionare al Azure |
| CDN | Content Delivery Network | Rețea distribuită de servere |
| CI/CD | Continuous Integration/Continuous Deployment | Practici automatizate de dezvoltare |
| CLI | Command Line Interface | Interfață utilizator bazată pe text |
| DNS | Domain Name System | Sistem pentru traducerea numelor de domenii în adrese IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versiune securizată a HTTP |
| IaC | Infrastructure as Code | Gestionarea infrastructurii prin cod |
| JSON | JavaScript Object Notation | Format de schimb de date |
| JWT | JSON Web Token | Format de token pentru transmiterea securizată a informațiilor |
| KQL | Kusto Query Language | Limbaj de interogare pentru serviciile de date Azure |
| RBAC | Role-Based Access Control | Metodă de control al accesului bazată pe roluri |
| REST | Representational State Transfer | Stil arhitectural pentru servicii web |
| SDK | Software Development Kit | Colecție de instrumente de dezvoltare |
| SLA | Service Level Agreement | Angajament privind disponibilitatea/performanța serviciului |
| SQL | Structured Query Language | Limbaj pentru gestionarea bazelor de date relaționale |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocoale criptografice |
| URI | Uniform Resource Identifier | Șir care identifică o resursă |
| URL | Uniform Resource Locator | Tip de URI care specifică locația unei resurse |
| VM | Virtual Machine | Emulare a unui sistem de calcul |
| VNet | Virtual Network | Rețea privată în Azure |
| YAML | YAML Ain't Markup Language | Standard de serializare a datelor |

---

## Mapări ale Numelelor Serviciilor Azure

| Nume Comun | Numele Oficial al Serviciului Azure | Tip Host azd |
|------------|-------------------------------------|--------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termeni Specifici Contextului

### Termeni de Dezvoltare
- **Hot Reload**: Actualizarea automată a aplicațiilor în timpul dezvoltării fără repornire
- **Build Pipeline**: Proces automatizat pentru construirea și testarea codului
- **Deployment Slot**: Mediu de testare în cadrul unui App Service
- **Environment Parity**: Menținerea asemănării între mediile de dezvoltare, testare și producție

### Termeni de Securitate
- **Managed Identity**: Funcționalitate Azure care oferă gestionarea automată a acreditărilor
- **Key Vault**: Stocare securizată pentru secrete, chei și certificate
- **RBAC**: Control al accesului bazat pe roluri pentru resursele Azure
- **Network Security Group**: Firewall virtual pentru controlul traficului de rețea

### Termeni de Monitorizare
- **Telemetry**: Colectarea automată a măsurătorilor și datelor
- **Application Performance Monitoring (APM)**: Monitorizarea performanței software-ului
- **Log Analytics**: Serviciu pentru colectarea și analizarea datelor de jurnal
- **Alert Rules**: Notificări automate bazate pe metrici sau condiții

### Termeni de Implementare
- **Blue-Green Deployment**: Strategie de implementare fără întreruperi
- **Canary Deployment**: Lansare graduală către un subset de utilizatori
- **Rolling Update**: Înlocuirea secvențială a instanțelor aplicației
- **Rollback**: Revenirea la o versiune anterioară a aplicației

---

**Sfat de utilizare**: Folosește `Ctrl+F` pentru a căuta rapid termeni specifici în acest glosar. Termenii sunt referențiați încrucișat acolo unde este aplicabil.

---

**Navigare**
- **Lecția Anterioară**: [Cheat Sheet](cheat-sheet.md)
- **Lecția Următoare**: [FAQ](faq.md)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
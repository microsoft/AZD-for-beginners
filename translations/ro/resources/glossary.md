# Glosar - Terminologie Azure și AZD

**Referință pentru toate capitolele**  
- **📚 Pagina cursului**: [AZD Pentru Începători](../README.md)  
- **📖 Învață elementele de bază**: [Capitolul 1: Bazele AZD](../docs/getting-started/azd-basics.md)  
- **🤖 Termeni AI**: [Capitolul 2: Dezvoltare AI-First](../docs/microsoft-foundry/microsoft-foundry-integration.md)  

## Introducere

Acest glosar cuprinzător oferă definiții pentru termeni, concepte și acronime utilizate în Azure Developer CLI și dezvoltarea Azure în cloud. Referință esențială pentru înțelegerea documentației tehnice, rezolvarea problemelor și comunicarea eficientă despre proiectele azd și serviciile Azure.

## Obiective de învățare

Prin utilizarea acestui glosar, vei:  
- Înțelege terminologia și conceptele esențiale Azure Developer CLI  
- Stăpâni vocabularul și termenii tehnici din dezvoltarea Azure în cloud  
- Consulta eficient terminologia infrastructurii ca cod și a implementării  
- Înțelege denumirile serviciilor Azure, acronimele și scopurile lor  
- Accesa definiții pentru terminologia de depanare și debugging  
- Învață concepte avansate de arhitectură și dezvoltare Azure  

## Rezultate de învățare

Cu referință regulată la acest glosar, vei putea:  
- Comunica eficient folosind terminologia corectă Azure Developer CLI  
- Înțelege documentația tehnică și mesajele de eroare mai clar  
- Naviga în serviciile și conceptele Azure cu încredere  
- Depana probleme folosind vocabular tehnic adecvat  
- Contribui la discuții de echipă cu limbaj tehnic corect  
- Extinde cunoștințele tale despre dezvoltarea Azure în cloud în mod sistematic  

## A

**ARM Template**  
Șablon Azure Resource Manager. Format Infrastructure as Code bazat pe JSON folosit pentru a defini și implementa resurse Azure în mod declarativ.

**App Service**  
Oferta platformă ca serviciu (PaaS) a Azure pentru găzduirea aplicațiilor web, API REST și backend-uri mobile fără administrarea infrastructurii.

**Application Insights**  
Serviciul Azure de monitorizare a performanței aplicațiilor (APM) care oferă informații detaliate despre performanța, disponibilitatea și utilizarea aplicațiilor.

**Azure CLI**  
Interfață de linie de comandă pentru gestionarea resurselor Azure. Utilizată de azd pentru autentificare și unele operațiuni.

**Azure Developer CLI (azd)**  
Instrument de linie de comandă orientat către dezvoltatori care accelerează procesul de construire și implementare a aplicațiilor în Azure folosind șabloane și Infrastructure as Code.

**azure.yaml**  
Fișierul principal de configurare pentru un proiect azd care definește servicii, infrastructură și hook-uri de implementare.

**Azure Resource Manager (ARM)**  
Serviciul Azure pentru implementare și management care oferă un strat de management pentru crearea, actualizarea și ștergerea resurselor.

## B

**Bicep**  
Limbaj specific domeniului (DSL) dezvoltat de Microsoft pentru implementarea resurselor Azure. Oferă o sintaxă mai simplă decât șabloanele ARM, compilându-se în ARM.

**Build**  
Procesul de compilare a codului sursă, instalare a dependențelor și pregătire a aplicațiilor pentru implementare.

**Blue-Green Deployment**  
Strategie de implementare care folosește două medii de producție identice (albastru și verde) pentru a minimiza timpul de nefuncționare și riscul.

## C

**Container Apps**  
Serviciul serverless de containere Azure care permite rularea aplicațiilor containerizate fără gestionarea infrastructurii complexe.

**CI/CD**  
Integrare Continuă/Implementare Continuă. Practici automate pentru integrarea modificărilor de cod și implementarea aplicațiilor.

**Cosmos DB**  
Serviciul de baze de date multi-model distribuit global al Azure care oferă acorduri SLA cuprinzătoare pentru debit, latență, disponibilitate și consistență.

**Configuration**  
Setări și parametri care controlează comportamentul aplicației și opțiunile de implementare.

## D

**Deployment**  
Procesul de instalare și configurare a aplicațiilor și a dependențelor acestora pe infrastructura țintă.

**Docker**  
Platformă pentru dezvoltarea, livrarea și rularea aplicațiilor folosind tehnologia containerizării.

**Dockerfile**  
Fișier text care conține instrucțiuni pentru construirea unei imagini Docker.

## E

**Environment**  
Țintă de implementare ce reprezintă o instanță specifică a aplicației tale (ex. dezvoltare, testare, producție).

**Environment Variables**  
Valori de configurare stocate ca perechi cheie-valoare pe care aplicațiile le pot accesa în timpul execuției.

**Endpoint**  
URL sau adresă de rețea unde o aplicație sau serviciu poate fi accesat.

## F

**Function App**  
Serviciul serverless de calcul al Azure care permite rularea codului declanșat de evenimente fără gestionarea infrastructurii.

## G

**GitHub Actions**  
Platformă CI/CD integrată cu depozitele GitHub pentru automatizarea fluxurilor de lucru.

**Git**  
Sistem dispersat de control al versiunilor folosit pentru urmărirea modificărilor în codul sursă.

## H

**Hooks**  
Scripturi sau comenzi personalizate care se execută în puncte specifice ale ciclului de viață al implementării (preprovisionare, postprovisionare, predeploy, postdeploy).

**Host**  
Tipul serviciului Azure unde va fi implementată o aplicație (ex. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Practica de a defini și gestiona infrastructura prin cod, în loc de procese manuale.

**Init**  
Procesul de inițializare a unui proiect nou azd, de obicei dintr-un șablon.

## J

**JSON**  
JavaScript Object Notation. Format de schimb de date utilizat frecvent pentru fișiere de configurare și răspunsuri API.

**JWT**  
JSON Web Token. Standard pentru transmiterea în siguranță a informațiilor între părți ca obiect JSON.

## K

**Key Vault**  
Serviciul Azure pentru stocarea și gestionarea securizată a secretelor, cheilor și certificatelor.

**Kusto Query Language (KQL)**  
Limbaj de interogare folosit pentru analizarea datelor în Azure Monitor, Application Insights și alte servicii Azure.

## L

**Load Balancer**  
Serviciu care distribuie traficul de rețea primit între mai multe servere sau instanțe.

**Log Analytics**  
Serviciu Azure pentru colectarea, analizarea și acționarea pe baza datelor de telemetrie din medii cloud și on-premises.

## M

**Managed Identity**  
Caracteristică Azure care oferă serviciilor Azure o identitate gestionată automat pentru autentificare la alte servicii Azure.

**Microservices**  
Abordare arhitecturală în care aplicațiile sunt construite ca un ansamblu de servicii mici, independente.

**Monitor**  
Soluția unificată de monitorizare Azure care oferă vizibilitate completă a aplicațiilor și infrastructurii.

## N

**Node.js**  
Mediu de execuție JavaScript construit pe motorul V8 al Chrome pentru dezvoltarea aplicațiilor server-side.

**npm**  
Manager de pachete pentru Node.js care gestionează dependențele și pachetele.

## O

**Output**  
Valori returnate de implementarea infrastructurii ce pot fi folosite de aplicații sau alte resurse.

## P

**Package**  
Procesul de pregătire a codului aplicației și a dependențelor pentru implementare.

**Parameters**  
Valori de intrare transmise șabloanelor de infrastructură pentru personalizarea implementărilor.

**PostgreSQL**  
Sistem open-source de baze de date relaționale suportat ca serviciu gestionat în Azure.

**Provisioning**  
Procesul de creare și configurare a resurselor Azure definite în șabloanele de infrastructură.

## Q

**Quota**  
Limite asupra cantității de resurse ce pot fi create într-un abonament sau regiune Azure.

## R

**Resource Group**  
Container logic pentru resurse Azure care împărtășesc același ciclu de viață, permisiuni și politici.

**Resource Token**  
Șir unic generat de azd pentru a asigura unicitatea numelor resurselor între implementări.

**REST API**  
Stil arhitectural pentru proiectarea aplicațiilor în rețea folosind metode HTTP.

**Rollback**  
Procesul de revenire la o versiune anterioară a unei aplicații sau configurații de infrastructură.

## S

**Service**  
Un component al aplicației tale definit în azure.yaml (ex. frontend web, backend API, bază de date).

**SKU**  
Stock Keeping Unit. Reprezintă diferite niveluri de servicii sau performanță pentru resurse Azure.

**SQL Database**  
Serviciul gestionat de baze de date relaționale al Azure bazat pe Microsoft SQL Server.

**Static Web Apps**  
Serviciu Azure pentru construirea și implementarea aplicațiilor web full-stack din depozite de cod sursă.

**Storage Account**  
Serviciu Azure care oferă stocare în cloud pentru obiecte de date, inclusiv blob-uri, fișiere, cozi și tabele.

**Subscription**  
Container de cont Azure care conține grupuri de resurse și resurse, cu facturare și gestionare acces asociată.

## T

**Template**  
Structură de proiect pre-construită care conține codul aplicației, definiții de infrastructură și configurare pentru scenarii comune.

**Terraform**  
Instrument open-source Infrastructure as Code care suportă mai mulți provideri cloud, inclusiv Azure.

**Traffic Manager**  
Echilibrator de trafic Azure bazat pe DNS pentru distribuirea traficului între regiuni Azure globale.

## U

**URI**  
Uniform Resource Identifier. Șir care identifică o resursă specifică.

**URL**  
Uniform Resource Locator. Tip de URI care specifică unde este localizată o resursă și cum se poate accesa.

## V

**Virtual Network (VNet)**  
Element fundamental pentru rețele private în Azure, oferind izolare și segmentare.

**VS Code**  
Visual Studio Code. Editor de cod popular cu integrare excelentă Azure și azd.

## W

**Webhook**  
Callback HTTP declanșat de evenimente specifice, utilizat frecvent în pipeline-uri CI/CD.

**What-if**  
Funcționalitate Azure care arată ce modificări ar fi făcute de o implementare fără a o executa efectiv.

## Y

**YAML**  
YAML Ain't Markup Language. Standard uman-readable de serializare a datelor, folosit pentru fișierele de configurare ca azure.yaml.

## Z

**Zone**  
Locații fizic separate într-o regiune Azure care oferă redundanță și disponibilitate ridicată.

---

## Acronime comune

| Acronim | Forma completă | Descriere |
|---------|----------------|-----------|
| AAD | Azure Active Directory (acum Microsoft Entra ID) | Serviciu de management al identității și accesului |
| ACR | Azure Container Registry | Serviciu de registru imagini container |
| AKS | Azure Kubernetes Service | Serviciu Kubernetes gestionat |
| API | Application Programming Interface | Set de protocoale pentru construirea software-ului |
| ARM | Azure Resource Manager | Serviciul Azure pentru implementare și management |
| CDN | Content Delivery Network | Rețea distribuită de servere |
| CI/CD | Continuous Integration/Continuous Deployment | Practici automate de dezvoltare |
| CLI | Command Line Interface | Interfață utilizator bazată pe text |
| DNS | Domain Name System | Sistem pentru traducerea numelor de domenii în adrese IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versiunea securizată a HTTP |
| IaC | Infrastructure as Code | Gestionarea infrastructurii prin cod |
| JSON | JavaScript Object Notation | Format de schimb de date |
| JWT | JSON Web Token | Format token pentru transmitere securizată a informațiilor |
| KQL | Kusto Query Language | Limbaj de interogare pentru serviciile de date Azure |
| RBAC | Role-Based Access Control | Metodă de control acces bazată pe roluri |
| REST | Representational State Transfer | Stil arhitectural pentru servicii web |
| SDK | Software Development Kit | Colecție de instrumente de dezvoltare |
| SLA | Service Level Agreement | Angajament privind disponibilitatea/perfomanța serviciului |
| SQL | Structured Query Language | Limbaj pentru gestionarea bazelor de date relaționale |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocoale criptografice |
| URI | Uniform Resource Identifier | Șir care identifică o resursă |
| URL | Uniform Resource Locator | Tip de URI care specifică locația resursei |
| VM | Virtual Machine | Emulare a unui sistem de calcul |
| VNet | Virtual Network | Rețea privată în Azure |
| YAML | YAML Ain't Markup Language | Standard de serializare a datelor |

---

## Mapări denumiri servicii Azure

| Denumire comună | Denumirea oficială serviciu Azure | Tip gazdă azd |
|-----------------|-----------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termeni specific contextului

### Termeni dezvoltare  
- **Hot Reload**: Actualizarea automată a aplicațiilor în timpul dezvoltării fără repornire  
- **Build Pipeline**: Proces automatizat pentru construire și testare cod  
- **Deployment Slot**: Mediu de testare într-un App Service  
- **Environment Parity**: Menținerea similitudinii între mediile de dezvoltare, testare și producție  

### Termeni securitate  
- **Managed Identity**: Caracteristică Azure care oferă management automat al acreditărilor  
- **Key Vault**: Stocare sigură pentru secrete, chei și certificate  
- **RBAC**: Control acces bazat pe roluri pentru resurse Azure  
- **Network Security Group**: Firewall virtual pentru controlul traficului de rețea  

### Termeni monitorizare  
- **Telemetry**: Colectare automată de măsurători și date  
- **Application Performance Monitoring (APM)**: Monitorizarea performanței software  
- **Log Analytics**: Serviciu pentru colectarea și analiza datelor de log  
- **Alert Rules**: Notificări automate bazate pe metrici sau condiții  

### Termeni implementare  
- **Blue-Green Deployment**: Strategie de implementare fără timp de nefuncționare  
- **Canary Deployment**: Lansare graduală către un subset de utilizatori  
- **Rolling Update**: Înlocuire secvențială a instanțelor aplicației  
- **Rollback**: Revenirea la o versiune anterioară a aplicației  

---

**Sfat de utilizare**: Folosește `Ctrl+F` pentru a căuta rapid termeni specifici în acest glosar. Termenii sunt corelați când este cazul.

---

**Navigare**  
- **Lecția anterioară**: [Fișă de referință](cheat-sheet.md)  
- **Lecția următoare**: [Întrebări frecvente](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
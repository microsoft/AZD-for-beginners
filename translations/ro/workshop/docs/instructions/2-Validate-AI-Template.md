# 2. Validarea unui Șablon

> Validat cu `azd 1.27.1` în iulie 2026.

!!! tip "LA FINALUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Analizezi Arhitectura Soluției AI
    - [ ] Înțelegi Fluxul de Lucru pentru Implementarea AZD
    - [ ] Folosești GitHub Copilot pentru a primi ajutor la utilizarea AZD
    - [ ] **Laborator 2:** Implementarea & Validarea șablonului AI Agents

---


## 1. Introducere

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) sau `azd` este un instrument open-source de linie de comandă care simplifică fluxul de lucru al dezvoltatorului atunci când construiește și implementează aplicații în Azure.

[Șabloanele AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sunt depozite standardizate care includ codul de aplicație exemplu, resurse _infrastructură-ca-șablon_, și fișiere de configurare `azd` pentru o arhitectură coerentă a soluției. Provisionarea infrastructurii devine la fel de simplă ca o comandă `azd provision` - în timp ce folosirea `azd up` îți permite să provisionezi infrastructura **și** să implementezi aplicația dintr-o singură dată!

Ca rezultat, începutul procesului tău de dezvoltare a aplicației poate fi la fel de simplu precum găsirea șablonului _AZD Starter_ potrivit, care se apropie cel mai mult de nevoile tale de aplicație și infrastructură - apoi personalizarea depozitului pentru a se potrivi cerințelor tale scenaristice.

Înainte să începem, să ne asigurăm că ai instalat Azure Developer CLI.

1. Deschide un terminal VS Code și tastează această comandă:

      ```bash title="" linenums="0"
      azd version
      ```

1. Ar trebui să vezi ceva similar!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Acum ești pregătit să selectezi și să implementezi un șablon cu azd**

---

## 2. Selectarea șablonului

Platforma Microsoft Foundry vine cu un [set de șabloane AZD recomandate](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) care acoperă scenarii populare precum _automatizarea fluxului de lucru multi-agent_ și _procesarea conținutului multimodal_. Poți descoperi aceste șabloane și vizitând portalul Microsoft Foundry.

1. Vizitează [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Autentifică-te în portalul Microsoft Foundry atunci când ți se cere - vei vedea ceva similar.

![Pick](../../../../../translated_images/ro/01-pick-template.60d2d5fff5ebc374.webp)


Opțiunile **Basic** sunt șabloanele tale de început:

1. [ ] [Începe cu AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) care implementează o aplicație de chat de bază _cu datele tale_ pe Azure Container Apps. Folosește-l pentru a explora un scenariu de chatbot AI simplu.
1. [X] [Începe cu AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) care implementează de asemenea un Agent AI standard (cu Foundry Agents). Folosește-l pentru a te familiariza cu soluțiile agentice AI care implică unelte și modele.

Vizitează al doilea link într-un tab nou de browser (sau dă clic pe `Open in GitHub` pentru cardul aferent). Ar trebui să vezi depozitul pentru acest Șablon AZD. Ia-ți un minut să explorezi README-ul. Arhitectura aplicației arată astfel:

![Arch](../../../../../translated_images/ro/architecture.8cec470ec15c65c7.webp)

---

## 3. Activarea șablonului

Hai să încercăm să implementăm acest șablon și să ne asigurăm că este valid. Vom urma indicațiile din secțiunea [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Alege un mediu de lucru pentru depozitul șablonului:

      - **GitHub Codespaces**: Click [acest link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) și confirmă `Create codespace`
      - **Clonare locală sau container dev**: Clonează `Azure-Samples/get-started-with-ai-agents` și deschide-l în VS Code

1. Așteaptă până când terminalul VS Code este gata, apoi tastează următoarea comandă:

   ```bash title="" linenums="0"
   azd up
   ```

Completă pașii din fluxul de lucru care vor fi declanșați:

1. Ți se va cere să te autentifici în Azure - urmează instrucțiunile pentru autentificare
1. Introdu un nume unic pentru mediu - de ex., eu am folosit `nitya-mshack-azd`
1. Aceasta va crea un folder `.azure/` - vei vedea un subfolder cu numele mediului
1. Vei fi întrebat să selectezi un nume de abonament - selectează default
1. Vei fi întrebat pentru locație - folosește `East US 2`

Acum, așteaptă finalizarea provisionării. **Acest proces durează 10-15 minute**

1. Când este gata, consola ta va afișa un mesaj de SUCCES ca acesta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portalul tău Azure va avea acum un grup de resurse provisionat cu numele acelui mediu:

      ![Infra](../../../../../translated_images/ro/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Acum ești gata să validezi infrastructura și aplicația implementate**.

---

## 4. Validarea șablonului

1. Vizitează pagina [Resource Groups](https://portal.azure.com/#browse/resourcegroups) din Azure Portal - autentifică-te când ți se cere
1. Dă clic pe RG pentru numele mediului tău - vei vedea pagina de mai sus

      - dă clic pe resursa Azure Container Apps
      - dă clic pe Application Url în secțiunea _Essentials_ (sus dreapta)

1. Ar trebui să vezi o interfață UI frontală a aplicației găzduite ca aceasta:

   ![App](../../../../../translated_images/ro/03-test-application.471910da12c3038e.webp)

1. Încearcă să pui câteva [întrebări exemplu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Întreabă: ```Care este capitala Franței?``` 
      1. Întreabă: ```Care este cel mai bun cort sub 200$ pentru două persoane și ce caracteristici include?```

1. Ar trebui să primești răspunsuri similare celor afișate mai jos. _Dar cum funcționează asta?_

      ![App](../../../../../translated_images/ro/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validarea Agentului

Azure Container App implementează un endpoint care se conectează la Agentul AI provisionat în proiectul Microsoft Foundry pentru acest șablon. Să vedem ce înseamnă asta.

1. Întoarce-te la pagina _Overview_ a grupului tău de resurse din Azure Portal

1. Dă clic pe resursa `Microsoft Foundry` din acea listă

1. Ar trebui să vezi asta. Dă clic pe butonul `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/ro/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Vei vedea pagina Proiectului Foundry pentru aplicația ta AI
   ![Project](../../../../../translated_images/ro/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Dă clic pe `Agents` - vei vedea Agentul implicit provisionat în proiectul tău
   ![Agents](../../../../../translated_images/ro/06-visit-agents.bccb263f77b00a09.webp)

1. Selectează-l - și vei vedea detalii despre Agent. Ia notă de următoarele:

      - Agentul folosește în mod implicit File Search (mereu)
      - Agentul `Knowledge` indică faptul că are 32 de fișiere încărcate (pentru căutarea în fișiere)
      ![Agents](../../../../../translated_images/ro/07-view-agent-details.0e049f37f61eae62.webp)

1. Caută opțiunea `Data+indexes` în meniul din stânga și dă clic pentru detalii.

      - Ar trebui să vezi cele 32 de fișiere de date încărcate pentru cunoaștere.
      - Acestea vor corespunde celor 12 fișiere de client și 20 fișiere de produs din `src/files`
      ![Data](../../../../../translated_images/ro/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Ai validat funcționarea Agentului!**

1. Răspunsurile agentului sunt fundamentate în cunoștințele din acele fișiere.
1. Acum poți pune întrebări legate de acele date și vei primi răspunsuri fundamentate.
1. Exemplu: `customer_info_10.json` descrie cele 3 achiziții făcute de "Amanda Perez"

Revin-o la fila browserului cu endpoint-ul Container App și întreabă: `Ce produse deține Amanda Perez?`. Ar trebui să vezi ceva asemănător:

![Data](../../../../../translated_images/ro/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Hai să construim puțină intuiție suplimentară pentru capabilitățile Microsoft Foundry, încercând Agentul în Agents Playground.

1. Întoarce-te la pagina `Agents` din Microsoft Foundry - selectează agentul implicit
1. Dă clic pe opțiunea `Try in Playground` - ar trebui să vezi o interfață UI Playground ca aceasta
1. Pune aceeași întrebare: `Ce produse deține Amanda Perez?`

    ![Data](../../../../../translated_images/ro/09-ask-in-playground.a1b93794f78fa676.webp)

Primești același răspuns (sau unul similar) - dar primești și informații suplimentare pe care le poți folosi pentru a înțelege calitatea, costul și performanța aplicației tale agent.

1. Observă că răspunsul citează fișierele de date folosite pentru a "fundamenta" răspunsul
1. Trece cu mouse-ul peste oricare dintre etichetele acestor fișiere - datele corespund cu interogarea și răspunsul afișat?

Totodată vezi un rând _stats_ sub răspuns.

1. Trece cu mouse-ul peste orice metrică - de ex., Safety. Vezi ceva de genul acesta
1. Se potrivește evaluarea cu intuiția ta despre nivelul de siguranță al răspunsului?

      ![Data](../../../../../translated_images/ro/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilitate integrată

Observabilitatea înseamnă instrumentarea aplicației tale pentru a genera date care pot fi folosite pentru a înțelege, depana și optimiza operațiunile acesteia. Pentru a înțelege mai bine acest lucru:

1. Dă clic pe butonul `View Run Info` - ar trebui să vezi această vizualizare. Acesta este un exemplu de [urmărire (tracing) a Agentului](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) în acțiune. _Poți obține această vizualizare și dând clic pe Thread Logs din meniul de sus_.

   - Înțelege pașii de rulare și uneltele implicate de agent
   - Înțelege numărul total de Tokeni (față de utilizarea tokenilor pentru ieșire) pentru răspuns
   - Înțelege latența și unde se petrece timpul în execuție

      ![Agent](../../../../../translated_images/ro/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Dă clic pe fila `Metadata` pentru a vedea atribute suplimentare pentru rulare, care pot oferi context util pentru depanarea ulterioară a problemelor.

      ![Agent](../../../../../translated_images/ro/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Dă clic pe fila `Evaluations` pentru a vedea auto-evaluările făcute asupra răspunsului agentului. Acestea includ evaluări de siguranță (exemplu, Auto-vătămare) și evaluări specifice agentului (exemplu, Rezolvarea intenției, Respectarea sarcinii).

      ![Agent](../../../../../translated_images/ro/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. În final, dă clic pe fila `Monitoring` din meniul lateral.

      - Selectează fila `Resource usage` pe pagina afișată - și vizualizează metricele.
      - Urmărește utilizarea aplicației în termeni de costuri (tokeni) și încărcare (cereri).
      - Urmărește latența aplicației până la primul byte (procesare input) și ultimul byte (output).

      ![Agent](../../../../../translated_images/ro/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variabile de mediu

Până acum, am parcurs implementarea în browser - și am validat că infrastructura este provisionată și aplicația este operațională. Dar ca să lucrăm cu codul aplicației _în primul rând_, trebuie să configurăm mediul nostru local de dezvoltare cu variabilele relevante necesare pentru a lucra cu aceste resurse. Folosirea `azd` face acest lucru ușor.

1. Azure Developer CLI [folosește variabile de mediu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) pentru a stoca și gestiona configurațiile pentru implementările aplicațiilor.

1. Variabilele de mediu sunt stocate în `.azure/<env-name>/.env` - ceea ce le leagă de mediul `env-name` folosit la implementare și te ajută să izolezi mediile între diferitele ținte de implementare în același repo.

1. Variabilele de mediu sunt încărcate automat de comanda `azd` ori de câte ori execută o comandă specifică (exemplu, `azd up`). Atenție că `azd` nu citește automat variabilele de mediu la nivel de OS (de ex., setate în shell) - în schimb folosește `azd set env` și `azd get env` pentru a transfera informații în interiorul scripturilor.


Hai să încercăm câteva comenzi:

1. Obține toate variabilele de mediu setate pentru `azd` în acest mediu:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vei vedea ceva de genul:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Obține o valoare specifică - de ex., vreau să știu dacă am setat valoarea `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vei vedea ceva de genul acesta - nu a fost setată implicit!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Setează o nouă variabilă de mediu pentru `azd`. Aici actualizăm numele modelului agentului. _Notă: orice modificare făcută va fi reflectată imediat în fișierul `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Acum ar trebui să găsim valoarea setată:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Atenție că unele resurse sunt persistente (exemplu, implementări model) și vor necesita mai mult decât un `azd up` pentru a forța reimplementarea. Hai să încercăm să demontăm implementarea originală și să redeployăm cu variabilele de mediu schimbate.

1. **Reîmprospătează** Dacă ai implementat anterior infrastructura folosind un șablon azd - poți _reîmprospăta_ starea variabilelor tale locale de mediu în funcție de starea curentă a implementării Azure folosind această comandă:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Aceasta este o modalitate puternică de a _sincroniza_ variabilele de mediu între două sau mai multe medii locale de dezvoltare (de exemplu, o echipă cu mai mulți dezvoltatori) - permițând infrastructurii implementate să servească drept adevărul de bază pentru starea variabilelor de mediu. Membrii echipei trebuie pur și simplu să _reîmprospăteze_ variabilele pentru a reveni în sincronizare.

---

## 9. Felicitări 🏆

Tocmai ați finalizat un flux de lucru complet în care ați:

- [X] Selectat șablonul AZD pe care doriți să îl utilizați
- [X] Deschis șablonul într-un mediu de dezvoltare suportat
- [X] Implementat șablonul și validat că funcționează

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
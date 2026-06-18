# 2. Validarea unui Șablon

> Validat cu `azd 1.25.6` în iunie 2026.

!!! tip "LA SFÂRȘITUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Analizezi Arhitectura Soluției AI
    - [ ] Înțelegi Fluxul de Lucru de Implementare AZD
    - [ ] Folosești GitHub Copilot pentru ajutor în utilizarea AZD
    - [ ] **Laborator 2:** Implementarea și Validarea șablonului AI Agents

---

## 1. Introducere

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) sau `azd` este un instrument open-source de linie de comandă care simplifică fluxul de lucru al dezvoltatorului atunci când construiești și implementezi aplicații în Azure. 

[Șabloanele AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sunt depozite standardizate care includ cod exemplar pentru aplicații, resurse _infrastructură-ca-sursă_, și fișiere de configurare `azd` pentru o arhitectură coezivă a soluției. Provizionarea infrastructurii devine la fel de simplă precum o comandă `azd provision` – iar folosirea `azd up` îți permite să provizionezi infrastructura **și** să implementezi aplicația într-un singur pas!

Ca rezultat, demararea procesului tău de dezvoltare a aplicației poate fi la fel de simplă ca găsirea șablonului _AZD Starter_ potrivit, care se potrivește cel mai bine nevoilor tale de aplicație și infrastructură – apoi personalizarea depozitului pentru a satisface cerințele scenariului tău.

Înainte de a începe, hai să ne asigurăm că ai instalat Azure Developer CLI.

1. Deschide un terminal VS Code și tastează această comandă:

      ```bash title="" linenums="0"
      azd version
      ```

1. Ar trebui să vezi ceva asemănător cu acesta!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Acum ești gata să selectezi și să implementezi un șablon cu azd**

---

## 2. Selectarea Șablonului

Platforma Microsoft Foundry vine cu un [set recomandat de șabloane AZD](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) care acoperă scenarii populare de soluții precum _automatizarea fluxului multi-agent_ și _procesarea conținutului multimodal_. Poți descoperi aceste șabloane și vizitând portalul Microsoft Foundry.

1. Vizitează [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Autentifică-te în portalul Microsoft Foundry când ți se solicită – vei vedea ceva asemănător.

![Pick](../../../../../translated_images/ro/01-pick-template.60d2d5fff5ebc374.webp)

Opțiunile **Basic** sunt șabloanele tale de start:

1. [ ] [Începe cu AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) care implementează o aplicație de chat de bază _cu datele tale_ în Azure Container Apps. Folosește-l pentru a explora un scenariu de chatbot AI de bază.
1. [X] [Începe cu AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) care implementează și un Agent AI standard (cu Foundry Agents). Folosește-l pentru a te familiariza cu soluțiile AI agentice care includ unelte și modele.

Vizitează al doilea link într-o filă nouă de browser (sau click pe `Open in GitHub` pentru cardul respectiv). Ar trebui să vezi depozitul pentru acest șablon AZD. Ia-ți un moment să explorezi fișierul README. Arhitectura aplicației arată așa:

![Arch](../../../../../translated_images/ro/architecture.8cec470ec15c65c7.webp)

---

## 3. Activarea Șablonului

Hai să încercăm să implementăm acest șablon și să ne asigurăm că este valid. Vom urma indicațiile din secțiunea [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Alege un mediu de lucru pentru depozitul șablonului:

      - **GitHub Codespaces**: Click pe [acest link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) și confirmă `Create codespace`
      - **Clone local sau container dev**: Clonază `Azure-Samples/get-started-with-ai-agents` și deschide-l în VS Code

1. Așteaptă până când terminalul VS Code este gata, apoi tastează următoarea comandă:

   ```bash title="" linenums="0"
   azd up
   ```

Completează pașii din fluxul care vor fi declanșați:

1. Ți se va cere să te autentifici în Azure – urmează instrucțiunile pentru autentificare
1. Introdu un nume unic pentru mediu – de exemplu, eu am folosit `nitya-mshack-azd`
1. Se va crea un folder `.azure/` – vei vedea un subfolder cu numele mediului
1. Ți se va cere să selectezi un nume de abonament – selectează cel implicit
1. Ți se va cere o locație – folosește `East US 2`

Acum, așteaptă finalizarea provizionării. **Aceasta durează 10-15 minute**

1. Când se termină, consola ta va afișa un mesaj de SUCCES ca acesta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portalul tău Azure va avea acum un grup de resurse provizionat cu numele acelui mediu:

      ![Infra](../../../../../translated_images/ro/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Acum ești gata să validezi infrastructura și aplicația implementate**.

---

## 4. Validarea Șablonului

1. Vizitează pagina Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) – autentifică-te dacă ți se solicită
1. Click pe RG pentru numele mediului tău – vei vedea pagina de mai sus

      - dă click pe resursa Azure Container Apps
      - dă click pe Application Url în secțiunea _Essentials_ (sus dreapta)

1. Ar trebui să vezi o interfață front-end a aplicației găzduite asemănătoare cu aceasta:

   ![App](../../../../../translated_images/ro/03-test-application.471910da12c3038e.webp)

1. Încearcă să pui câteva [întrebări exemplu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Întreabă: ```Care este capitala Franței?``` 
      1. Întreabă: ```Care este cel mai bun cort sub 200$ pentru două persoane și ce caracteristici include?```

1. Ar trebui să primești răspunsuri asemănătoare cu cele afișate mai jos. _Dar cum funcționează asta?_ 

      ![App](../../../../../translated_images/ro/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validarea Agentului

Azure Container App implementează un endpoint care se conectează la Agentul AI provisionat în proiectul Microsoft Foundry pentru acest șablon. Să aruncăm o privire asupra a ceea ce înseamnă asta.

1. Revino la pagina _Overview_ din Azure Portal pentru grupul tău de resurse

1. Click pe resursa `Microsoft Foundry` din listă

1. Ar trebui să vezi aceasta. Click pe butonul `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/ro/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Ar trebui să vezi pagina proiectului Foundry pentru aplicația ta AI
   ![Project](../../../../../translated_images/ro/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Click pe `Agents` – vei vedea Agentul implicit provisionat în proiectul tău
   ![Agents](../../../../../translated_images/ro/06-visit-agents.bccb263f77b00a09.webp)

1. Selectează-l – și vei vedea detaliile Agentului. Observă următoarele:

      - Agentul folosește File Search implicit (mereu)
      - `Knowledge` al agentului arată că are 32 fișiere încărcate (pentru căutarea în fișiere)
      ![Agents](../../../../../translated_images/ro/07-view-agent-details.0e049f37f61eae62.webp)

1. Caută opțiunea `Data+indexes` în meniul din stânga și dă click pentru detalii. 

      - Vei vedea cele 32 de fișiere de date încărcate pentru cunoaștere.
      - Acestea corespund celor 12 fișiere pentru clienți și 20 fișiere pentru produse din `src/files` 
      ![Data](../../../../../translated_images/ro/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Ai validat funcționarea Agentului!** 

1. Răspunsurile agentului se bazează pe cunoștințele din acele fișiere. 
1. Acum poți pune întrebări referitoare la acele date și vei primi răspunsuri fondate.
1. Exemplu: `customer_info_10.json` descrie cele 3 achiziții făcute de "Amanda Perez"

Revino la fila browser cu endpoint-ul Container App și întreabă: `Ce produse deține Amanda Perez?`. Ar trebui să vezi ceva asemănător:

![Data](../../../../../translated_images/ro/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Hai să construim puțină intuiție pentru capabilitățile Microsoft Foundry, testând Agentul în Agents Playground. 

1. Revino la pagina `Agents` din Microsoft Foundry – selectează agentul implicit
1. Click pe opțiunea `Try in Playground` – ar trebui să apară o interfață Playground de genul acesta
1. Pune aceeași întrebare: `Ce produse deține Amanda Perez?`

    ![Data](../../../../../translated_images/ro/09-ask-in-playground.a1b93794f78fa676.webp)

Primești același răspuns (sau similar) – dar primești și informații suplimentare pe care le poți folosi pentru a înțelege calitatea, costul și performanța aplicației tale agentice. De exemplu:

1. Observă că răspunsul citează fișiere de date folosite pentru a „ancla” răspunsul
1. Plasează cursorul peste etichetele fișierelor – datele corespund cu întrebarea și răspunsul afișat?

De asemenea, vezi un rând de _statistici_ sub răspuns.

1. Plasează cursorul peste orice metrică – de exemplu, Safety (Siguranță). Vezi ceva similar
1. Evaluarea afișată corespunde intuiției tale privind nivelul de siguranță al răspunsului?

      ![Data](../../../../../translated_images/ro/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilitate Integrată

Observabilitatea înseamnă instrumentarea aplicației tale pentru a genera date care pot fi folosite pentru a înțelege, depana și optimiza operațiunile acesteia. Pentru a înțelege acest aspect:

1. Apasă butonul `View Run Info` – ar trebui să vezi această vizualizare. Acesta este un exemplu de [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) în acțiune. _Poți obține această vizualizare și făcând click pe Thread Logs din meniul principal_.

   - Obține o înțelegere a pașilor de execuție și uneltelor folosite de agent
   - Înțelege numărul total de Tokeni (comparativ cu tokenii folosiți pentru ieșire) în răspuns
   - Înțelege latența și unde se petrece timpul în execuție

      ![Agent](../../../../../translated_images/ro/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Click pe fila `Metadata` pentru a vedea atribute suplimentare ale execuției, care pot oferi context util pentru depanare ulterioară.

      ![Agent](../../../../../translated_images/ro/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Click pe fila `Evaluations` pentru a vedea autoevaluările făcute pe răspunsul agentului. Acestea includ evaluări de siguranță (de ex., Auto-vătămare) și evaluări specifice agentului (de ex., Rezolvarea intenției, Respectarea sarcinii).

      ![Agent](../../../../../translated_images/ro/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Ultimul, dar nu cel din urmă, fă click pe fila `Monitoring` în meniul sidebar.

      - Selectează fila `Resource usage` în pagina afișată – și vizualizează metricile.
      - Urmărește utilizarea aplicației în termeni de costuri (tokeni) și încărcare (cereri).
      - Monitorizează latența aplicației până la primul byte (procesare input) și ultimul byte (output).

      ![Agent](../../../../../translated_images/ro/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variabile de Mediu

Până acum, am parcurs implementarea în browser – și am validat că infrastructura noastră este provisionată și aplicația este operațională. Dar pentru a lucra cu aplicația _din cod în primul rând_, trebuie să configurăm mediul nostru de dezvoltare local cu variabilele relevante necesare pentru a lucra cu aceste resurse. Folosirea `azd` face acest lucru simplu.

1. Azure Developer CLI [folosește variabile de mediu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) pentru a stoca și gestiona setările de configurare pentru implementările aplicațiilor.

1. Variabilele de mediu sunt stocate în `.azure/<env-name>/.env` – ceea ce le limitează la mediul `env-name` folosit la implementare și te ajută să izolezi mediile între diferitele ținte de implementare în același depozit.

1. Variabilele de mediu sunt încărcate automat de comanda `azd` ori de câte ori execută o comandă specifică (ex: `azd up`). Ține cont că `azd` nu citește automat variabilele de mediu la nivel de OS (ex: setate în shell) – în schimb folosește `azd set env` și `azd get env` pentru a transfera informații în scripturi.


Hai să încercăm câteva comenzi:

1. Afișează toate variabilele de mediu setate pentru `azd` în acest mediu:

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

1. Afișează o valoare specifică – de exemplu, vreau să știu dacă a fost setată valoarea `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vei vedea ceva asemănător – nu a fost setată implicit!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Setează o variabilă de mediu nouă pentru `azd`. Aici, actualizăm numele modelului agentului. _Notă: orice modificări vor fi reflectate imediat în fișierul `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Acum ar trebui să vedem valoarea setată:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Unele resurse sunt persistente (ex: implementările modelului) și vor necesita mai mult decât un simplu `azd up` pentru reimplementare forțată. Hai să încercăm să demontăm implementarea originală și să redeployăm cu variabilele de mediu schimbate.

1. **Actualizează** Dacă ai implementat anterior infrastructură folosind un șablon azd – poți _actualiza_ starea variabilelor locale de mediu bazate pe starea curentă din implementarea Azure folosind această comandă:

      ```bash title="" linenums="0"
      azd env refresh
      ```

Aceasta este o modalitate puternică de a _sincroniza_ variabilele de mediu între două sau mai multe medii locale de dezvoltare (de ex., o echipă cu mai mulți dezvoltatori) - permițând infrastructurii implementate să servească drept adevărul fundamental pentru starea variabilelor de mediu. Membrii echipei trebuie pur și simplu să _reîmprospăteze_ variabilele pentru a reveni la sincronizare.

---

## 9. Felicitări 🏆

Tocmai ai finalizat un flux de lucru complet în care ai:

- [X] Selectat șablonul AZD pe care dorești să îl folosești
- [X] Deschis șablonul într-un mediu de dezvoltare suportat
- [X] Implementat șablonul și validat că funcționează

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
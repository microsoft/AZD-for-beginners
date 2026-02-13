# 2. Validarea unui șablon

!!! tip "LA FINALUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Analizezi arhitectura soluției AI
    - [ ] Înțelegi fluxul de lucru pentru implementarea AZD
    - [ ] Folosești GitHub Copilot pentru a obține ajutor privind utilizarea AZD
    - [ ] **Laborator 2:** Implementarea și validarea șablonului AI Agents

---


## 1. Introducere

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) sau `azd` este un instrument open-source de linie de comandă care simplifică fluxul de lucru al dezvoltatorului în construirea și implementarea aplicațiilor în Azure.

[Șabloanele AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sunt depozite standardizate care includ cod exemplu pentru aplicații, resurse _infrastructură-ca-scris_ și fișiere de configurare `azd` pentru o arhitectură soluțională coerentă. Furnizarea infrastructurii devine la fel de simplă ca o comandă `azd provision` – în timp ce utilizarea comenzii `azd up` îți permite să furnizezi infrastructura **și** să implementezi aplicația dintr-o singură lovitură!

Ca urmare, putem începe procesul de dezvoltare a aplicației pur și simplu găsind șablonul potrivit _AZD Starter_ care să corespundă nevoilor tale de aplicație și infrastructură – apoi personalizând depozitul pentru a se potrivi cerințelor scenariului tău.

Înainte de a începe, să ne asigurăm că ai instalat Azure Developer CLI.

1. Deschide un terminal VS Code și tastează această comandă:

      ```bash title="" linenums="0"
      azd version
      ```

1. Ar trebui să vezi ceva similar cu acesta!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Acum ești gata să selectezi și să implementezi un șablon cu azd**

---

## 2. Selectarea șablonului

Platforma Microsoft Foundry vine cu un [set de șabloane AZD recomandate](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) care acoperă scenarii populare de soluții, cum ar fi _automatizarea fluxului de lucru multi-agent_ și _procesarea conținutului multimodal_. De asemenea, poți descoperi aceste șabloane vizitând portalul Microsoft Foundry.

1. Vizitează [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Autentifică-te în portalul Microsoft Foundry când ești solicitat – vei vedea ceva asemănător cu acesta.

![Pick](../../../../../translated_images/ro/01-pick-template.60d2d5fff5ebc374.webp)


Opțiunile **Basic** sunt șabloanele tale de pornire:

1. [ ] [Începe cu AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) care implementează o aplicație de chat de bază _cu datele tale_ pe Azure Container Apps. Folosește-l pentru a explora un scenariu simplu de chatbot AI.
1. [X] [Începe cu AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) care implementează de asemenea un agent AI standard (cu Foundry Agents). Folosește-l pentru a te familiariza cu soluțiile AI agentice implicând unelte și modele.

Vizitează al doilea link într-un tab nou al browser-ului (sau fă click pe `Open in GitHub` pe cardul asociat). Ar trebui să vezi depozitul pentru acest șablon AZD. Ia-ți un minut să explorezi README-ul. Arhitectura aplicației arată astfel:

![Arch](../../../../../translated_images/ro/architecture.8cec470ec15c65c7.webp)

---

## 3. Activarea șablonului

Să încercăm să implementăm acest șablon și să ne asigurăm că este valid. Vom urma indicațiile din secțiunea [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Apasă pe [acest link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirmă acțiunea implicită de `Create codespace`
1. Se deschide un tab nou în browser – așteaptă până sesiunea GitHub Codespaces se încarcă complet
1. Deschide terminalul VS Code în Codespaces - tastează comanda următoare:

   ```bash title="" linenums="0"
   azd up
   ```

Completează pașii fluxului de lucru pe care îi va declanșa această comandă:

1. Vei fi solicitat să te autentifici în Azure – urmează instrucțiunile pentru autentificare
1. Introdu un nume unic pentru mediu – de ex., eu am folosit `nitya-mshack-azd`
1. Aceasta va crea un folder `.azure/` - vei vedea un subfolder cu numele mediului
1. Vei fi solicitat să selectezi un abonament – selectează cel implicit
1. Vei fi solicitat să alegi o locație – folosește `East US 2`

Acum, așteaptă finalizarea procesului de furnizare. **Acest lucru durează 10-15 minute**

1. Când este gata, consola ta va afișa un mesaj de SUCCES asemănător cu acesta:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portalul tău Azure va avea acum un grup de resurse provisionat cu numele mediului:

      ![Infra](../../../../../translated_images/ro/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Acum ești gata să validezi infrastructura și aplicația implementată**.

---

## 4. Validarea șablonului

1. Vizitează pagina Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) – autentifică-te dacă ești solicitat
1. Dă click pe RG-ul pentru numele mediului tău – vei vedea pagina de mai sus

      - fă click pe resursa Azure Container Apps
      - fă click pe URL-ul aplicației în secțiunea _Essentials_ (sus-dreapta)

1. Ar trebui să vezi o interfață front-end găzduită a aplicației, așa:

   ![App](../../../../../translated_images/ro/03-test-application.471910da12c3038e.webp)

1. Încearcă să pui câteva [întrebări exemplu](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Întreabă: ```Care este capitala Franței?``` 
      1. Întreabă: ```Care este cel mai bun cort sub 200$ pentru două persoane și ce caracteristici include?```

1. Ar trebui să primești răspunsuri similare cu cele afișate mai jos. _Dar cum funcționează asta?_

      ![App](../../../../../translated_images/ro/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validarea Agentului

Azure Container App implementează un endpoint care se conectează la agentul AI provisionat în proiectul Microsoft Foundry pentru acest șablon. Să aruncăm o privire ce înseamnă asta.

1. Revenind la pagina de _Overview_ din Azure Portal pentru grupul tău de resurse

1. Fă click pe resursa `Microsoft Foundry` din acea listă

1. Ar trebui să vezi asta. Apasă pe butonul `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/ro/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Vei vedea pagina Proiectului Foundry pentru aplicația ta AI
   ![Project](../../../../../translated_images/ro/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Apasă pe `Agents` – vei vedea Agentul implicit provisionat în proiectul tău
   ![Agents](../../../../../translated_images/ro/06-visit-agents.bccb263f77b00a09.webp)

1. Selectează-l – și vei vedea detalii despre Agent. Observă următoarele:

      - Agentul folosește File Search implicit (mereu)
      - Câmpul `Knowledge` al agentului indică că a încărcat 32 de fișiere (pentru căutarea în fișiere)
      ![Agents](../../../../../translated_images/ro/07-view-agent-details.0e049f37f61eae62.webp)

1. Caută opțiunea `Data+indexes` în meniul din stânga și fă click pentru detalii.

      - Vei vedea cele 32 de fișiere încărcate pentru cunoaștere.
      - Acestea corespund celor 12 fișiere clienți și 20 fișiere produse din `src/files` 
      ![Data](../../../../../translated_images/ro/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Ai validat funcționarea Agentului!**

1. Răspunsurile agentului se bazează pe cunoștințele din acele fișiere.
1. Acum poți pune întrebări legate de acele date și primi răspunsuri fundamentate.
1. Exemplu: `customer_info_10.json` descrie cele 3 achiziții făcute de "Amanda Perez"

Revină la tabul browser-ului cu endpoint-ul Container App și întreabă: `Ce produse deține Amanda Perez?`. Ar trebui să vezi ceva asemănător cu asta:

![Data](../../../../../translated_images/ro/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Hai să acumulăm mai multă intuiție despre capabilitățile Microsoft Foundry, testând agentul în Agents Playground.

1. Revino la pagina `Agents` din Microsoft Foundry – selectează agentul implicit
1. Apasă opțiunea `Try in Playground` – vei vedea o interfață Playground ca aceasta
1. Pune aceeași întrebare: `Ce produse deține Amanda Perez?`

    ![Data](../../../../../translated_images/ro/09-ask-in-playground.a1b93794f78fa676.webp)

Primești același (sau similar) răspuns – dar mai primești și informații suplimentare pe care le poți folosi să înțelegi calitatea, costul și performanța aplicației agentice. De exemplu:

1. Observă că răspunsul citează fișierele de date folosite pentru „fundamentarea” răspunsului
1. Plasează cursorul peste oricare din aceste etichete de fișiere – datele corespund cu întrebarea și răspunsul afișat?

Vezi de asemenea un rând cu _statistici_ sub răspuns.

1. Plasează cursorul peste oricare metrică – de ex., Safety (Siguranță). Vezi ceva de genul acesta
1. Colectarea ratingului evaluat corespunde intuiției tale despre nivelul de siguranță al răspunsului?

      ![Data](../../../../../translated_images/ro/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Capacități încorporate de observabilitate

Observabilitatea înseamnă instrumentarea aplicației pentru a genera date care pot fi folosite pentru a înțelege, depana și optimiza operațiunile acesteia. Pentru a avea o senzație despre asta:

1. Apasă butonul `View Run Info` – vei vedea această afișare. Acesta este un exemplu de [tracing al agentului](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) în acțiune. _Poți obține și această vedere făcând click pe Thread Logs din meniul superior_.

   - Ia în vedere pașii de execuție și uneltele folosite de agent
   - Înțelege numărul total de Tokeni (vs. tokenii folosiți pentru output) pentru răspuns
   - Înțelege latența și unde se consumă timpul în execuție

      ![Agent](../../../../../translated_images/ro/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Apasă fila `Metadata` pentru a vedea atribute suplimentare pentru rulare, care pot oferi context util pentru depanarea problemelor ulterior.

      ![Agent](../../../../../translated_images/ro/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Apasă fila `Evaluations` pentru a vedea auto-evaluările făcute asupra răspunsului agentului. Acestea includ evaluări de siguranță (de ex., auto-vătămare) și evaluări specifice agentului (ex., rezolvarea intenției, respectarea sarcinii).

      ![Agent](../../../../../translated_images/ro/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Ultimul, dar nu cel din urmă, apasă fila `Monitoring` din meniul lateral.

      - Selectează fila `Resource usage` în pagina afișată – și vezi metricile.
      - Monitorizează utilizarea aplicației în termeni de costuri (tokeni) și încărcare (cereri).
      - Monitorizează latența aplicației până la primul byte (procesare intrare) și ultimul byte (output).

      ![Agent](../../../../../translated_images/ro/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variabile de mediu

Până acum, am parcurs implementarea în browser – și am validat că infrastructura este provisionată și aplicația funcționează. Dar pentru a lucra cu codul aplicației _first-code_, trebuie să configurăm mediul nostru local de dezvoltare cu variabilele relevante necesare pentru a lucra cu aceste resurse. Folosind `azd` acest lucru devine ușor.

1. Azure Developer CLI [folosește variabile de mediu](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) pentru a stoca și gestiona setările de configurare pentru implementările aplicației.

1. Variabilele de mediu sunt stocate în `.azure/<env-name>/.env` – aceasta le limitează la mediul `env-name` folosit în timpul implementării și te ajută să izolezi mediile între țintele diferite de implementare în același repo.

1. Variabilele de mediu sunt încărcate automat de comanda `azd` ori de câte ori execută o comandă specifică (de ex., `azd up`). Observă că `azd` nu citește automat variabile de mediu la nivel de OS (ex., setate în shell) – în schimb folosește `azd set env` și `azd get env` pentru a transfera informații în cadrul scripturilor.


Hai să încercăm câteva comenzi:

1. Obține toate variabilele de mediu setate pentru `azd` în acest mediu:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vei vedea ceva de genul:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Obține o valoare specifică – de ex., vreau să știu dacă am setat valoarea `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vei vedea ceva asemănător – nu a fost setată implicit!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Setează o variabilă nouă de mediu pentru `azd`. Aici, actualizăm numele modelului agentului. _Notă: orice modificare făcută se va reflecta imediat în fișierul `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Acum, ar trebui ca valoarea să fie setată:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Observă că unele resurse sunt persistente (ex., implementările de modele) și vor necesita mai mult decât un simplu `azd up` pentru a forța reimplementarea. Hai să încercăm să dezinstalăm implementarea inițială și să o reimplementăm cu variabile modificate de mediu.

1. **Reîmprospătare** Dacă ai implementat anterior infrastructura folosind un șablon azd – poți _reîmprospăta_ starea variabilelor locale de mediu bazată pe starea curentă a implementării Azure folosind această comandă:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Aceasta este o modalitate puternică de a _sincroniza_ variabilele de mediu între două sau mai multe medii locale de dezvoltare (de exemplu, o echipă cu mai mulți dezvoltatori) - permițând infrastructurii implementate să servească drept adevărul de bază pentru starea variabilelor de mediu. Membrii echipei pur și simplu _reîmprospătează_ variabilele pentru a reveni la sincronizare.

---

## 9. Felicitări 🏆

Ai finalizat un flux de lucru complet în care ai:

- [X] Selectat șablonul AZD pe care dorești să îl utilizezi
- [X] Lansat șablonul cu GitHub Codespaces
- [X] Implementat șablonul și validat că funcționează

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventuale neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
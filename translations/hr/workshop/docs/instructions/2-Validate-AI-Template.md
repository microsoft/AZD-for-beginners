# 2. Validacija predloška

> Validirano prema `azd 1.23.12` u ožujku 2026.

!!! tip "NA KRAJU OVOG MODULA ĆETE MOĆI"

    - [ ] Analizirati AI arhitekturu rješenja
    - [ ] Razumjeti tijek rada implementacije AZD-a
    - [ ] Koristiti GitHub Copilot za pomoć u korištenju AZD-a
    - [ ] **Laboratorij 2:** Implementirati i validirati predložak AI agenata

---


## 1. Uvod

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ili `azd` je alat otvorenog koda za naredbeni redak koji pojednostavljuje radni tijek developera prilikom izrade i implementacije aplikacija u Azure. 

[AZD predlošci](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) su standardizirani repozitoriji koji uključuju uzorke koda aplikacije, _infrastrukturu kao kod_ (IaC) resurse i konfiguracijske datoteke za `azd` za koherentnu arhitekturu rješenja. Provisioniranje infrastrukture postaje jednostavno kao naredba `azd provision` – dok korištenje `azd up` omogućava da se infrastruktura **i** aplikacija implementiraju u jednom koraku!

Kao rezultat, početak razvoja vaše aplikacije može biti jednostavan poput pronalaska odgovarajućeg _AZD Starter predloška_ koji najviše odgovara vašim potrebama aplikacije i infrastrukture – zatim prilagodite repozitorij za vaše zahtjeve scenarija.

Prije nego počnemo, provjerimo imate li instaliran Azure Developer CLI.

1. Otvorite VS Code terminal i upišite ovu naredbu:

      ```bash title="" linenums="0"
      azd version
      ```

1. Trebali biste vidjeti nešto slično ovome!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Sada ste spremni odabrati i implementirati predložak uz azd**

---

## 2. Odabir predloška

Microsoft Foundry platforma dolazi sa [skupom preporučenih AZD predložaka](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) koji pokrivaju popularne scenarije rješenja poput _automatizacije višestrukih agenata u tijeku rada_ i _višestruke modalnosti obrade sadržaja_. Ove predloške također možete pronaći posjetom Microsoft Foundry portalu.

1. Posjetite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Prijavite se u Microsoft Foundry portal kada vam se zatraži – vidjet ćete nešto ovako.

![Pick](../../../../../translated_images/hr/01-pick-template.60d2d5fff5ebc374.webp)


**Osnovne** opcije su vaši početni predlošci:

1. [ ] [Početak rada s AI chatom](https://github.com/Azure-Samples/get-started-with-ai-chat) koji implementira osnovnu chat aplikaciju _s vašim podacima_ u Azure Container Apps. Koristite ovo za istraživanje osnovnog AI chatbot scenarija.
1. [X] [Početak rada s AI agentima](https://github.com/Azure-Samples/get-started-with-ai-agents) koji također implementira standardnog AI agenta (s Foundry agentima). Koristite ovo za upoznavanje s agentnim AI rješenjima koja uključuju alate i modele.

Posjetite drugu poveznicu u novoj kartici preglednika (ili kliknite `Open in GitHub` za povezanu karticu). Trebali biste vidjeti repozitorij za ovaj AZD predložak. Odvojite minutu da proučite README. Arhitektura aplikacije izgleda ovako:

![Arch](../../../../../translated_images/hr/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivacija predloška

Pokušajmo implementirati ovaj predložak i uvjeriti se da je valjan. Slijediti ćemo upute u odjeljku [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Odaberite radno okruženje za repozitorij predloška:

      - **GitHub Codespaces**: Kliknite [ovu poveznicu](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) i potvrdite `Create codespace`
      - **Lokalna kloniranja ili dev container**: Klonirajte `Azure-Samples/get-started-with-ai-agents` i otvorite ga u VS Code

1. Pričekajte dok terminal u VS Code ne bude spreman, zatim upišite sljedeću naredbu:

   ```bash title="" linenums="0"
   azd up
   ```

Dovršite korake radnog tijeka koje će ovo pokrenuti:

1. Bit ćete upitani da se prijavite u Azure – slijedite upute za autentifikaciju
1. Unesite jedinstveno ime okruženja za sebe – npr., ja sam koristio `nitya-mshack-azd`
1. Ovo će kreirati mapu `.azure/` – vidjet ćete podmapu s imenom okruženja
1. Bit ćete upitani za odabir imena pretplate – odaberite zadanu
1. Bit ćete upitani za lokaciju – koristite `East US 2`

Sada pričekajte dovršetak provisioniranja. **Ovo traje 10-15 minuta**

1. Kada završi, vaš konzola će pokazati PORUKU O USPJEHU ovako:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Vaš Azure Portal sada će imati provisioniranu grupu resursa s tim imenom okruženja:

      ![Infra](../../../../../translated_images/hr/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sada ste spremni validirati implementiranu infrastrukturu i aplikaciju**.

---

## 4. Validacija predloška

1. Posjetite Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) stranicu – prijavite se kada vam se zatraži
1. Kliknite na RG za ime vašeg okruženja – vidjet ćete gore navedenu stranicu

      - kliknite na Azure Container Apps resurs
      - kliknite na Application Url u odjeljku _Essentials_ (gore desno)

1. Trebali biste vidjeti korisničko sučelje hostirane aplikacije ovako:

   ![App](../../../../../translated_images/hr/03-test-application.471910da12c3038e.webp)

1. Pokušajte postaviti par [primjera pitanja](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pitajte: ```Koji je glavni grad Francuske?``` 
      1. Pitajte: ```Koji je najbolji šator ispod 200$ za dvoje ljudi, i koje značajke uključuje?```

1. Trebali biste dobiti odgovore slične prikazanima dolje. _Ali kako ovo funkcionira?_ 

      ![App](../../../../../translated_images/hr/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validacija agenta

Azure Container App implementira endpoint koji se povezuje s AI agentom koji je provisioniran u Microsoft Foundry projektu za ovaj predložak. Pogledajmo što to znači.

1. Vratite se na Azure Portal stranicu _Overview_ za vašu grupu resursa

1. Kliknite na `Microsoft Foundry` resurs u tom popisu

1. Trebali biste vidjeti ovo. Kliknite gumb `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/hr/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Trebali biste vidjeti stranicu Foundry projekta za vašu AI aplikaciju
   ![Project](../../../../../translated_images/hr/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknite na `Agents` – vidjet ćete zadani agent provisioniran u vašem projektu
   ![Agents](../../../../../translated_images/hr/06-visit-agents.bccb263f77b00a09.webp)

1. Odaberite ga – i vidjet ćete detalje o agentu. Obratite pažnju na sljedeće:

      - Agent koristi pretraživanje datoteka prema zadanim postavkama (uvijek)
      - Agentova `Knowledge` pokazuje da ima 32 datoteke poslane (za pretraživanje datoteka)
      ![Agents](../../../../../translated_images/hr/07-view-agent-details.0e049f37f61eae62.webp)

1. Potražite opciju `Data+indexes` u lijevom izborniku i kliknite za detalje.

      - Trebali biste vidjeti 32 podatkovne datoteke poslane za znanje.
      - One će odgovarati 12 korisničkih datoteka i 20 datoteka proizvoda pod `src/files`
      ![Data](../../../../../translated_images/hr/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Validirali ste rad Agenta!**

1. Odgovori agenta temelje se na znanju u tim datotekama.
1. Sada možete postavljati pitanja vezana uz te podatke i dobivati utemeljene odgovore.
1. Primjer: `customer_info_10.json` opisuje 3 kupnje koje je napravila "Amanda Perez"

Vratite se na karticu preglednika s Container App endpointom i pitajte: `Koje proizvode Amanda Perez posjeduje?`. Trebali biste vidjeti nešto ovako:

![Data](../../../../../translated_images/hr/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Igralište za agente

Izgradimo malo veći uvid u mogućnosti Microsoft Foundry-ja, provođenjem Agenta u Agents Playgroundu.

1. Vratite se na stranicu `Agents` u Microsoft Foundry - odaberite zadani agent
1. Kliknite opciju `Try in Playground` - trebali biste dobiti korisničko sučelje Playgrounda ovako
1. Postavite isto pitanje: `Koje proizvode Amanda Perez posjeduje?`

    ![Data](../../../../../translated_images/hr/09-ask-in-playground.a1b93794f78fa676.webp)

Dobit ćete isti (ili sličan) odgovor – ali također dobijate dodatne informacije koje možete koristiti za razumijevanje kvalitete, troškova i performansi vaše agentne aplikacije. Na primjer:

1. Primijetite da odgovor navodi podatkovne datoteke korištene za "utemeljenje" odgovora
1. Zadržite pokazivač miša iznad bilo koje ove oznake datoteke – odgovaraju li podaci vašem upitu i prikazanom odgovoru?

Također vidite redak sa _statistikama_ ispod odgovora.

1. Zadržite pokazivač iznad bilo koje metrike – npr., Safety. Vidite nešto poput ovoga
1. Odgovara li ocjena koju vidite vašem doživljaju sigurnosne razine odgovora?

      ![Data](../../../../../translated_images/hr/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Ugrađena promatranost

Promatranost se odnosi na instrumentiranje vaše aplikacije za generiranje podataka koji se mogu koristiti za razumijevanje, otklanjanje pogrešaka i optimizaciju njenih operacija. Da biste osjetili ovo:

1. Kliknite gumb `View Run Info` – vidjet ćete ovaj pogled. Ovo je primjer [praćenja agenta](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) u akciji. _Taj pogled možete dobiti i klikom na Thread Logs u glavnom izborniku_.

   - Dobijte uvid u korake izvođenja i alate koje agent koristi
   - Razumite ukupni broj Tokena (u odnosu na korištenje output tokena) za odgovor
   - Razumite latenciju i gdje se vrijeme provodi u izvođenju

      ![Agent](../../../../../translated_images/hr/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknite na karticu `Metadata` za dodatne atribute izvođenja, koji mogu biti korisni za otklanjanje problema kasnije.

      ![Agent](../../../../../translated_images/hr/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknite karticu `Evaluations` za automatske procjene odgovora agenta. One uključuju procjene sigurnosti (npr., samoozljeđivanje) i specifične ocjene za agente (npr. razrješenje namjere, pridržavanje zadatka).

      ![Agent](../../../../../translated_images/hr/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Na kraju, kliknite karticu `Monitoring` u izborniku sa strane.

      - Odaberite karticu `Resource usage` u prikazanoj stranici – i pogledajte metrike.
      - Pratite korištenje aplikacije u smislu troškova (tokena) i opterećenja (zahtjeva).
      - Pratite latenciju aplikacije do prvog i posljednjeg bajta (obrada ulaza i izlaza).

      ![Agent](../../../../../translated_images/hr/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Varijable okruženja

Dosad smo prošli implementaciju u pregledniku i validirali da je naša infrastruktura provisionirana i aplikacija operativna. Ali da bismo radili s aplikacijskim _kodom prvo_, trebamo konfigurirati lokalno razvojno okruženje odgovarajućim varijablama potrebnim za rad s tim resursima. Korištenjem `azd` to je jednostavno.

1. Azure Developer CLI [koristi varijable okruženja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) za pohranu i upravljanje konfiguracijskim postavkama za implementacije aplikacija.

1. Varijable okruženja pohranjuju se u `.azure/<env-name>/.env` – to ih ograničava na okruženje `env-name` korišteno tijekom implementacije i pomaže u izolaciji okruženja između različitih ciljeva implementacije u istom repozitoriju.

1. Varijable okruženja automatski učitava naredba `azd` kad god izvrši određenu naredbu (npr., `azd up`). Imajte na umu da `azd` ne čita automatski _varijable okruženja na razini OS-a_ (npr., postavljene u shellu) – umjesto toga koristite `azd set env` i `azd get env` za prijenos informacija unutar skripti.

Isprobajmo nekoliko naredbi:

1. Dohvatite sve varijable okruženja postavljene za `azd` u ovom okruženju:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vidjet ćete nešto slično:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Dohvatite specifičnu vrijednost – npr., želim znati je li postavljena vrijednost `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vidjet ćete nešto ovako – nije bila postavljena zadano!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Postavite novu varijablu okruženja za `azd`. Ovdje ažuriramo ime modela agenta. _Napomena: sve promjene odmah će se odraziti u datoteci `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sada bismo trebali vidjeti da je vrijednost postavljena:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Imajte na umu da su neki resursi trajni (npr., implementacije modela) i zahtijevat će više od samo `azd up` za prisilnu ponovnu implementaciju. Pokušajmo raskinuti izvornu implementaciju i ponovno je implementirati s promijenjenim varijablama okruženja.

1. **Osvježavanje** Ako ste prethodno implementirali infrastrukturu koristeći azd predložak – možete _osvježiti_ stanje svojih lokalnih varijabli okruženja na temelju trenutnog stanja vaše Azure implementacije koristeći ovu naredbu:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ovo je moćan način za _sinkronizaciju_ varijabli okoline preko dva ili više lokalnih razvojnih okruženja (npr., tim s više programera) - omogućujući raspoređenoj infrastrukturi da služi kao konačna verzija stanja varijabli okoline. Članovi tima jednostavno _osvježavaju_ varijable kako bi se ponovno uskladili.

---

## 9. Čestitamo 🏆

Upravo ste dovršili radni tijek od početka do kraja u kojem ste:

- [X] Odabrali AZD predložak koji želite koristiti
- [X] Otvorili predložak u podržanom razvojnom okruženju
- [X] Rasporedili predložak i potvrdili da radi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj je dokument preveden pomoću AI usluge prevođenja [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, molimo imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 2. Validacija predloška

> Validirano prema `azd 1.25.6` u lipnju 2026.

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Analizirati arhitekturu AI rješenja
    - [ ] Razumjeti tijek postavljanja s AZD-om
    - [ ] Koristiti GitHub Copilot za pomoć u korištenju AZD-a
    - [ ] **Laboratorij 2:** Postaviti i validirati predložak AI agenata

---


## 1. Uvod

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ili `azd` je alat otvorenog koda za naredbeni redak koji pojednostavljuje radni proces programera prilikom izrade i postavljanja aplikacija na Azure.

[AZD predlošci](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) su standardizirani repozitoriji koji uključuju primjer koda aplikacije, _infrastrukturu kao kod_ resurse i konfiguracijske datoteke `azd` za koherentnu arhitekturu rješenja. Postavljanje infrastrukture postaje jednostavno kao naredba `azd provision` – dok korištenje `azd up` omogućuje postavljanje infrastrukture **i** implementaciju aplikacije u jednom potezu!

Posljedično, započinjanje procesa razvoja vaše aplikacije može biti jednostavno kao pronalaženje pravog _AZD Starter predloška_ koji najviše odgovara vašim potrebama za aplikaciju i infrastrukturom – a zatim prilagodba repozitorija za vaše zahtjeve scenarija.

Prije nego počnemo, provjerimo imate li instaliran Azure Developer CLI.

1. Otvorite terminal u VS Code i upišite ovu naredbu:

      ```bash title="" linenums="0"
      azd version
      ```

1. Trebali biste vidjeti nešto ovako!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Sada ste spremni odabrati i postaviti predložak s azd**

---

## 2. Odabir predloška

Microsoft Foundry platforma dolazi s [setom preporučenih AZD predložaka](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) koji pokrivaju popularne scenarije rješenja poput _automatizacije višestrukih agenata_ i _višemodalne obrade sadržaja_. Također možete pronaći te predloške posjetom Microsoft Foundry portalu.

1. Posjetite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Prijavite se na Microsoft Foundry portal kada se to zatraži – vidjet ćete nešto ovako.

![Pick](../../../../../translated_images/hr/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** opcije su vaši početni predlošci:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) koji postavlja osnovnu chat aplikaciju _s vašim podacima_ na Azure Container Apps. Koristite ovo za istraživanje osnovnog AI chatbota.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) koji također postavlja standardnog AI agenta (s Foundry agentima). Koristite ovo da se upoznate s agentnim AI rješenjima koja uključuju alate i modele.

Posjetite drugu poveznicu u novoj kartici preglednika (ili kliknite `Open in GitHub` za odgovarajuću karticu). Trebali biste vidjeti repozitorij ovog AZD predloška. Odvojite minutu za proučavanje README datoteke. Arhitektura aplikacije izgleda ovako:

![Arch](../../../../../translated_images/hr/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivacija predloška

Pokušajmo postaviti ovaj predložak i uvjerimo se da je valjan. Slijedit ćemo smjernice u odjeljku [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Odaberite radno okruženje za repozitorij predloška:

      - **GitHub Codespaces**: Kliknite [ovaj link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) i potvrdite `Create codespace`
      - **Lokalni klon ili razvojni kontejner**: Klonirajte `Azure-Samples/get-started-with-ai-agents` i otvorite u VS Code

1. Pričekajte dok terminal u VS Code ne bude spreman, zatim upišite sljedeću naredbu:

   ```bash title="" linenums="0"
   azd up
   ```

Dovršite korake tijeka rada koje će ovo pokrenuti:

1. Zatražit će vam se prijava u Azure – slijedite upute za autentifikaciju
1. Unesite jedinstveni naziv okruženja za sebe – npr., koristio sam `nitya-mshack-azd`
1. Ovo će stvoriti mapu `.azure/` – vidjet ćete podmapu s imenom okruženja
1. Zatražit će vam se odabir naziva pretplate – odaberite zadanu
1. Zatražit će vam se lokacija – koristite `East US 2`

Sada pričekajte da se postavljanje završi. **Ovo traje 10-15 minuta**

1. Kada završi, vaš konzola prikazat će PORUKU O USPJEHU poput ove:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Vaš Azure portal sada će imati postavljenu grupu resursa s tim imenom okruženja:

      ![Infra](../../../../../translated_images/hr/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sada ste spremni validirati postavljenu infrastrukturu i aplikaciju**.

---

## 4. Validacija predloška

1. Posjetite stranicu Azure Portala [Resource Groups](https://portal.azure.com/#browse/resourcegroups) – prijavite se ako se zatraži
1. Kliknite na RG za ime vašeg okruženja – vidjet ćete gore prikazanu stranicu

      - kliknite na Azure Container Apps resurs
      - kliknite na Application Url u odjeljku _Essentials_ (gore desno)

1. Trebali biste vidjeti korisničko sučelje front-enda hostane aplikacije poput ovog:

   ![App](../../../../../translated_images/hr/03-test-application.471910da12c3038e.webp)

1. Isprobajte nekoliko [primjera pitanja](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pitajte: ```What is the capital of France?``` 
      1. Pitajte: ```What's the best tent under $200 for two people, and what features does it include?```

1. Trebali biste dobiti odgovore slične prikazanim u nastavku. _Ali kako to funkcionira?_ 

      ![App](../../../../../translated_images/hr/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validacija agenta

Azure Container App postavlja endpoint koji se povezuje s AI Agentom postavljenim u Microsoft Foundry projektu za ovaj predložak. Pogledajmo što to znači.

1. Vratite se na Azure Portal _Overview_ stranicu za vašu grupu resursa

1. Kliknite na `Microsoft Foundry` resurs na popisu

1. Trebali biste vidjeti ovo. Kliknite gumb `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/hr/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Vidjet ćete stranicu Foundry projekta za vašu AI aplikaciju
   ![Project](../../../../../translated_images/hr/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknite `Agents` – vidite zadanog agenta postavljenog u vašem projektu
   ![Agents](../../../../../translated_images/hr/06-visit-agents.bccb263f77b00a09.webp)

1. Odaberite ga – vidjet ćete detalje o agentu. Obratite pažnju na sljedeće:

      - Agent po zadanom koristi pretraživanje datoteka (uvijek)
      - Polje `Knowledge` pokazuje da je preneseno 32 datoteke (za pretraživanje datoteka)
      ![Agents](../../../../../translated_images/hr/07-view-agent-details.0e049f37f61eae62.webp)

1. U lijevom izborniku potražite opciju `Data+indexes` i kliknite za detalje. 

      - Trebali biste vidjeti 32 datoteke podataka prenesene za znanje.
      - One odgovaraju 12 korisničkih datoteka i 20 datoteka proizvoda u `src/files`
      ![Data](../../../../../translated_images/hr/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Potvrdili ste rad agenta!** 

1. Odgovori agenta temelje se na znanju iz tih datoteka. 
1. Sada možete postavljati pitanja vezana uz te podatke i dobivati utemeljene odgovore.
1. Na primjer: `customer_info_10.json` opisuje 3 kupnje koje je napravila "Amanda Perez".

Vrati se na tab preglednika s Container App endpointom i pitaj: `What products does Amanda Perez own?`. Trebali biste vidjeti nešto ovako:

![Data](../../../../../translated_images/hr/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Igraonica za agente

Izgradimo malo više intuicije o mogućnostima Microsoft Foundryja tako da testiramo agenta u Agents Playgroundu.

1. Vratite se na stranicu `Agents` u Microsoft Foundryju – odaberite zadanog agenta
1. Kliknite opciju `Try in Playground` – trebali biste dobiti sučelje poput ovog
1. Postavite isto pitanje: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/hr/09-ask-in-playground.a1b93794f78fa676.webp)

Dobit ćete isti (ili sličan) odgovor – ali također dobivate dodatne informacije koje možete koristiti za razumijevanje kvalitete, cijene i performansi vaše agentne aplikacije. Na primjer:

1. Primijetite da odgovor navodi datoteke podataka korištene za "utemeljenje" odgovora
1. Zadržite pokazivač miša iznad bilo koje oznake datoteke – podaci odgovaraju vašem upitu i prikazanom odgovoru?

Također vidite redak sa _statistikama_ ispod odgovora.

1. Zadržite pokazivač miša iznad bilo koje metrike – npr. Safety. Vidjet ćete nešto ovako
1. Odgovara li procijenjena ocjena vašoj intuiciji o razini sigurnosti odgovora?

      ![Data](../../../../../translated_images/hr/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Ugrađena vidljivost (Observability)

Vidljivost se odnosi na instrumentiranje vaše aplikacije da generira podatke koji se mogu koristiti za razumijevanje, otklanjanje pogrešaka i optimizaciju njezinog rada. Da biste dobili dojam o tome:

1. Kliknite gumb `View Run Info` – vidjet ćete ovaj prikaz. Ovo je primjer [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) u akciji. _Ovaj prikaz možete dobiti i klikom na Thread Logs u gornjem izborniku_.

   - Steknite dojam o koracima izvođenja i alatima kojima agent koristi
   - Razumite ukupan broj tokena (u odnosu na upotrebu izlaznih tokena) za odgovor
   - Razumite latenciju i gdje se vrijeme troši u izvršavanju

      ![Agent](../../../../../translated_images/hr/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknite karticu `Metadata` da vidite dodatne atribute izvođenja, koji mogu pružiti korisni kontekst za kasnije otklanjanje poteškoća.

      ![Agent](../../../../../translated_images/hr/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknite karticu `Evaluations` da vidite automatske procjene odgovora agenta. One uključuju sigurnosne procjene (npr., samoozljeđivanje) i evaluacije specifične za agente (npr., rezolucija namjere, pridržavanje zadatka).

      ![Agent](../../../../../translated_images/hr/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Na kraju, kliknite karticu `Monitoring` u bočnom izborniku.

      - Odaberite karticu `Resource usage` na prikazanoj stranici – i pogledajte metrike.
      - Pratite korištenje aplikacije u smislu troškova (tokene) i opterećenja (zahtjeve).
      - Pratite latenciju aplikacije do prvog bajta (obrada ulaza) i zadnjeg bajta (izlaz).

      ![Agent](../../../../../translated_images/hr/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Varijable okruženja

Do sada smo prošli kroz postavljanje u pregledniku – i potvrdili da je naša infrastruktura postavljena i aplikacija radi. Ali da bismo radili s aplikacijom _od koda prema naprijed_, trebamo konfigurirati lokalno razvojno okruženje sa odgovarajućim varijablama potrebnim za rad s tim resursima. Korištenje `azd` to čini jednostavnim.

1. Azure Developer CLI [koristi varijable okruženja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) za pohranu i upravljanje konfiguracijskim postavkama za postavke aplikacija.

1. Varijable okruženja pohranjuju se u `.azure/<env-name>/.env` – čime se ograničavaju na `env-name` okruženje korišteno tijekom postavljanja i pomaže izolirati okruženja između različitih ciljeva postavljanja u istom repozitoriju.

1. Varijable okruženja automatski učitava naredba `azd` kad god izvrši određenu naredbu (npr., `azd up`). Imajte na umu da `azd` ne čita automatski varijable okruženja na razini OS-a (npr. postavljene u shellu) – umjesto toga koristite `azd set env` i `azd get env` za prijenos informacija unutar skripti.


Isprobajmo nekoliko naredbi:

1. Dohvatite sve varijable okruženja postavljene za `azd` u ovom okruženju:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vidjet ćete nešto poput:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Dohvatite određenu vrijednost – npr., želim znati je li postavljena vrijednost `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vidjet ćete nešto ovako – nije postavljeno prema zadanim postavkama!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Postavite novu varijablu okruženja za `azd`. Ovdje ažuriramo naziv modela agenta. _Napomena: sve promjene će se odmah odraziti u datoteci `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sad bismo trebali vidjeti da je vrijednost postavljena:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Primijetite da su neki resursi trajni (npr., implementacije modela) i zahtijevat će više od samog `azd up` za prisilno ponovno postavljanje. Pokušajmo ukloniti izvornu implementaciju i ponovno je postaviti s promijenjenim varijablama okruženja.

1. **Osvježi** Ako ste ranije postavili infrastrukturu koristeći azd predložak – možete _osvježiti_ stanje svojih lokalnih varijabli okruženja na temelju trenutnog stanja vaše Azure implementacije koristeći ovu naredbu:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ovo je moćan način za _sinkronizaciju_ varijabli okoline između dva ili više lokalnih razvojnih okruženja (npr. tim s više programera) - omogućavajući da implementirana infrastruktura služi kao temeljna istina za stanje varijabli okoline. Članovi tima jednostavno _osvježavaju_ varijable kako bi se ponovno uskladili.

---

## 9. Čestitamo 🏆

Upravo ste završili završni tijek rada u kojem ste:

- [X] Odabrali AZD predložak koji želite koristiti
- [X] Otvorili predložak u podržanom razvojnom okruženju
- [X] Implementirali predložak i potvrdili da radi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
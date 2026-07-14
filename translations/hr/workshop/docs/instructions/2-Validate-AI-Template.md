# 2. Validacija predloška

> Validirano s `azd 1.27.1` u srpnju 2026.

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Analizirati arhitekturu AI rješenja
    - [ ] Razumjeti proces implementacije uz AZD
    - [ ] Koristiti GitHub Copilot za pomoć u korištenju AZD-a
    - [ ] **Laboratorij 2:** Implementirati i potvrditi predložak AI agenata

---


## 1. Uvod

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ili `azd` je alat otvorenog koda za naredbeni redak koji pojednostavljuje razvojni tijek rada pri izgradnji i implementaciji aplikacija na Azure.

[AZD predlošci](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) su standardizirana spremišta koja uključuju primjer koda aplikacije, resurse _infrastrukture kao koda_ i konfiguracijske datoteke `azd` za kohezivnu arhitekturu rješenja. Provisioning infrastrukture postaje jednostavan poput naredbe `azd provision` — dok `azd up` omogućuje provisioning infrastrukture **i** implementaciju aplikacije odjednom!

Kao rezultat, početak razvoja vaše aplikacije može biti jednostavan kao pronalaženje odgovarajućeg _AZD Starter predloška_ koji najviše odgovara vašim potrebama za aplikacijom i infrastrukturom — zatim prilagodba spremišta prema zahtjevima scenarija.

Prije nego što započnemo, provjerimo imate li instaliran Azure Developer CLI.

1. Otvorite terminal u VS Code i upišite ovu naredbu:

      ```bash title="" linenums="0"
      azd version
      ```

1. Trebali biste vidjeti nešto poput ovoga!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Sada ste spremni za odabir i implementaciju predloška uz azd**

---

## 2. Odabir predloška

Microsoft Foundry platforma dolazi sa [skupom preporučenih AZD predložaka](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) koji pokrivaju popularne scenarije rješenja poput _automatizacije višestrukih agenata_ i _obradu višemodnog sadržaja_. Predloške također možete pronaći na Microsoft Foundry portalu.

1. Posjetite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Prijavite se na Microsoft Foundry portal kada se to od vas zatraži — vidjet ćete nešto poput ovoga.

![Pick](../../../../../translated_images/hr/01-pick-template.60d2d5fff5ebc374.webp)


**Osnovne** opcije su vaši početni predlošci:

1. [ ] [Početak s AI Chatom](https://github.com/Azure-Samples/get-started-with-ai-chat) koji implementira osnovnu chat aplikaciju _s vašim podacima_ na Azure Container Apps. Koristite ovo za istraživanje osnovnog AI chatbota.
1. [X] [Početak s AI agentima](https://github.com/Azure-Samples/get-started-with-ai-agents) koji također implementira standardnog AI agenta (s Foundry Agentima). Koristite ovo da se upoznate s agentnim AI rješenjima koja uključuju alate i modele.

Posjetite drugu poveznicu u novoj kartici preglednika (ili kliknite `Open in GitHub` na pripadajućoj kartici). Trebali biste vidjeti spremište za ovaj AZD predložak. Odvojite trenutak za pregled README. Arhitektura aplikacije izgleda ovako:

![Arch](../../../../../translated_images/hr/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivacija predloška

Pokušajmo implementirati ovaj predložak i provjeriti jesu li valjani. Slijedit ćemo upute u odjeljku [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Odaberite radno okruženje za predložak spremišta:

      - **GitHub Codespaces**: Kliknite [ovu poveznicu](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) i potvrdite `Create codespace`
      - **Lokalna kopija ili razvojni kontejner**: Klonirajte `Azure-Samples/get-started-with-ai-agents` i otvorite ga u VS Code

1. Pričekajte dok terminal u VS Code-u ne bude spreman, zatim unesite sljedeću naredbu:

   ```bash title="" linenums="0"
   azd up
   ```

Dovršite korake tijeka rada koji će se pokrenuti:

1. Bit ćete upitani da se prijavite u Azure — slijedite upute za autentifikaciju
1. Unesite jedinstveno ime za okruženje — npr., koristio sam `nitya-mshack-azd`
1. Ovo će kreirati mapu `.azure/` — vidjet ćete podmapu s imenom okruženja
1. Bit ćete upitani za odabir imena pretplate — odaberite zadanu
1. Bit ćete upitani za lokaciju — koristite `East US 2`

Sada pričekajte dovršetak provisioning-a. **To traje 10-15 minuta**

1. Kada je gotovo, u vašoj konzoli će se prikazati PORUKA O USPJEHU kao ova:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Vaš Azure Portal sada će imati provisioniranu grupu resursa s tim imenom okruženja:

      ![Infra](../../../../../translated_images/hr/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sada ste spremni za validaciju implementirane infrastrukture i aplikacije**.

---

## 4. Validacija predloška

1. Posjetite stranicu Azure Portala [Resource Groups](https://portal.azure.com/#browse/resourcegroups) — prijavite se kada to bude zatraženo
1. Kliknite na RG grupe resursa za vaše ime okruženja — vidjet ćete prikaz gore

      - kliknite na Azure Container Apps resurs
      - kliknite na URL aplikacije u odjeljku _Essentials_ (gore desno)

1. Trebali biste vidjeti prednji UI za hostiranu aplikaciju kao što je ovo:

   ![App](../../../../../translated_images/hr/03-test-application.471910da12c3038e.webp)

1. Pokušajte postaviti par [primjera pitanja](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pitajte: ```Koji je glavni grad Francuske?``` 
      1. Pitajte: ```Koji je najbolji šator za dvije osobe do 200$, i koje značajke uključuje?```

1. Trebali biste dobiti odgovore slične onima koji su prikazani dolje. _Ali kako to radi?_

      ![App](../../../../../translated_images/hr/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validacija agenta

Azure Container App implementira endpoint koji se povezuje s AI agentom provisioniranim u Microsoft Foundry projektu za ovaj predložak. Pogledajmo što to znači.

1. Vratite se na stranicu _Pregled_ (Overview) u Azure Portalu za vašu grupu resursa

1. Kliknite na resurs `Microsoft Foundry` na toj listi

1. Trebali biste vidjeti ovo. Kliknite gumb `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/hr/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Trebali biste vidjeti stranicu Foundry projekta za vašu AI aplikaciju
   ![Project](../../../../../translated_images/hr/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknite na `Agents` - vidjet ćete zadani Agent provisioniran u vašem projektu
   ![Agents](../../../../../translated_images/hr/06-visit-agents.bccb263f77b00a09.webp)

1. Odaberite ga — vidjet ćete pojedinosti o Agentu. Obratite pažnju na sljedeće:

      - Agent koristi pretraživanje datoteka prema zadanim postavkama (uvijek)
      - U polju `Knowledge` agenta je naznačeno da ima učitanih 32 datoteke (za pretraživanje datoteka)
      ![Agents](../../../../../translated_images/hr/07-view-agent-details.0e049f37f61eae62.webp)

1. Potražite opciju `Data+indexes` u lijevom izborniku i kliknite za pojedinosti.

      - Trebali biste vidjeti 32 podatkovne datoteke učitane za znanje.
      - One će odgovarati 12 datoteka kupaca i 20 datoteka proizvoda u `src/files`
      ![Data](../../../../../translated_images/hr/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Potvrdili ste rad Agenta!**

1. Odgovori agenta temelje se na znanju iz tih datoteka.
1. Sada možete postavljati pitanja vezana za te podatke i dobivati utemeljene odgovore.
1. Primjer: `customer_info_10.json` opisuje 3 kupnje koje je napravila "Amanda Perez"

Vratite se na karticu preglednika s Container App endpointom i pitajte: `Koje proizvode posjeduje Amanda Perez?`. Trebali biste vidjeti nešto ovako:

![Data](../../../../../translated_images/hr/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Igralište agenta

Razvijmo malo bolju intuiciju o mogućnostima Microsoft Foundryja tako da isprobamo Agenta u Agents Playgroundu.

1. Vratite se na stranicu `Agents` u Microsoft Foundry — odaberite zadani agent
1. Kliknite opciju `Try in Playground` — trebali biste dobiti korisničko sučelje igrališta kao ovo
1. Postavite isto pitanje: `Koje proizvode posjeduje Amanda Perez?`

    ![Data](../../../../../translated_images/hr/09-ask-in-playground.a1b93794f78fa676.webp)

Dobivate isti (ili sličan) odgovor — ali također dobivate dodatne informacije koje vam pomažu razumjeti kvalitetu, troškove i izvedbu vaše agentske aplikacije. Na primjer:

1. Primijetite da odgovor navodi podatkovne datoteke korištene za "uzemljenje" odgovora
1. Pređite mišem preko bilo koje od ovih oznaka datoteka — poklapaju li se podaci s vašim upitom i prikazanim odgovorom?

Također vidite redak _statistika_ ispod odgovora.

1. Pređite mišem preko bilo koje metrike — npr., Sigurnost. Vidjet ćete nešto poput ovoga
1. Odgovara li procijenjena ocjena vašoj intuiciji o razini sigurnosti odgovora?

      ![Data](../../../../../translated_images/hr/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Ugrađena promatranost

Promatranost je o instrumentiranju vaše aplikacije kako biste generirali podatke koji se mogu koristiti za razumijevanje, ispravljanje i optimizaciju njezinog rada. Da biste to osjetili:

1. Kliknite gumb `View Run Info` — trebali biste vidjeti ovaj prikaz. Ovo je primjer [praćenja agenata](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) u akciji. _Ovaj će se prikaz također pojaviti klikom na Thread Logs u glavnom izborniku_.

   - Dobijte uvid u korake izvođenja i alate koje agent koristi
   - Razumite ukupni broj tokena (u odnosu na iskorištenost izlaznih tokena) za odgovor
   - Razumite latenciju i gdje se troši vrijeme pri izvođenju

      ![Agent](../../../../../translated_images/hr/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknite karticu `Metadata` da biste vidjeli dodatne atribute izvođenja koji mogu pružiti kontekst za naknadno otklanjanje poteškoća.

      ![Agent](../../../../../translated_images/hr/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknite karticu `Evaluations` da biste vidjeli automatske procjene nad odgovorom agenta. To uključuje sigurnosne procjene (npr., Samoozljeđivanje) i specifične procjene za agenta (npr., Rascjep namjere, pridržavanje zadatka).

      ![Agent](../../../../../translated_images/hr/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Na kraju, ali ne i najmanje važno, kliknite karticu `Monitoring` u bočnom izborniku.

      - Odaberite karticu `Resource usage` na prikazanoj stranici i pogledajte metrike.
      - Pratite korištenje aplikacije u smislu troškova (tokeni) i opterećenja (zahtjevi).
      - Pratite latenciju aplikacije do prvog bajta (obrada ulaza) i posljednjeg bajta (izlaz).

      ![Agent](../../../../../translated_images/hr/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Varijable okruženja

Do sada smo prošli kroz implementaciju u pregledniku — i potvrdili da je naša infrastruktura provisionirana i aplikacija je operativna. Ali da bismo radili s aplikacijskim _kodom prvo_, trebamo konfigurirati lokalno razvojno okruženje s relevantnim varijablama potrebnim za rad s tim resursima. Korištenje `azd` to olakšava.

1. Azure Developer CLI [koristi varijable okruženja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) za pohranu i upravljanje konfiguracijskim postavkama za implementacije aplikacija.

1. Varijable okruženja pohranjuju se u `.azure/<env-name>/.env` — time su vezane uz `env-name` okruženje korišteno tijekom implementacije i pomažu vam izolirati okruženja između različitih ciljeva implementacije u istom spremištu.

1. Varijable okruženja automatski učitava naredba `azd` svaki put kada izvrši određenu naredbu (npr., `azd up`). Imajte na umu da `azd` ne čita automatski varijable okruženja na razini OS-a (npr., postavljene u shellu) — umjesto toga, koristite `azd set env` i `azd get env` za prijenos informacija unutar skripti.


Isprobajmo nekoliko naredbi:

1. Dohvatite sve varijable okruženja postavljene za `azd` u ovom okruženju:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vidite nešto poput:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Dohvatite specifičnu vrijednost — npr., želim znati je li postavljena vrijednost `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vidite nešto ovako — nije postavljeno prema zadanim postavkama!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Postavite novu varijablu okruženja za `azd`. Ovdje ažuriramo naziv modela agenta. _Napomena: sve promjene odmah se odražavaju u `.azure/<env-name>/.env` datoteci.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sada bismo trebali vidjeti da je vrijednost postavljena:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Imajte na umu da su neki resursi trajni (npr., implementacije modela) i zahtijevaju više od samo `azd up` za primoravanje ponovne implementacije. Pokušajmo ukloniti izvornu implementaciju i ponovno je implementirati s izmijenjenim varijablama okruženja.

1. **Osvježite** Ako ste prethodno implementirali infrastrukturu koristeći azd predložak — možete _osvježiti_ stanje lokalnih varijabli okruženja na temelju trenutnog stanja vaše Azure implementacije korištenjem ove naredbe:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Ovo je moćan način za _sinkronizaciju_ varijabli okruženja između dva ili više lokalnih razvojnih okruženja (npr. tim s više developera) - dopuštajući da implementirana infrastruktura služi kao osnovna istina za stanje varijabli okruženja. Članovi tima jednostavno _osvježavaju_ varijable da se ponovno usklade.

---

## 9. Čestitamo 🏆

Upravo ste dovršili cjelokupni tijek rada u kojem ste:

- [X] Odabrali AZD predložak koji želite koristiti
- [X] Otvorili predložak u podržanom razvojnome okruženju
- [X] Implementirali predložak i provjerili da radi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
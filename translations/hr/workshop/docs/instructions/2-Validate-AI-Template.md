# 2. Potvrdi predložak

!!! tip "DO KRAJA OVOG MODULA MOĆI ĆETE"

    - [ ] Analizirati AI arhitekturu rješenja
    - [ ] Razumjeti tijek rada implementacije AZD-a
    - [ ] Koristiti GitHub Copilot za pomoć pri korištenju AZD-a
    - [ ] **Lab 2:** Implementirati i potvrditi AI Agents predložak

---


## 1. Uvod

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ili `azd` je alat otvorenog koda za naredbenu liniju koji pojednostavnjuje tok rada programera prilikom izgradnje i implementacije aplikacija na Azure.

[AZD predlošci](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) su standardizirani repozitoriji koji uključuju primjer koda aplikacije, resurse _infrastrukture kao koda_ i konfiguracijske datoteke `azd` za kohezivnu arhitekturu rješenja. Postavljanje infrastrukture postaje jednostavno poput naredbe `azd provision` - dok korištenje `azd up` omogućava postavljanje infrastrukture **i** implementaciju vaše aplikacije odjednom!

Kao rezultat, pokretanje vašeg procesa razvoja aplikacije može biti jednostavno kao pronalazak pravog _AZD Starter predloška_ koji najviše odgovara vašim potrebama aplikacije i infrastrukture - zatim prilagodba repozitorija za vaše zahtjeve scenarija.

Prije nego krenemo, osigurajmo da imate instaliran Azure Developer CLI.

1. Otvorite terminal u VS Code-u i upišite ovu naredbu:

      ```bash title="" linenums="0"
      azd version
      ```

1. Trebali biste vidjeti nešto poput ovoga!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Sada ste spremni odabrati i implementirati predložak s azd**

---

## 2. Odabir predloška

Microsoft Foundry platforma dolazi s [skupom preporučenih AZD predložaka](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) koji pokrivaju popularne scenarije rješenja poput _automatizacije višestrukih agenata u tijeku rada_ i _višemodalne obrade sadržaja_. Također možete pronaći ove predloške posjetom Microsoft Foundry portala.

1. Posjetite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Prijavite se na Microsoft Foundry portal kada se to od vas zatraži - vidjet ćete nešto poput ovoga.

![Pick](../../../../../translated_images/hr/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** opcije su vaši početni predlošci:

1. [ ] [Početak s AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) koji implementira osnovnu chat aplikaciju _s vašim podacima_ na Azure Container Apps. Koristite to za istraživanje osnovnog AI chatbota.
1. [X] [Početak s AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) koji također implementira standardnog AI Agenta (s Foundry Agentima). Koristite to za upoznavanje agentičkih AI rješenja koja uključuju alate i modele.

Posjetite drugi link u novoj kartici preglednika (ili kliknite `Open in GitHub` na povezanoj kartici). Trebali biste vidjeti repozitorij za ovaj AZD Predložak. Odvojite minutu za istraživanje README datoteke. Arhitektura aplikacije izgleda ovako:

![Arch](../../../../../translated_images/hr/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivacija predloška

Pokušajmo implementirati ovaj predložak i uvjeriti se da je valjan. Slijedit ćemo upute u odjeljku [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Kliknite [ovu poveznicu](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - potvrdite zadanu radnju da `Create codespace`
1. Otvorit će se nova kartica preglednika - pričekajte da se sesija GitHub Codespaces učita
1. Otvorite terminal u VS Code-u unutar Codespaces - upišite sljedeću naredbu:

   ```bash title="" linenums="0"
   azd up
   ```

Dovršite korake tijeka rada koje će ovo pokrenuti:

1. Bit ćete upitani da se prijavite na Azure - slijedite upute za autentifikaciju
1. Unesite jedinstveno ime okruženja za sebe - npr. ja sam upotrijebio `nitya-mshack-azd`
1. Ovo će stvoriti mapu `.azure/` - vidjet ćete podmapu s imenom okruženja
1. Bit ćete upitani da odaberete naziv pretplate - odaberite zadanu
1. Bit ćete upitani za lokaciju - unesite `East US 2`

Sada, pričekajte da se postavljanje dovrši. **Ovo traje 10-15 minuta**

1. Kada je gotovo, vaša konzola će prikazati PORUKU O USPJEHU ovako:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Vaš Azure Portal sada će imati postavljenu grupu resursa s tim imenom okruženja:

      ![Infra](../../../../../translated_images/hr/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sada ste spremni za potvrdu implementirane infrastrukture i aplikacije**.

---

## 4. Potvrda predloška

1. Posjetite stranicu Azure Portala [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - prijavite se ako je potrebno
1. Kliknite RG za vaše ime okruženja - vidjet ćete gore navedenu stranicu

      - kliknite na Azure Container Apps resurs
      - kliknite na Application Url u odjeljku _Essentials_ (gore desno)

1. Trebali biste vidjeti sučelje hostane aplikacije poput ovog:

   ![App](../../../../../translated_images/hr/03-test-application.471910da12c3038e.webp)

1. Pokušajte postaviti nekoliko [primjer pitanja](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pitajte: ```Koji je glavni grad Francuske?``` 
      1. Pitajte: ```Koji je najbolji šator do 200 dolara za dvije osobe i koje značajke uključuje?```

1. Trebali biste dobiti odgovore slične prikazanim u nastavku. _Ali kako to funkcionira?_ 

      ![App](../../../../../translated_images/hr/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Potvrda agenta

Azure Container App implementira endpoint koji se povezuje s AI Agentom postavljenim u Microsoft Foundry projektu za ovaj predložak. Pogledajmo što to znači.

1. Vratite se na Azure Portal _Overview_ stranicu vaše grupe resursa

1. Kliknite na `Microsoft Foundry` resurs na tom popisu

1. Trebali biste vidjeti ovo. Kliknite na gumb `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/hr/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Trebali biste vidjeti stranicu Foundry Projekta vaše AI aplikacije
   ![Project](../../../../../translated_images/hr/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknite na `Agents` - vidjet ćete zadani Agent postavljen u vašem projektu
   ![Agents](../../../../../translated_images/hr/06-visit-agents.bccb263f77b00a09.webp)

1. Odaberite ga - vidjet ćete detalje o Agentu. Obratite pozornost na sljedeće:

      - Agent koristi File Search po defaultu (uvijek)
      - Agent `Knowledge` pokazuje da je 32 datoteke učitano (za pretraživanje datoteka)
      ![Agents](../../../../../translated_images/hr/07-view-agent-details.0e049f37f61eae62.webp)

1. Potražite opciju `Data+indexes` u lijevom izborniku i kliknite za detalje.

      - Trebali biste vidjeti 32 podatkovne datoteke učitane za znanje.
      - One će odgovarati 12 datoteka korisnika i 20 datoteka proizvoda u `src/files`
      ![Data](../../../../../translated_images/hr/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Potvrdili ste rad agenta!**

1. Odgovori agenta temelje se na znanju u tim datotekama.
1. Sada možete postavljati pitanja vezana uz te podatke i dobiti utemeljene odgovore.
1. Primjer: `customer_info_10.json` opisuje 3 kupovine koje je napravila "Amanda Perez"

Vratite se na karticu preglednika s Container App endpointom i pitajte: `Koje proizvode posjeduje Amanda Perez?`. Trebali biste vidjeti nešto ovako:

![Data](../../../../../translated_images/hr/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Igralište agenta

Izgradimo još malo intuicije o mogućnostima Microsoft Foundry tako da isprobamo Agenta u Agents Playgroundu.

1. Vratite se na stranicu `Agents` u Microsoft Foundry - odaberite zadani agent
1. Kliknite opciju `Try in Playground` - trebali biste dobiti sučelje igrališta poput ovog
1. Postavite isto pitanje: `Koje proizvode posjeduje Amanda Perez?`

    ![Data](../../../../../translated_images/hr/09-ask-in-playground.a1b93794f78fa676.webp)

Dobivate isti (ili sličan) odgovor - ali također dobivate dodatne informacije koje možete koristiti za razumijevanje kvalitete, troškova i izvedbe vaše agentičke aplikacije. Na primjer:

1. Primijetite da odgovor navodi podatkovne datoteke koje su korištene za "utemeljenje" odgovora
1. Zadržite pokazivač iznad bilo kojeg od tih oznaka datoteka - podaci se podudaraju s vašim upitom i prikazanim odgovorom?

Također vidite redak sa _statistikama_ ispod odgovora.

1. Zadržite pokazivač iznad bilo koje metrike - npr. Sigurnost. Vidjet ćete nešto poput ovoga
1. Odgovara li procijenjena ocjena vašoj intuiciji o razini sigurnosti odgovora?

      ![Data](../../../../../translated_images/hr/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Ugrađena opservabilnost

Opservabilnost se odnosi na instrumentiranje vaše aplikacije za generiranje podataka koji se mogu koristiti za razumijevanje, otklanjanje pogrešaka i optimizaciju njenih operacija. Za dobar uvid u ovo:

1. Kliknite gumb `View Run Info` - trebali biste vidjeti ovaj prikaz. Ovo je primjer [agentnog praćenja](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) u akciji. _Također možete dobiti ovaj prikaz klikom na Thread Logs u glavnom izborniku_.

   - Dobijte uvid u korake izvođenja i alate koje agent koristi
   - Razumite ukupan broj tokena (naspram korištenih tokena izlaza) za odgovor
   - Razumite latenciju i gdje se vrijeme troši tijekom izvršenja

      ![Agent](../../../../../translated_images/hr/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknite karticu `Metadata` za dodatne atribute izvođenja, koji mogu pružiti koristan kontekst za otklanjanje pogrešaka kasnije.

      ![Agent](../../../../../translated_images/hr/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknite karticu `Evaluations` da vidite automatske procjene na odgovor agenta. One uključuju sigurnosne procjene (npr. samoozljeđivanje) i specifične procjene agenta (npr. razjašnjenje namjere, pridržavanje zadatka).

      ![Agent](../../../../../translated_images/hr/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Na kraju, kliknite karticu `Monitoring` u bočnom izborniku.

      - Odaberite karticu `Resource usage` na prikazanoj stranici i pregledajte metrike.
      - Pratite korištenje aplikacije u smislu troškova (tokena) i opterećenja (zahtjeva).
      - Pratite latenciju aplikacije do prvog bajta (obrada unosa) i posljednjeg bajta (izlaz).

      ![Agent](../../../../../translated_images/hr/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Varijable okruženja

Do sada smo prošli kroz implementaciju u pregledniku - i potvrdili da je naša infrastruktura postavljena i aplikacija operativna. Ali da bismo radili s aplikacijom _primarno kroz kod_, trebamo konfigurirati naše lokalno razvojno okruženje relevantnim varijablama potrebnim za rad s tim resursima. Korištenjem `azd` to je jednostavno.

1. Azure Developer CLI [koristi varijable okruženja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) za pohranu i upravljanje konfiguracijskim postavkama za implementacije aplikacije.

1. Varijable okruženja pohranjuju se u `.azure/<env-name>/.env` - to ih ograničava na `env-name` okruženje korišteno tijekom implementacije i pomaže vam izolirati okruženja između različitih ciljnih implementacija u istom repozitoriju.

1. Varijable okruženja se automatski učitavaju naredbom `azd` kad god izvrši određenu naredbu (npr. `azd up`). Imajte na umu da `azd` ne čita automatski varijable okruženja na razini OS-a (npr. postavljene u shellu) - umjesto toga koristite `azd set env` i `azd get env` za prijenos informacija unutar skripti.


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

1. Dohvatite specifičnu vrijednost - npr. želim znati je li postavljena vrijednost `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vidite nešto poput ovoga - nije bila postavljena prema zadanim postavkama!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Postavite novu varijablu okruženja za `azd`. Ovdje ažuriramo naziv modela agenta. _Napomena: bilo kakve promjene odmah će se odraziti u `.azure/<env-name>/.env` datoteci.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sada bismo trebali vidjeti da je vrijednost postavljena:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Imajte na umu da su neki resursi trajni (npr. implementacije modela) i da će zahtijevati više od običnog `azd up` da bi se ponovno implementirali. Pokušajmo ukloniti izvornu implementaciju i ponovno implementirati s izmijenjenim varijablama okruženja.

1. **Osvježi** Ako ste ranije implementirali infrastrukturu koristeći azd predložak - možete _osvježiti_ stanje vaših lokalnih varijabli okruženja na temelju trenutnog stanja vaše Azure implementacije koristeći ovu naredbu:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ovo je moćan način za _sinkronizaciju_ varijabli okoline između dva ili više lokalnih razvojnih okruženja (npr., tim s više developera) - omogućujući da postavljena infrastruktura služi kao osnovna istina za stanje varijabli okoline. Članovi tima jednostavno _osvježavaju_ varijable kako bi se ponovno uskladili.

---

## 9. Čestitamo 🏆

Upravo ste dovršili cijeli radni proces gdje ste:

- [X] Odabrali AZD predložak koji želite koristiti
- [X] Pokrenuli predložak s GitHub Codespaces
- [X] Postavili predložak i potvrdili da radi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili kriva tumačenja proizašla iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 2. Preveri predlogo

> Preverjeno z `azd 1.27.1` julija 2026.

!!! tip "OB KONCU TEGA MODULA BOSTE ZMOGLI"

    - [ ] Analizirati arhitekturo AI rešitve
    - [ ] Razumeti potek uvajanja AZD
    - [ ] Uporabiti GitHub Copilot za pomoč pri uporabi AZD
    - [ ] **Laboratorij 2:** Uvajanje in preverjanje predloge AI agentov

---


## 1. Uvod

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ali `azd` je odprtokodno orodje ukazne vrstice, ki poenostavi razvojni potek pri ustvarjanju in uvajanju aplikacij na Azure.

[AZD predloge](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) so standardizirani repozitoriji, ki vključujejo vzorčne aplikacijske kode, vsebino _infrastrukture kot kode_ in konfiguracijske datoteke `azd` za usklajeno arhitekturo rešitve. Priprava infrastrukture je tako preprosta kot ukaz `azd provision` - medtem ko vam `azd up` omogoča hkratno pripravo infrastrukture **in** uvajanje aplikacije!

Posledično je začetek razvoja aplikacije lahko tako preprost kot izbira prave _AZD Starter_ predloge, ki se najbolj približa vašim potrebam glede aplikacije in infrastrukture - nato prilagodite repozitorij za vaše scenarijske zahteve.

Preden začnemo, se prepričajmo, da imate nameščen Azure Developer CLI.

1. Odprite terminal v VS Code in vnesite naslednji ukaz:

      ```bash title="" linenums="0"
      azd version
      ```

1. Videti bi morali nekaj takega!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Zdaj ste pripravljeni izbrati in uvesti predlogo z azd**

---

## 2. Izbira predloge

Platforma Microsoft Foundry ponuja [nabor priporočenih AZD predlog](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), ki pokrivajo priljubljene scenarije, kot so _avtomatizacija večagentnih tokov_ in _obdelava večmodalnih vsebin_. Te predloge lahko najdete tudi na portalu Microsoft Foundry.

1. Obiščite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Prijavite se v Microsoft Foundry portal, ko boste pozvani - videli boste nekaj takega.

![Pick](../../../../../translated_images/sl/01-pick-template.60d2d5fff5ebc374.webp)


Možnosti **Basic** so vaše začetne predloge:

1. [ ] [Začetek z AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), ki uvaja osnovno klepetalno aplikacijo _z vašimi podatki_ v Azure Container Apps. Uporabite to za raziskovanje osnovnega scenarija AI klepetalnika.
1. [X] [Začetek z AI Agenti](https://github.com/Azure-Samples/get-started-with-ai-agents), ki uvaja standardnega AI agenta (z Foundry Agenti). Uporabite za spoznavanje agentnih AI rešitev, ki vključujejo orodja in modele.

Drugi povezavi sledite v novem zavihku brskalnika (ali kliknite `Open in GitHub` pri sorodni kartici). Videli boste repozitorij za to AZD predlogo. Vzemite si trenutek za ogled README. Arhitektura aplikacije izgleda takole:

![Arch](../../../../../translated_images/sl/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivacija predloge

Poskusimo uvesti to predlogo in preveriti njeno veljavnost. Sledili bomo navodilom v razdelku [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Izberite delovno okolje za predlogo repozitorija:

      - **GitHub Codespaces**: Kliknite [to povezavo](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) in potrdite `Create codespace`
      - **Lokalno kloniranje ali razvojni kontejner**: Klonirajte `Azure-Samples/get-started-with-ai-agents` in odprite v VS Code

1. Počakajte, da je terminal VS Code pripravljen, nato vnesite naslednji ukaz:

   ```bash title="" linenums="0"
   azd up
   ```

Zaključite korake delovnega toka, ki se bodo sprožili:

1. Pozvani boste k prijavi v Azure - sledite navodilom za avtorizacijo
1. Vnesite edinstveno ime okolja – na primer, uporabil sem `nitya-mshack-azd`
1. To bo ustvarilo mapo `.azure/` - videli boste podmapo z imenom okolja
1. Pozvani boste k izbiri imena naročnine - izberite privzeti
1. Pozvani boste za lokacijo - uporabite `East US 2`

Sedaj počakajte, da se priprava konča. **Traja 10-15 minut**

1. Ko je končano, bo vaša konzola prikazala SPOROČILO O USPEHU kot sledeče:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Vaš Azure Portal bo zdaj vseboval dodeljeno skupino virov z imenom okolja:

      ![Infra](../../../../../translated_images/sl/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sedaj ste pripravljeni preveriti uvajano infrastrukturo in aplikacijo**.

---

## 4. Preverjanje predloge

1. Obiščite stran skupin virov Azure Portala [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - prijavite se, ko boste pozvani
1. Kliknite na RG za vaše ime okolja - videli boste prikazano stran zgoraj

      - kliknite na vir Azure Container Apps
      - kliknite na URL aplikacije v razdelku _Essentials_ (zgoraj desno)

1. Videli bi morali gostujoč uporabniški vmesnik aplikacije, kot je ta:

   ![App](../../../../../translated_images/sl/03-test-application.471910da12c3038e.webp)

1. Poskusite zastaviti nekaj [vzorčnih vprašanj](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Vprašajte: ```Kaj je glavno mesto Francije?```
      1. Vprašajte: ```Kateri je najboljši šotor pod 200 dolarji za dve osebi in katere funkcije vključuje?```

1. Dobiti bi morali odgovore, podobne prikazanim spodaj. _Ampak kako to deluje?_

      ![App](../../../../../translated_images/sl/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Preverjanje agenta

Azure Container App uvaja končno točko, ki se povezuje z AI agentom, pripravljenim v Microsoft Foundry projektu za to predlogo. Poglejmo, kaj to pomeni.

1. Vrnite se na stran _Pregled_ Azure Portala za vašo skupino virov

1. Kliknite na vir `Microsoft Foundry` na seznamu

1. Videti bi morali to. Kliknite gumb `Pojdi na Microsoft Foundry portal`.
   ![Foundry](../../../../../translated_images/sl/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Videti bi morali stran Foundry projekta za vašo AI aplikacijo
   ![Project](../../../../../translated_images/sl/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Kliknite na `Agents` - vidite privzetega agenta, dodeljenega vašemu projektu
   ![Agents](../../../../../translated_images/sl/06-visit-agents.bccb263f77b00a09.webp)

1. Izberite ga - videli boste podrobnosti agenta. Upoštevajte sledeče:

      - Agent uporablja iskanje po datotekah kot privzeto funkcijo (vedno)
      - Agentova `Knowledge` (Znanje) kaže, da je naloženih 32 datotek (za iskanje po datotekah)
      ![Agents](../../../../../translated_images/sl/07-view-agent-details.0e049f37f61eae62.webp)

1. Poiščite možnost `Data+indexes` v levem meniju in kliknite za podrobnosti.

      - Videli boste 32 podatkovnih datotek naloženih za znanje.
      - Te ustrezajo 12 datotekam strank in 20 datotekam izdelkov v `src/files`
      ![Data](../../../../../translated_images/sl/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Preverili ste delovanje agenta!**

1. Odgovori agenta temeljijo na znanju iz teh datotek.
1. Zdaj lahko zastavljate vprašanja v zvezi s temi podatki in dobite ustrezne odgovore.
1. Na primer: `customer_info_10.json` opisuje 3 nakupe, ki jih je opravila "Amanda Perez"

Ponovno odprite zavihek brskalnika s končno točko Container App in vprašajte: `Kateri izdelki pripadajo Amanda Perez?`. Videti bi morali nekaj takega:

![Data](../../../../../translated_images/sl/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agentno igrišče

Poglobimo razumevanje zmogljivosti Microsoft Foundry z igranjem z agentom na Agents Playground.

1. Vrnite se na stran `Agents` v Microsoft Foundry - izberite privzetega agenta
1. Kliknite na možnost `Poskusi na igrišču` (Try in Playground) - videli boste uporabniški vmesnik igrišča, kot je ta
1. Ponovno vprašajte: `Kateri izdelki pripadajo Amanda Perez?`

    ![Data](../../../../../translated_images/sl/09-ask-in-playground.a1b93794f78fa676.webp)

Dobite enak (ali podoben) odgovor - a hkrati vidite dodatne informacije, ki vam pomagajo razumeti kakovost, stroške in zmogljivost vaše agentne aplikacije. Na primer:

1. Opazite, da odgovor navaja podatkovne datoteke, uporabljene za "osnovo" odgovora
1. Postavite kurzor nad katerokoli od teh etiketa datotek – ali se podatki ujemajo z vašim poizvedbo in prikazanim odgovorom?

Vidite tudi vrstico _statistik_ pod odgovorom.

1. Postavite kurzor nad katerikoli merilec – npr. varnost (Safety). Videli boste nekaj takega
1. Ali se ocenjena ocena ujema z vašo intuicijo glede stopnje varnosti odgovora?

      ![Data](../../../../../translated_images/sl/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Vgrajena opazovalnost

Opazovalnost je opremljanje vaše aplikacije z instrumenti, ki generirajo podatke za razumevanje, odpravljanje napak in optimizacijo njene funkcionalnosti. Za občutek tega:

1. Kliknite gumb `Poglej informacije o teku` (View Run Info) - videli boste ta pogled. To je primer [sledenja agentu](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) v akciji. _Ta pogled lahko dobite tudi s klikom na Thread Logs v glavnem meniju_.

   - Spoznajte korake in orodja, ki jih agent uporablja
   - Razumite skupno število tokenov (v primerjavi z uporabo izhodnih tokenov) za odgovor
   - Razumite zamudo in kje se čas izvrševanja porabi

      ![Agent](../../../../../translated_images/sl/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Kliknite zavihek `Metadata`, da si ogledate dodatne atribute teka, ki lahko kasneje pomagajo pri odpravljanju težav.

      ![Agent](../../../../../translated_images/sl/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Kliknite zavihek `Evaluations` za ogled samodejnih ocen odgovorov agenta. Vključujejo varnostne ocene (npr. samopoškodovanje) in specifične ocene agenta (npr. rešitev namere, vzdrževanje naloge).

      ![Agent](../../../../../translated_images/sl/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Nazadnje, kliknite zavihek `Monitoring` v stranskem meniju.

      - Izberite zavihek `Resource usage` na prikazani strani - in oglejte si metrike.
      - Spremljajte uporabo aplikacije glede stroškov (tokeni) in obremenitve (zahteve).
      - Spremljajte zakasnitev aplikacije do prvega bajta (obdelava vhodnih podatkov) in zadnjega bajta (izhod).

      ![Agent](../../../../../translated_images/sl/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Spremenljivke okolja

Doslej smo brskali po uvajanju v brskalniku in preverili, da je infrastruktura pripravljena in aplikacija deluje. Če pa želimo delati z aplikacijsko kodo _najprej_, moramo konfigurirati lokalno razvojno okolje s pomembnimi spremenljivkami, potrebnimi za delo s temi viri. Uporaba `azd` to poenostavi.

1. Azure Developer CLI [uporablja spremenljivke okolja](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) za shranjevanje in upravljanje konfiguracijskih nastavitev za uvajanje aplikacij.

1. Spremenljivke okolja so shranjene v `.azure/<env-name>/.env` - kar jih poveže z okoljem `env-name`, uporabljenim med uvajanjem, in pomaga izolirati okolja za različne cilje uvajanja v istem repozitoriju.

1. Spremenljivke okolja se samodejno naložijo z ukazom `azd` ob izvajanju določenega ukaza (npr. `azd up`). Upoštevajte, da `azd` ne bere samodejno _spremenljivk okolja na ravni OS_ (npr. nastavljenih v lupini) - raje uporabite `azd set env` in `azd get env` za prenos informacij znotraj skript.


Preizkusimo nekaj ukazov:

1. Pridobite vse nastavljene spremenljivke okolja za `azd` v tem okolju:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Videli boste nekaj takega:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Pridobite specifično vrednost - npr. zanima me, če smo nastavili vrednost `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Videli boste nekaj takega - privzeto ni bilo nastavljeno!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Nastavite novo spremenljivko okolja za `azd`. Tukaj posodobimo ime modela agenta. _Opomba: vsakršne spremembe se takoj odražajo v datoteki `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Zdaj bi morali videti nastavljeno vrednost:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Nekateri viri so trajni (npr. uvajanja modelov) in bodo zahtevali več kot le `azd up` za ponovno uvajanje. Poskusimo odstraniti prvotno uvajanje in ponovno uvesti z spremenjenimi spremenljivkami okolja.

1. **Osvežitev** Če ste prej uvajali infrastrukturo s predlogo azd – lahko _osvežite_ stanje lokalnih spremenljivk okolja glede na trenutno stanje vašega Azure uvajanja z naslednjim ukazom:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      To je zmogljiv način za _sinhronizacijo_ okolijskih spremenljivk med dvema ali več lokalnimi razvojnimi okolji (npr. ekipa z več razvijalci) - kar omogoča, da nameščena infrastruktura služi kot zanesljiva osnova za stanje okolijskih spremenljivk. Člani ekipe preprosto _osvežijo_ spremenljivke, da se ponovno sinhronizirajo.

---

## 9. Čestitke 🏆

Pravkar ste zaključili celoten potek dela, kjer ste:

- [X] Izbrali AZD predlogo, ki jo želite uporabiti
- [X] Odprli predlogo v podprtem razvojnih okolju
- [X] Namestili predlogo in preverili, da deluje

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
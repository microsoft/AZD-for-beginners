# 2. Malli valideerimine

> Valideeritud `azd 1.27.1` vastu juulis 2026.

!!! tip "SELLE MOODULI LÕPUS OLETE VÕIMELINE"

    - [ ] Analüüsima tehisintellekti lahenduse arhitektuuri
    - [ ] Mõistma AZD juurutusprotsessi töövoogu
    - [ ] Kasutama GitHub Copilotit, et saada abi AZD kasutamisel
    - [ ] **Labor 2:** Juhtima ja valideerima AI Agentide malli

---


## 1. Sissejuhatus

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) või `azd` on avatud lähtekoodiga käsureatööriist, mis lihtsustab arendajate töövoogu Azure'i rakenduste ehitamisel ja juurutamisel.

[AZD mallid](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) on standardiseeritud hoidlad, mis sisaldavad näidisrakenduse koodi, _infrastruktuuri kui koodi_ varasid ja `azd` konfiguratsioonifaile tervikliku lahendusarhitektuuri jaoks. Infrastruktuuri loomine muutub nii lihtsaks kui käsu `azd provision` käivitamine – samas võimaldab käsu `azd up` kasutamine infrastruktuuri loomist **ja** rakenduse juurutamist korraga!

Seega võib rakenduse arendusprotsessi alustamine olla nii lihtne kui leida sobiv _AZD Starter_ mall, mis vastab teie rakenduse ja infrastruktuuri vajadustele, ning seejärel kohandada hoidlat vastavalt oma stsenaariumi nõuetele.

Enne alustamist veendume, et teil oleks installitud Azure Developer CLI.

1. Avage VS Code terminal ja sisestage järgmine käsk:

      ```bash title="" linenums="0"
      azd version
      ```

1. Peaksite nägema midagi sellist!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Olete nüüd valmis valima ja juurutama malliga kasutades azd**

---

## 2. Malli valimine

Microsoft Foundry platvorm pakub [komplekti soovitatud AZD malle](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), mis katavad populaarsed lahenduste stsenaariumid nagu _mitmeagendiline töövoo automatiseerimine_ ja _mitmemodaalne sisutöötlus_. Samuti saate neid malle avastada Microsoft Foundry portaalis.

1. Külastage [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Logige sisse Microsoft Foundry portaali, kui seda soovitatakse – näete midagi sellist.

![Pick](../../../../../translated_images/et/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** valikud on teie stardimallid:

1. [ ] [Alustage AI Chat'iga](https://github.com/Azure-Samples/get-started-with-ai-chat), mis juurutab lihtsa juturakenduse _teie andmetega_ Azure Container Apps'i. Kasutage seda, et uurida lihtsat tehisintellekti vestlusrobotit.
1. [X] [Alustage AI Agentidega](https://github.com/Azure-Samples/get-started-with-ai-agents), mis samuti juurutab standardse AI Agendi (kasutades Foundry agente). Kasutage seda, et tutvuda agendipõhiste tehisintellekti lahendustega, mis hõlmavad tööriistu ja mudeleid.

Külastage teist linki uues brauseri vahelehes (või klõpsake seotud kaardil nuppu `Open in GitHub`). Peaksite nägema selle AZD malli hoidlat. Võtke hetk, et uurida README-d. Rakenduse arhitektuur näeb välja selline:

![Arch](../../../../../translated_images/et/architecture.8cec470ec15c65c7.webp)

---

## 3. Malli aktiveerimine

Proovime seda malli juurutada ja veenduda, et see on kehtiv. Järgime juhiseid jaotises [Alustamine](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Valige mallihalduri hoidla jaoks töökeskkond:

      - **GitHub Codespaces**: Klõpsake [sellel lingil](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ja kinnitage `Create codespace`
      - **Kohalik kloon või arenduskonteiner**: kloonige `Azure-Samples/get-started-with-ai-agents` ja avage see VS Codes

1. Oodake, kuni VS Code terminal on valmis, seejärel tippige järgmine käsk:

   ```bash title="" linenums="0"
   azd up
   ```

Täitke jooksvaid töövoo samme, mida see käivitab:

1. Teilt küsitakse Azure'i sisselogimist – järgige autentimise juhiseid
1. Sisestage endale unikaalne keskkonna nimi – näiteks kasutasin `nitya-mshack-azd`
1. See loob `.azure/` kausta – näete alamkausta keskkonna nimega
1. Teilt küsitakse tellimuse nime valikut – valige vaikimisi
1. Teilt küsitakse asukohta – kasutage `East US 2`

Nüüd oodake, kuni infrastruktuuri loomine lõpetatakse. **See võtab 10-15 minutit**

1. Kui valmis, kuvatakse teie konsoolis EDU LÕPETAMISE (SUCCESS) sõnum nagu see:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Azure Portal'is on nüüd loodud selle keskkonna nimega ressursigrupp:

      ![Infra](../../../../../translated_images/et/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Olete nüüd valmis valideerima juurutatud infrastruktuuri ja rakendust**.

---

## 4. Malli valideerimine

1. Minge Azure Portal [Ressursigrupid](https://portal.azure.com/#browse/resourcegroups) lehele – logige sisse, kui palutakse
1. Klõpsake oma keskkonna nimega RG-l – näete ülaltoodud lehte

      - klõpsake Azure Container Apps ressursil
      - klõpsake jaotises _Olulised_ (paremal ülal) rakenduse URL-il

1. Peaksite nägema majutatud rakenduse esipaneeli liidest nagu see:

   ![App](../../../../../translated_images/et/03-test-application.471910da12c3038e.webp)

1. Proovige esitada paar [näidisküsimust](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Küsi: ```Mis on Prantsusmaa pealinn?```
      1. Küsi: ```Milline on parim kahe inimese telk kuni 200 dollari eest ja millised omadused see sisaldab?```

1. Peaksite saama vastuseid, mis on sarnased allpool näidatule. _Kuid kuidas see töötab?_

      ![App](../../../../../translated_images/et/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agendi valideerimine

Azure Container App juurutab lõpp-punkti, mis ühendub selle malli Microsoft Foundry projektis juhitud AI Agendiga. Vaatame, mida see tähendab.

1. Tagasi Azure Portaali _Ülevaate_ lehele oma ressursigrupi jaoks

1. Klõpsake selles nimekirjas `Microsoft Foundry` ressursil

1. Peaksite nägema seda. Klõpsake nuppu `Mine Microsoft Foundry portaalile`. 
   ![Foundry](../../../../../translated_images/et/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Peaksite nägema Foundry projekti lehte oma AI rakenduse jaoks
   ![Project](../../../../../translated_images/et/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klõpsake `Agents` - näete selle projekti vaikimisi loodud Agenti
   ![Agents](../../../../../translated_images/et/06-visit-agents.bccb263f77b00a09.webp)

1. Valige see - ja näete Agendi üksikasju. Pöörake tähelepanu järgmisele:

      - Agent kasutab vaikimisi failide otsingut (alati)
      - Agendi `Knowledge` näitab, et on üles laaditud 32 faili (failiotsinguks)
      ![Agents](../../../../../translated_images/et/07-view-agent-details.0e049f37f61eae62.webp)

1. Otsige vasakpoolsest menüüst valikut `Data+indexes` ja klõpsake üksikasjade nägemiseks. 

      - Peaksite nägema 32 teadmiste faili, mis on üles laetud.
      - Need vastavad `src/files` kausta 12 kliendi ja 20 toote failile
      ![Data](../../../../../translated_images/et/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Olete valideerinud Agendi toimimise!** 

1. Agendi vastused tuginevad nendele teadmusfailidele.
1. Nüüd saate esitada küsimusi nende andmetega seoses ja saada põhjendatud vastuseid.
1. Näide: `customer_info_10.json` kirjeldab kolme ostu, mille tegi "Amanda Perez"

Minge tagasi brauseri vahelehele Container App lõpp-punktiga ja küsige: `Millised tooted kuuluvad Amanda Perezile?`. Peaksite nägema midagi sellist:

![Data](../../../../../translated_images/et/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agendi mänguväljak

Saame Microsoft Foundry võimekustest parema ülevaate, lastes Agendil proovida end Agents Playground'is.

1. Minge Microsoft Foundry lehele `Agents` – valige vaikimisi agent
1. Klõpsake valikut `Try in Playground` – peaksite nägema sellist mänguväljaku kasutajaliidest
1. Küsi sama küsimust: `Millised tooted kuuluvad Amanda Perezile?`

    ![Data](../../../../../translated_images/et/09-ask-in-playground.a1b93794f78fa676.webp)

Saate sama (või sarnase) vastuse – kuid näete ka täiendavat teavet, mida saate kasutada agendi rakenduse kvaliteedi, hinna ja jõudluse mõistmiseks. Näiteks:

1. Märkige, et vastus viitab andmefailidele, mida kasutati vastuse "maandumiseks"
1. Hõljutage kursori mis tahes faili märgil – kas andmed vastavad teie päringule ja kuvatud vastusele?

All vastuse all on ka _statistika_ rida.

1. Hõljutage kursori mis tahes mõõdiku kohal – nt Safety. Näete midagi sellist
1. Kas hinnang vastab teie tunnetusele vastuse ohutuse kohta?

      ![Data](../../../../../translated_images/et/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Sisseehitatud jälgitavus

Jälgitavus tähendab rakenduse varustamist vahenditega, mis võimaldavad genereerida andmeid, mida saab kasutada selle toimimise mõistmiseks, tõrkeotsinguks ja optimeerimiseks. Selle tunnetamiseks:

1. Klõpsake nuppu `View Run Info` – peaksite nägema seda vaadet. See on näide [Agendi jälgimisest](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) tegevuses. _Seda vaadet saate ka Thread Logsi kaudu tippmenüüst._

   - Saage ülevaade jooksust ja agendi kaasatud tööriistadest
   - Mõistke koguarv Token'it (võrdluses väljundtokenitega) vastuses
   - Mõistke latentsust ja kus täitmisele kulub aeg

      ![Agent](../../../../../translated_images/et/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klõpsake vahekaarti `Metadata`, et näha täiendavaid jooksu atribuute, mis võivad hilisemal tõrkeotsingul kasulikud olla.

      ![Agent](../../../../../translated_images/et/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klõpsake vahekaarti `Evaluations`, et näha automaatseid hinnanguid agendi vastusele. Neisse kuuluvad ohutuse hinnangud (nt enesevigastamine) ja agendispetsiifilised hinnangud (nt kavatsuse mõistmine, ülesannete järgimine).

      ![Agent](../../../../../translated_images/et/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Lõpuks klõpsake külgribal `Monitoring` vahekaarti.

      - Valige ilmuvast lehelt `Resource usage` vahekaart - ja vaadake mõõdikuid.
      - Jälgige rakenduse kasutust kulude (tokenite) ja koormuse (päringute) osas.
      - Jälgige rakenduse latentsust esimese baidi (sisendi töötlemine) ja viimase baidi (väljundi) suhtes.

      ![Agent](../../../../../translated_images/et/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Keskkonnamuutujad

Seni oleme läbinud juurutuse brauseris ja valideerinud, et infrastruktuur on loodud ning rakendus töötab. Kuid rakendusega töötamiseks _koodi eest_ peame seadistama oma kohalikus arenduskeskkonnas asjakohased muutujad, mis on vajalikud nendega töötamiseks. `azd` kasutamine muudab selle lihtsaks.

1. Azure Developer CLI [kasutab keskkonnamuutujaid](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash), et salvestada ja hallata seadistusi rakenduse juurutusteks.

1. Keskkonnamuutujad on salvestatud faili `.azure/<keskkonna-nimi>/.env` – see piirab need `keskkonna-nimi` keskkonnale, mida kasutati juurutamisel, ning aitab teil eristada erinevaid juurutuse sihtkohti samas hoidlas.

1. Keskkonnamuutujad laetakse automaatselt käsu `azd` poolt iga konkreetse käsu (nt `azd up`) täitmisel. Pange tähele, et `azd` ei loe automaatselt _OS-tasandi_ keskkonnamuutujaid (nt seadistatud terminalis) – selle asemel kasutage käsklusi `azd set env` ja `azd get env` info edastamiseks skriptides.


Proovime mõnda käsku:

1. Vaadake kõiki selles keskkonnas `azd` jaoks seadistatud keskkonnamuutujaid:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Näete midagi sellist:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Vaadake konkreetset väärtust – nt tahan teada, kas väärtus `AZURE_AI_AGENT_MODEL_NAME` on seadistatud

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Näete midagi sellist – seda vaikimisi ei olnud seatud!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Seadistage `azd` jaoks uus keskkonnamuutuja. Siin uuendame agendi mudeli nime. _Märkus: kõik tehtud muudatused kajastuvad koheselt failis `.azure/<keskkonna-nimi>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nüüd peaks väärtus olema seatud:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Pange tähele, et mõned ressursid on püsivad (nt mudeli juurutused) ja nõuavad rohkem kui lihtsalt `azd up`, et sundida uuesti juurutamist. Proovime eemaldada algse juurutuse ja juurutada uuesti muudetud keskkonnamuutujatega.

1. **Värskendamine** Kui olete eelnevalt juurutanud infrastruktuuri azd malliga, saate oma kohalikus keskkonnas olevate keskkonnamuutujate seisundit värskendada vastavalt teie praegusele Azure'i juurutuse seisundile järgmise käsuga:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      See on võimas viis sünkroonida keskkonnamuutujaid kahe või enama kohaliku arenduskeskkonna vahel (nt meeskond, kus on mitu arendajat) – võimaldades juurutatud infrastruktuuril toimida tõepõhjana keskkonnamuutujate oleku jaoks. Meeskonnaliikmed lihtsalt uuendavad muutujaid, et uuesti sünkroonis olla.

---

## 9. Palju õnne 🏆

Sa just lõpetasid täieliku töövoo, kus sa:

- [X] Valisid AZD malli, mida soovid kasutada
- [X] Avasid malli toetatud arenduskeskkonnas
- [X] Juurdestasid malli ja kontrollisid, et see töötab

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
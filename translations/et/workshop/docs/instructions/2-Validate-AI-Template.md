# 2. Kinnitamine mallile

!!! tip "SELLE MOOODULI LÕPUS OLETE VÕIMELINE"

    - [ ] Analüüsima tehisintellekti lahenduse arhitektuuri
    - [ ] Mõistma AZD juurutusprotsessi
    - [ ] Kasutama GitHub Copilot'i abi saamiseks AZD kasutamisel
    - [ ] **Labor 2:** AI agentide malli juurutamine ja kinnitamine

---


## 1. Sissejuhatus

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ehk `azd` on avatud lähtekoodiga käsurea tööriist, mis lihtsustab arendaja tööd rakenduste ehitamisel ja juurutamisel Azure’i platvormile. 

[AZD mallid](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) on standardiseeritud hoidlad, mis sisaldavad näidisrakenduse koodi, _infrastruktuuri-koodi_ varasid ja `azd` konfiguratsioonifaile seotud lahenduse arhitektuuri jaoks. Infrastruktuuri loomine saab väga lihtsaks käsuga `azd provision` - samas `azd up` võimaldab infrastruktuuri luua **ja** rakendust korraga juurutada!

Seega võib rakenduse arenduse alustamine olla sama lihtne kui leida sobiv _AZD algusmall_, mis kõige lähemalt vastab teie rakenduse ja infrastruktuuri vajadustele – seejärel kohandada hoidlat vastavalt oma stsenaariumi nõuetele.

Enne alustamist kontrollime, et teil on Azure Developer CLI paigaldatud.

1. Avage VS Code terminal ja tippige käsk:

      ```bash title="" linenums="0"
      azd version
      ```

1. Näete midagi sellist!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Olete nüüd valmis valima ja juurutama malli azd-ga**

---

## 2. Malli valik

Microsoft Foundry platvormi juurde kuulub [soovitatud AZD mallide komplekt](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), mis katab populaarsed lahendustsenaariumid nagu _mitme agendi töövoo automatiseerimine_ ja _mitme modaalne sisutöötlus_. Samuti saate neid malle avastada Microsoft Foundry portaalis.

1. Minge aadressile [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Logige sisse Microsoft Foundry portaalile, kui küsitakse – näete midagi sellist.

![Pick](../../../../../translated_images/et/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** valikud on teie algusmallid:

1. [ ] [Alustage AI juturobotiga](https://github.com/Azure-Samples/get-started-with-ai-chat), mis juurutab lihtsa juturoboti rakenduse _teie andmetega_ Azure Container Apps’i. Kasutage seda AI juturoboti stsenaariumi uurimiseks.
1. [X] [Alustage AI agentidega](https://github.com/Azure-Samples/get-started-with-ai-agents), mis juurutab standardse AI agendi (Foundry agentidega). Kasutage seda, et tutvuda agendipõhiste AI lahendustega, mis hõlmavad tööriistu ja mudeleid.

Avage teine link uues brauseri vahekaardis (või klõpsake seotud kaardil `Open in GitHub`). Näete selle AZD malli hoidlat. Võtke hetk README uurimiseks. Rakenduse arhitektuur näeb välja selline:

![Arch](../../../../../translated_images/et/architecture.8cec470ec15c65c7.webp)

---

## 3. Malli aktiveerimine

Proovime seda malli juurutada ja veenduda selle kehtivuses. Järgime juhiseid jaotises [Alustamine](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Klõpsake [seda linki](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) – kinnitage vaikimisi tegevus `Create codespace`
1. See avab uue brauseri vahekaardi – oodake, kuni GitHub Codespaces sessioon täielikult laadib
1. Avage Codespaces VS Code terminal – tippige järgmine käsk:

   ```bash title="" linenums="0"
   azd up
   ```

Täiendage töövoo samme, mida see käivitab:

1. Teilt küsitakse Azure’i sisselogimist – järgige juhiseid autentimiseks
1. Sisestage unikaalne keskkonna nimi – nt. mina kasutasin `nitya-mshack-azd`
1. See loob `.azure/` kausta – näete selle all keskkonnanimega alamkausta
1. Teilt küsitakse tellimuse nime valikut – valige vaikimisi
1. Teilt küsitakse asukohta – kasutage `East US 2`

Nüüd oodake, kuni provisjonimine lõpeb. **See võtab 10-15 minutit**

1. Kui valmis, näitab teie konsool SELLIST EDUKUSE teadet:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Teie Azure portaalis on nüüd selle keskkonnanimega loodud ressursigrupi juurutus:

      ![Infra](../../../../../translated_images/et/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Olete nüüd valmis kinnitama juurutatud infrastruktuuri ja rakendust**.

---

## 4. Malli kinnitamine

1. Minge Azure portaali lehele [Ressursigrupid](https://portal.azure.com/#browse/resourcegroups) – logige sisse, kui küsitakse
1. Klõpsake oma keskkonnanimega ressursigrupil – näete eeltoodud lehte

      - klõpsake Azure Container App ressursil
      - klõpsake rakenduse URL-il lõigus _Essentials_ (paremal ülal)

1. Peaksite nägema veebipõhist rakenduserajapinda nagu allolevalt:

   ![App](../../../../../translated_images/et/03-test-application.471910da12c3038e.webp)

1. Proovige esitada paar [näidisülesannet](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Küsige: ```Mis on Prantsusmaa pealinn?``` 
      1. Küsige: ```Milline on parim telk alla 200 dollari kahe inimese jaoks ja millised omadused sel on?```

1. Peaksite saama vastused sarnaselt allolevaga. _Aga kuidas see töötab?_ 

      ![App](../../../../../translated_images/et/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agendi kinnitamine

Azure Container App juurutab lõpp-punkti, mis ühendub AI agendiga, mis on provisjoneeritud Microsoft Foundry projektis selle malli jaoks. Vaatame, mida see tähendab.

1. Tagasi Azure portaali _Ülevaade_ lehele teie ressursigrupi jaoks

1. Klõpsake nimistust `Microsoft Foundry` ressursil

1. Näete seda. Klõpsake nuppu `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/et/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Näete oma AI rakenduse Foundry projekti lehte
   ![Project](../../../../../translated_images/et/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klõpsake `Agents` – näete vaikimisi provisjoneeritud agenti oma projektis
   ![Agents](../../../../../translated_images/et/06-visit-agents.bccb263f77b00a09.webp)

1. Valige see – näete agendi üksikasju. Märkused:

      - Agent kasutab vaikimisi (alati) failide otsingut
      - Agendi `Knowledge` näitab, et on üles laaditud 32 faili (failiotsingu jaoks)
      ![Agents](../../../../../translated_images/et/07-view-agent-details.0e049f37f61eae62.webp)

1. Vasaku menüü alt otsige valikut `Data+indexes` ja klõpsake detailide vaatamiseks. 

      - Näete 32 üleslaaditud andmefaili teadmiste jaoks.
      - Need vastavad 12 kliendi failile ja 20 toote failile kataloogis `src/files`
      ![Data](../../../../../translated_images/et/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Te kinnitasite agendi tööd!** 

1. Agendi vastused põhinevad nende failide sisul.
1. Võite nüüd esitada küsimusi nendele andmetele ja saada sisulisi vastuseid.
1. Näide: `customer_info_10.json` kirjeldab kolme ostu, mille tegi "Amanda Perez"

Naaske brauseri vahekaardile, kus on Container App lõpp-punkt ja küsige: `Milliseid tooteid Amanda Perez omab?`. Peaksite nägema midagi sellist:

![Data](../../../../../translated_images/et/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agendi mänguväljak

Arendame Microsoft Foundry võimeid natuke edasi, proovides Agentit Agents Playground’is.

1. Tagasi `Agents` lehele Microsoft Foundry-s – valige vaikimisi agent
1. Klõpsake valikut `Try in Playground` – peaksite nägema sellist mänguväljaku kasutajaliidest
1. Küsige sama küsimust: `Milliseid tooteid Amanda Perez omab?`

    ![Data](../../../../../translated_images/et/09-ask-in-playground.a1b93794f78fa676.webp)

Saate sama (või sarnase) vastuse – kuid lisaks ka täiendavat infot, mida saate kasutada agendipõhise rakenduse kvaliteedi, hinna ja jõudluse tundmaõppimiseks. Näiteks:

1. Pange tähele, et vastus viitab andmefailidele, mida kasutati vastuse "maandumiseks"
1. Liikuge hiirega üle failide nimetuste – kas andmed vastavad teie päringule ja kuvatud vastusele?

All vastuse all näete ka _statistika_ rida.

1. Liikuge hiirega üle mõne mõõdiku – nt. Heal ohutust. Näete midagi sellist
1. Kas hinnang vastab teie tunnetusele vastuse ohutuse kohta?

      ![Data](../../../../../translated_images/et/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Sisseehitatud jälgitavus

Jälgitavus tähendab rakenduse instrumenteerimist, et genereerida andmeid selle toimimise mõistmiseks, tõrkeotsinguks ja optimeerimiseks. Selle tunnetamiseks:

1. Klõpsake nuppu `View Run Info` – näete seda vaadet. See on näide [agendi jälgimisest](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) töös. _Seda vaadet saate ka, kui klõpsate tippmenüüs valikut Thread Logs_.

   - Hankige ülevaade töövoo sammudest ja agendi kasutatavatest tööriistadest
   - Mõistke vastuse kogu tokenite arvu (võrreldes väljundtokenite kasutusega)
   - Mõistke latentsust ja kus aega täpselt kulutatakse töötluses

      ![Agent](../../../../../translated_images/et/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klõpsake vahekaarti `Metadata`, et näha täiendavaid töö käimise atribuute, mis võivad hilisemal tõrkeotsingul kasulikud olla.

      ![Agent](../../../../../translated_images/et/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klõpsake vahekaarti `Evaluations`, et näha automaatseid hinnanguid agendi vastuse kohta. Nende hulka kuuluvad ohutuse hinnangud (nt enesevigastamise oht) ja agendipõhised hinnangud (nt kavatsuse selgitamine, ülesande täitmine).

      ![Agent](../../../../../translated_images/et/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Lõpuks klõpsake vasakus küljeribas vahekaarti `Monitoring`.

      - Valige lehel vahekaart `Resource usage` ja vaadake mõõdikuid.
      - Jälgige rakenduse kasutust kulude (tokenite) ja koormuse (päringute) osas.
      - Jälgige rakenduse latentsust esimese baidini (sisendi töötlemine) ja viimase baidini (väljund).

      ![Agent](../../../../../translated_images/et/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Keskkonnamuutujad

Siiani oleme jälginud juurutamist brauseris – ja kinnitanud, et infrastruktuur on loodud ja rakendus töötab. Kuid rakenduse käsitsi arendamiseks tuleb seadistada oma kohalik arenduskeskkond vastavate muutujatega, mis on vajalikud nende ressurssidega töötamiseks. `azd` kasutamine teeb selle lihtsaks.

1. Azure Developer CLI [kasutab keskkonnamuutujaid](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash), et salvestada ja hallata rakenduse juurutuse konfiguratsioone.

1. Keskkonnamuutujad salvestatakse faili `.azure/<keskkonnanimi>/.env` – see seob need konkreetse juurutatud keskkonnaga ja aitab hoida eri keskkonnad eraldi samas hoidlas.

1. Keskkonnamuutujad laetakse automaatselt `azd` käsu käivitamisel (nt `azd up`). Märkus: `azd` ei loe automaatselt _OS taseme_ keskkonnamuutujaid (nt need, mis on seadistatud shellis) – selle asemel kasutage `azd set env` ja `azd get env`, et skriptides infot vahetada.


Proovime mõningaid käske:

1. Loetlege kõik keskkonnamuutujad, mis on `azd` jaoks selles keskkonnas seadistatud:

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

1. Hankige konkreetne väärtus – nt soovite teada, kas on seatud `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Näete midagi sellist – vaikimisi seda seatud ei olnud!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Seadistage `azd` jaoks uus keskkonnamuutuja. Siin värskendame agendi mudeli nime. _Märkus: kõik muudatused kajastuvad koheselt failis `.azure/<keskkonnanimi>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nüüd peaks väärtus olema seadistatud:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Mõned ressursid on püsivad (nt mudelite juurutused) ja nende uuesti juurutamiseks ei piisa vaid käsust `azd up`. Proovime vana juurutuse maha võtta ja uuesti muuta keskkonnamuutujatega juurutada.

1. **Värskenda** Kui olete varasemalt juurutanud infrastruktuuri azd malliga – saate oma kohaliku keskkonna muutujate olekut värskendada Azure juurutuse hetke seisuga, kasutades järgmist käsku:

      ```bash title="" linenums="0"
      azd env refresh
      ```

See on võimas viis _sünkroonida_ keskkonnamuutujaid kahe või enama kohaliku arenduskeskkonna vahel (nt meeskond, kus on mitu arendajat) – võimaldades juurutatud infrastruktuuril toimida tõena keskkonnamuutujate oleku jaoks. Meeskonnaliikmed saavad lihtsalt muutujaid _värskendada_, et uuesti sünkroonis olla.

---

## 9. Palju õnne 🏆

Said just valmis lõpuni kogu töövoo, kus sa:

- [X] Valisid kasutamiseks soovitud AZD malle
- [X] Käivitasid malli GitHub Codespaces abil
- [X] Juurutasid malli ja kinnitasid selle toimimist

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles on autoriteetne allikas. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud arusaamatuste ega väärarusaamade eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 2. Kinnitamine mall

> Kinnitatud `azd 1.23.12` vastu märtsis 2026.

!!! tip "SELLE MÄLUMOODULI LÕPUS SA OLED VÕIMELINE"

    - [ ] Analüüsima tehisintellekti lahenduse arhitektuuri
    - [ ] Mõistma AZD juurutusprotsessi
    - [ ] Kasutama GitHub Copilotit abistamiseks AZD kasutamisel
    - [ ] **Labor 2:** AI agentide malli juurutamine ja valideerimine

---


## 1. Sissejuhatus

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ehk `azd` on avatud lähtekoodiga käsurea tööriist, mis lihtsustab arendaja töövoogu rakenduste loomisel ja juurutamisel Azure’i keskkonnas.

[AZD mallid](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) on standardiseeritud hoidlad, mis sisaldavad näidisrakenduste koodi, _infrastruktuur-koodina_ varasid ning `azd` konfiguratsioonifaile ühtse lahenduse arhitektuuri jaoks. Infrastruktuuri loomine on lihtne kui käsklus `azd provision` – samas käsklusega `azd up` saad nii infrastruktuuri luua **kui ka** oma rakenduse ühe korraga juurutada!

Seega võib rakenduse arendusprotsessi käivitamine olla lihtne – vali lihtsalt sobiv _AZD Starter mall_, mis vastab kõige paremini sinu rakenduse ja infrastruktuuri vajadustele – seejärel kohanda hoidlasse vastavalt oma stsenaariumi nõuetele.

Enne alustamist veendu, et sul on paigaldatud Azure Developer CLI.

1. Ava VS Code terminal ja kirjuta see käsk:

      ```bash title="" linenums="0"
      azd version
      ```

1. Sa peaksid nägema midagi sellist!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Nüüd oled valmis valima ja juurutama malliga azd abil**

---

## 2. Malli valik

Microsoft Foundry platvorm sisaldab [komplekti soovitatud AZD malle](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), mis katavad populaarsed lahendusstsenaariumid nagu _mitme agendi töövoo automatiseerimine_ ja _mitmemodaalne sisutöötlus_. Sa saad neid malle avastada ka Microsoft Foundry portaali külastades.

1. Mine lehele [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Logi sisse Microsoft Foundry portaali, kui küsitakse – näed midagi sellist.

![Pick](../../../../../translated_images/et/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** (baasmallid) on sinu stardimallid:

1. [ ] [Alusta AI vestlusega](https://github.com/Azure-Samples/get-started-with-ai-chat), mis juurutab lihtsa vestlusrakenduse _oma andmetega_ Azure Container Apps keskkonda. Kasuta seda lihtsa AI vestlusboti stsenaariumi uurimiseks.
1. [X] [Alusta AI agentidega](https://github.com/Azure-Samples/get-started-with-ai-agents), mis juurutab ka standardse AI agendi (Foundry agentidega). Kasuta seda, et tutvuda agentidel põhinevate AI lahendustega, mis hõlmavad tööriistu ja mudeleid.

Ava teine link uues brauseri vahelehes (või kliki seotud kaardil `Open in GitHub`). Sa näed selle AZD malli hoidlat. Võta hetk ja tutvu README-ga. Rakenduse arhitektuur näeb välja selline:

![Arch](../../../../../translated_images/et/architecture.8cec470ec15c65c7.webp)

---

## 3. Malli aktiveerimine

Proovime seda malli juurutada ja veenduda, et see on kehtiv. Järgime juhiseid [Alustamine](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) osas.

1. Vali mallide hoidlate jaoks töökeskkond:

      - **GitHub Codespaces**: Klõpsa [seda linki](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ja kinnita `Create codespace`.
      - **Kohalik kloon või arenduscontainer**: Klooni `Azure-Samples/get-started-with-ai-agents` ja ava see VS Code’is.

1. Oota, kuni VS Code terminal on valmis, ja kirjuta järgmine käsk:

   ```bash title="" linenums="0"
   azd up
   ```

Täida protsessinõuete sammud, mis selle käsu käivitavad:

1. Sind palutakse sisse logida Azure’i - järgi autentimisjuhiseid.
1. Sisesta unikaalne keskkonna nimi – näiteks mina kasutasin `nitya-mshack-azd`.
1. See loob `.azure/` kausta - näed selles alamkausta keskkonna nimega.
1. Sind palutakse valida tellimuse nimi – vali vaikimisi.
1. Sind palutakse valida asukoht – kasuta `East US 2`.

Nüüd oota infrastruktuuri loomise lõpetamist. **See võtab 10-15 minutit**

1. Kui valmis, näed oma konsoolis EDULÕPPU sõnumit (SUCCESS) nagu see:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```

1. Sinu Azure portaalis on nüüd loodud ressursside grupp selle keskkonna nimega:

      ![Infra](../../../../../translated_images/et/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Nüüd oled valmis valideerima juurutatud infrastruktuuri ja rakendust**.

---

## 4. Malli valideerimine

1. Külasta Azure portaalis [Resource Groups](https://portal.azure.com/#browse/resourcegroups) lehte – logi sisse, kui küsitakse.
1. Klõpsa oma keskkonna nimega RG peale – näed eeltoodud lehte

      - klõpsa Azure Container Apps ressursil
      - klõpsa _Essentials_ sektsioonis rakenduse aadressil (paremal ülal)

1. Sa peaksid nägema hostitud rakenduse kasutajaliidest, mis näeb välja selline:

   ![App](../../../../../translated_images/et/03-test-application.471910da12c3038e.webp)

1. Proovi küsida paar [näidisküsimust](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Küsi: ```Mis on Prantsusmaa pealinn?``` 
      1. Küsi: ```Milline on parim telk alla 200 dollari kahe inimese jaoks ja mida see sisaldab?```

1. Sa peaksid saama vastused, mis sarnanevad alltoodud näidisele. _Aga kuidas see töötab?_ 

      ![App](../../../../../translated_images/et/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agendi valideerimine

Azure Container App juurutab lõpp-punkti, mis ühendub selle malli Microsoft Foundry projekti AI Agendiga. Vaatame, mida see tähendab.

1. Naase Azure portaalis oma ressursside grupi _Üldinfo_ lehele.

1. Klõpsa selles nimekirjas `Microsoft Foundry` ressursil.

1. Sa peaksid nägema seda. Klõpsa nupul `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/et/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Sa näed Foundry projekti lehte oma AI rakenduse kohta.
   ![Project](../../../../../translated_images/et/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klõpsa `Agents` – näed oma projektis vaikimisi loodud agenti.
   ![Agents](../../../../../translated_images/et/06-visit-agents.bccb263f77b00a09.webp)

1. Vali see – näed agendi detaile. Pane tähele järgmist:

      - Agendil on vaikimisi valikuks File Search (failide otsing) (alati)
      - Agendi `Knowledge` näitab, et on üles laaditud 32 fail (failide otsinguks)
      ![Agents](../../../../../translated_images/et/07-view-agent-details.0e049f37f61eae62.webp)

1. Vaata vasakpoolses menüüs valikut `Data+indexes` ja klõpsa detailide nägemiseks.

      - Sa peaksid nägema 32 üles laaditud andmefaili teadmustele.
      - Need vastavad 12 kliendi failile ja 20 toote failile kataloogis `src/files`.
      ![Data](../../../../../translated_images/et/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Sa valideerisid agendi töö!** 

1. Agendi vastused põhinevad neis failides olevatel teadmistel.
1. Nüüd võid esitada küsimusi selle andmete kontekstis ja saada seotud vastuseid.
1. Näide: `customer_info_10.json` kirjeldab Amanda Perez kolme ostu.

Mine tagasi brauseri vahelehele Container App lõpp-punktiga ja küsi: `Millised tooted kuuluvad Amanda Perez’ile?`. Sa peaksid nägema midagi sellist:

![Data](../../../../../translated_images/et/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agendi mänguväljak

Loome veidi rohkem tunnetust Microsoft Foundry võimaluste kohta, lastes agendil ringi käia Agents Playground’is.

1. Naase Microsoft Foundry `Agents` lehele – vali vaikimisi agent.
1. Klõpsa valikul `Try in Playground` – sa saad sellise mänguväljaku kasutajaliidese.
1. Küsi sama küsimust: `Millised tooted kuuluvad Amanda Perez’ile?`

    ![Data](../../../../../translated_images/et/09-ask-in-playground.a1b93794f78fa676.webp)

Sa saad sama (või sarnase) vastuse – aga ka lisainfot, mida saad kasutada oma agentlikku rakendust kvaliteedi, kulu ja jõudluse mõistmiseks. Näiteks:

1. Pane tähele, et vastuses viidatakse andmefailidele, mida kasutati vastuse "maandumisel".
1. Hõljuta kursorit mõne faili sildi kohal – kas andmed vastavad su päringule ja kuvatud vastusele?

Sa näed ka _statistika_ rida vastuse all.

1. Hõljuta mis tahes näidu kohal – nt Safety (turvalisus). Sa näed midagi sellist.
1. Kas hinnang vastab sinu intuitsioonile vastuse turvalisuse taseme kohta?

      ![Data](../../../../../translated_images/et/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Sisseehitatud jälgitavus

Jälgitavus tähendab, et instrumenteerid oma rakendust andmete genereerimiseks, mida saab kasutada töö toimimise mõistmiseks, veaotsinguks ja optimeerimiseks. Selle tunnetamiseks:

1. Klõpsa nupul `View Run Info` – sa näed seda vaadet. See on näide [Agentide jälgimisest](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) töös. _Seda vaadet saad ka klõpsates üleval menüüst Thread Logs_.

   - Näed jooksusamme ja tööriistu, mida agent kasutas
   - Ülevaade kogu tokenite arvust (võrreldes väljundtokenite kasutusega) vastuse puhul
   - Mõistad latentsust ja kus aega täpsemalt kulub täitmisel

      ![Agent](../../../../../translated_images/et/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klõpsa vahekaarti `Metadata`, et näha täiendavaid atribuute jooksu kohta, mis võivad pakkuda kasulikku konteksti hilisemaks veaotsinguks.

      ![Agent](../../../../../translated_images/et/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klõpsa vahekaarti `Evaluations`, et näha agentide vastuste automaatseid hinnanguid. Need hõlmavad turvalisushinnanguid (nt enesevigastamise potentsiaal) ja agendi spetsiifilisi hinnanguid (nt kavatsuse lahendus, ülesande järgimine).

      ![Agent](../../../../../translated_images/et/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Lõpuks klõpsa külgmenüüs vahekaarti `Monitoring`.

      - Vali avaneval lehel vahekaart `Resource usage` ja vaata mõõdikuid.
      - Jälgi rakenduse kasutust kulude (tokenite) ja koormuse (päringute) osas.
      - Jälgi rakenduse latentsust esimese baidi (sisendi töötlemine) ja viimase baidi (väljundi) puhul.

      ![Agent](../../../../../translated_images/et/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Keskkonnamuutujad

Senimaani oleme vaadanud juurutust brauseris – ja kinnitanud, et meie infrastruktuur on loodud ning rakendus töötab. Aga et töötada rakenduse _koodi-põhiselt_, peame seadistama oma kohalikud arenduskeskkonna vastavate muutujatega, mida on vaja nende ressurssidega töötamiseks. `azd` kasutamine teeb selle lihtsaks.

1. Azure Developer CLI [kasutab keskkonnamuutujaid](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash), et salvestada ja hallata rakenduse juurutuse konfiguratsiooni sätteid.

1. Keskkonnamuutujad salvestatakse failis `.azure/<env-name>/.env` – see piiritleb need vastava `env-name` keskkonnaga, mida kasutatakse juurutamise ajal, ja aitab eraldada keskkondi erinevateks sihtkohtadeks samas hoidlas.

1. Keskkonnamuutujad laetakse automaatselt `azd` käsu poolt iga kord, kui see täidab konkreetset käsku (nt `azd up`). Pane tähele, et `azd` ei loe automaatselt _OS taseme_ keskkonnamuutujaid (nt mis on seatud käsureas) – selle asemel tuleks kasutada `azd set env` ja `azd get env`, et infot skriptide vahel edastada.


Proovime mõnda käsku:

1. Hangi kõik `azd` keskkonnamuutujad, mis on seatud praeguses keskkonnas:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Sa näed midagi sellist:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Hangi konkreetne väärtus – näiteks, kas on seatud `AZURE_AI_AGENT_MODEL_NAME` väärtus

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Sa näed midagi sellist – see ei olnud vaikimisi seatud!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Sea uus keskkonnamuutuja `azd` jaoks. Siin uuendame agendi mudeli nime. _Pane tähele: kõik muudatused kajastuvad kohe failis `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nüüd peaks väärtus olema määratud:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Mõned ressursid on püsivad (nt mudelijuurutused) ja vajavad rohkemat kui lihtsalt `azd up`, et sundida nende uuesti juurutamist. Proovime originaalse juurutuse maha võtta ja seejärel uuesti keskkonnamuutujate muutustega juurutada.

1. **Värskenda** Kui oled varem azd malliga infrastruktuuri juurutanud – saad kohalike keskkonnamuutujate oleku värskendada vastavalt sinu Azure juurutuse praegusele olekule järgmise käsuga:

      ```bash title="" linenums="0"
      azd env refresh
      ```

See on võimas viis _sünkroonida_ keskkonnamuutujaid kahe või enama kohalikus arenduskeskkonnas (nt meeskond mitme arendajaga) – võimaldades juurutatud infrastruktuuril toimida keskmise tõena keskkonnamuutuja oleku kohta. Meeskonnaliikmed lihtsalt _värskendavad_ muutujaid, et uuesti sünkroonis olla.

---

## 9. Palju õnne 🏆

Sa just lõpetasid otsast lõpuni töövoo, kus sa:

- [X] Väljasidjustasid kasutatava AZD malli
- [X] Avasid malli toetatud arenduskeskkonnas
- [X] Juurutasid malli ja kontrollisid selle toimimist

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud, kasutades AI tõlke teenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me pingutame täpsuse nimel, palun pidage meeles, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles loetakse autoriteetseks allikaks. Olulise info puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tekkivate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
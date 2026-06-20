# 2. Kinnita mall

> Kinnitatud `azd 1.25.6` vastu 2026. aasta juunis.

!!! tip "SELLE MEESE OSA LÕPUS OSAKSTUD OMA OSKUSE"

    - [ ] Analüüsida tehisintellekti lahenduse arhitektuuri
    - [ ] Mõista AZD juurutusvoogu
    - [ ] Kasutada GitHub Copilot-i abi saamiseks AZD kasutamisel
    - [ ] **Labor 2:** AI agentide malli juurutamine ja valideerimine

---


## 1. Sissejuhatus

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ehk `azd` on avatud lähtekoodiga käsureatööriist, mis lihtsustab arendaja töövoogu rakenduste loomisel ja juurutamisel Azure’i platvormile. 

[AZD mallid](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) on standardiseeritud hoidlad, mis sisaldavad näidisrakenduse koodi, infrastruktuuri-koode varasid ja `azd` konfiguratsioonifaile tervikliku lahenduse arhitektuuri jaoks. Infrastruktuuri loomine on sama lihtne kui `azd provision` käsk — samas kui `azd up` võimaldab sul korraga infrastruktuuri luua **ja** rakenduse juurutada!

Nii on rakenduse arendusprotsessi alustamine sama lihtne kui leida sobiv _AZD algusmall_, mis vastab kõige paremini sinu rakenduse ja infrastruktuuri vajadustele — ja kohandada hoidlat vastavalt oma stsenaariumi nõuetele.

Enne alustamist veendume, et sul on Azure Developer CLI installitud.

1. Ava VS Code terminal ja sisesta see käsk:

      ```bash title="" linenums="0"
      azd version
      ```

1. Sa peaksid nägema midagi sellist!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Nüüd oled valmis valima ja juurutama malli azd abil**

---

## 2. Malle valimine

Microsoft Foundry platvormiga tuleb kaasa [komplekt soovitatud AZD malle](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), mis katavad populaarseid lahendussituatsioone nagu _mitmeagendi töövoo automatiseerimine_ ja _mitme modaalne sisu töötlemine_. Neid malle saab avastada ka Microsoft Foundry portaali külastades.

1. Külastage aadressi [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Logi sisse Microsoft Foundry portaali, kui küsitakse – näed midagi sellist.

![Pick](../../../../../translated_images/et/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** valikud on sinu stardimallid:

1. [ ] [Alusta AI-vestlusega](https://github.com/Azure-Samples/get-started-with-ai-chat), mis juurutab lihtsa vestlusrakenduse _sinuga seotud andmetega_ Azure Container Apps keskkonda. Kasuta seda lihtsa tehisintellekti vestlusroboti stsenaariumi uurimiseks.
1. [X] [Alusta AI-agentidega](https://github.com/Azure-Samples/get-started-with-ai-agents), mis juurutab ka standardse AI agendi (Foundry agentidega). Kasuta seda, et tutvuda agentipõhiste tehisintellekti lahendustega, mis kasutavad tööriistu ja mudeleid.

Külasta teist linki uues brauseri vahelehes (või klõpsa seotud kaardi juures „Open in GitHub“). Sa peaksid nägema seda AZD malli hoidlat. Vii minut aega, et lugeda README. Rakenduse arhitektuur näeb välja selline:

![Arch](../../../../../translated_images/et/architecture.8cec470ec15c65c7.webp)

---

## 3. Momi mall aktiveerimine

Proovime seda malli juurutada ja veenduda, et see on kehtiv. Järgime juhiseid [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) jaotises.

1. Vali alamkeskonnaks sobiv töökeskkond malli hoidla jaoks:

      - **GitHub Codespaces**: Klõpsa [sellele lingile](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ja kinnita `Create codespace`
      - **Kohalik kloon või arenduskonteiner**: Klooni `Azure-Samples/get-started-with-ai-agents` ja ava see VS Code’is

1. Oota, kuni VS Code terminal on kasutamiseks valmis, seejärel sisesta järgmine käsk:

   ```bash title="" linenums="0"
   azd up
   ```

Täida töövoo sammud, mida see käivitab:

1. Sinult küsitakse Azure sisse logimist – järgi juhiseid autentimiseks
1. Sisesta unikaalne keskkonnanimi – näiteks mina kasutasin `nitya-mshack-azd`
1. See loob `.azure/` kausta – näed selle sees alamkausta keskkonnanimega
1. Sinult küsitakse tellimuse nime – vali vaikimisi
1. Sinult küsitakse asukohta – kasuta `East US 2`

Nüüd oota, kuni provisioneerimine lõpeb. **See võtab 10-15 minutit**

1. Kui valmis, näed oma konsoolis sellist EDU sõnumit:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Sinu Azure portaalis on nüüd loodud selle keskkonnanimega ressursigrupp:

      ![Infra](../../../../../translated_images/et/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Nüüd oled valmis valideerima juurutatud infrastruktuuri ja rakendust**.

---

## 4. Momi valideerimine

1. Mine Azure portaali [Resource Groups](https://portal.azure.com/#browse/resourcegroups) lehele – logi sisse, kui küsitakse
1. Klõpsa oma keskkonnanimele vastavat RG-d – näed ülalkirjeldatud lehekülge

      - klõpsa Azure Container Apps ressursil
      - klõpsa rakenduse URL-ile _Essentials_ sektsioonis (paremas ülanurgas)

1. Sa peaksid nägema hostitud rakenduse esiosa kasutajaliidest sellisena:

   ![App](../../../../../translated_images/et/03-test-application.471910da12c3038e.webp)

1. Proovi esitada paar [näidisküsimust](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Küsi: ```Mis on Prantsusmaa pealinn?``` 
      1. Küsi: ```Milline telk on kahe inimese jaoks parem kui $200 ja millised funktsioonid sel on?```

1. Sa peaksid saama vastused, mis on sarnased allpool näidatuga. _Aga kuidas see töötab?_ 

      ![App](../../../../../translated_images/et/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agendi valideerimine

Azure Container App juurutab lõpp-punkti, mis ühendub Microsoft Foundry projekti AI agendiga selle malli jaoks. Vaatame, mida see tähendab.

1. Naase Azure portaali oma ressursigrupi _Overview_ lehele

1. Klõpsa selles nimekirjas `Microsoft Foundry` ressursil

1. Sa peaksid nägema seda. Klõpsa `Go to Microsoft Foundry Portal` nupul. 
   ![Foundry](../../../../../translated_images/et/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Sa peaksid nägema Foundry projekti lehte oma tehisintellekti rakenduse jaoks
   ![Project](../../../../../translated_images/et/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klõpsa `Agents` – näed vaikimisi projekti agenti
   ![Agents](../../../../../translated_images/et/06-visit-agents.bccb263f77b00a09.webp)

1. Vali see – näed agendi detaile. Pööra tähelepanu järgmisele:

      - Agent kasutab vaikimisi alati File Searchi (failide otsingut)
      - Agendi `Knowledge` näitab, et üleslaaditud on 32 faili (failiotsingu jaoks)
      ![Agents](../../../../../translated_images/et/07-view-agent-details.0e049f37f61eae62.webp)

1. Otsi vasakult menüüst `Data+indexes` võimalust ja klõpsa detailide nägemiseks.

      - Sa näed 32 andmefaili, mis on üles laetud teadmisteks.
      - Need vastavad 12 kliendifailile ja 20 tootefailile kaustas `src/files`
      ![Data](../../../../../translated_images/et/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Oled agendi toimimist valideerinud!** 

1. Agendi vastused tuginevad nende failide teadmistel. 
1. Sa võid nüüd esitada küsimusi, mis on seotud nende andmetega, ja saada põhjendatud vastuseid.
1. Näide: `customer_info_10.json` kirjeldab kolme ostu, mida tegi "Amanda Perez".

Mine tagasi brauseri vahekaardile, kus on Container App lõpp-punkt, ja küsi: `Milliseid tooteid Amanda Perez omab?`. Sa peaksid nägema midagi sellist:

![Data](../../../../../translated_images/et/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agendi mänguväljak

Loome veidi parema tunnetuse Microsoft Foundry võimekuse kohta, lastes agendil proovida Agents Playground’i.

1. Naase Microsoft Foundry ‘Agents’ lehele – vali vaikimisi agent
1. Klõpsa `Try in Playground` võimalusel – peaksid nägema sellist mänguväljaku kasutajaliidest
1. Küsi sama küsimus: `Milliseid tooteid Amanda Perez omab?`

    ![Data](../../../../../translated_images/et/09-ask-in-playground.a1b93794f78fa676.webp)

Sa saad sama (või sarnase) vastuse – aga saad ka lisainfot, mida kasutada agendi rakenduse kvaliteedi, hinna ja jõudluse mõistmiseks. Näiteks:

1. Pane tähele, et vastus viitab andmefailidele, millele vastus tugineb
1. Hoia kursorit mõnel failisildil – kas andmed vastavad sinu päringule ja kuvatud vastusele?

Näed ka _statistikat_ rea vastuse all. 

1. Hoia kursorit mõnel mõõdikul – nt Safety (ohutus). Näed midagi sellist
1. Kas hinnang vastab sinu intuitsioonile vastuse ohutuse taseme kohta?

      ![Data](../../../../../translated_images/et/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Sisseehitatud jälgitavus

Jälgitavus tähendab oma rakenduse instrumenteerimist andmete genereerimiseks, mida saab kasutada rakenduse toimimise mõistmiseks, veaotsinguks ja optimeerimiseks. Selle tunnetamiseks:

1. Klõpsa `View Run Info` nuppu – näed seda vaadet. See on näide [Agentide jälgimisest](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground). _Sama vaate saad ka klõpsates ülemisel menüüribal Thread Logs_.

   - Saa aimu käivitusetappidest ja agenti kasutatavatest tööriistadest
   - Mõista kogutokenite arvu (võrreldes väljundtokenite kasutusega) vastuses
   - Mõista latentsust ja kus täitmisel aeg kulub

      ![Agent](../../../../../translated_images/et/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klõpsa `Metadata` vahekaarti, et näha täiendavaid atribuute jooksule, mis võivad hiljem veaotsingus kasulikud olla.

      ![Agent](../../../../../translated_images/et/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klõpsa `Evaluations` vahekaarti, et näha agendi vastustele automaatseid hinnanguid. Neisse kuuluvad ohutuse hinnangud (nt enesevigastamise oht) ja agendipõhised hinnangud (nt kavatsuse tuvastamine, ülesande järgimine).

      ![Agent](../../../../../translated_images/et/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Lõpuks klõpsa vasakmenüüs „Monitoring“ vahekaarti.

      - Vali kuvataval lehel vahekaart `Resource usage` ja vaata mõõdikuid.
      - Jälgi rakenduse kasutust kulude (tokenite) ja koormuse (päringute) põhjal.
      - Jälgi rakenduse latentsust esimese baidi (sisendi töötlemine) ja viimase baidi (väljundi) osas.

      ![Agent](../../../../../translated_images/et/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Keskkonnamuutujad

Nii kaugele oleme läbinud juurutamise brauseris – ja kinnitanud, et meie infrastruktuur on loodud ning rakendus töötab. Kuid rakendusega töötamiseks _esimese koodina_ peame seadistama oma kohalikus arenduskeskkonnas vajalikke muutujaid, mis on vajalikud nende ressurssidega töötamiseks. `azd` kasutamine teeb selle lihtsaks.

1. Azure Developer CLI [kasutab keskkonnamuutujaid](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash), et salvestada ja hallata konfiguratsiooniseadeid rakenduse juurutuste jaoks.

1. Keskkonnamuutujad salvestatakse failis `.azure/<env-name>/.env` – see sidustab need juurutamisel kasutatud `env-name` keskkonnaga ja aitab isolleerida erinevaid keskkondi ühe hoidla erinevate juurutuskohtade vahel.

1. Muutujad laetakse automaatselt käsu `azd` poolt iga kord, kui see täidab konkreetse käsu (nt `azd up`). Pane tähele, et `azd` ei loe automaatselt _OS taseme_ keskkonnamuutujaid (nt mis on seatud shellis) – selle asemel kasuta `azd set env` ja `azd get env`, et skriptides infot üle kanda.


Proovime mõnda käsku:

1. Kogu selle keskkonna `azd` jaoks seatud keskkonnamuutujate nimistu:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Näed midagi sellist:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Saa konkreetse väärtuse teave – näiteks tahaksin teada, kas `AZURE_AI_AGENT_MODEL_NAME` on seatud

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Näed midagi sellist – vaikimisi ei olnud see seatud!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Sea uus keskkonnamuutuja `azd` jaoks. Siin uuendame agendi mudeli nime. _Märkus: tehtud muudatused kajastuvad kohe failis `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nüüd peaks väärtus olema seatud:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Mõned ressursid on püsivad (nt mudelite juurutused) ja nõuavad muud kui lihtsalt `azd up`, et jõuliselt uuesti juurutada. Proovime originaalse juurutuse maha võtta ja ümber juurutada muudatustega keskkonnamuutujates.

1. **Värskenda** Kui oled varem mõne azd malliga infrastruktuuri juurutanud – saad oma kohalike keskkonnamuutujate olekut sünkroonida Azure juurutuse praeguse olekuga, kasutades seda käsku:

      ```bash title="" linenums="0"
      azd env refresh
      ```

See on võimas viis _sünkroonida_ keskkonnamuutujaid kahe või enama kohaliku arenduskeskkonna vahel (nt mitme arendajaga meeskond) – võimaldades juurutatud infrastruktuuril toimida keskkonnamuutujate oleku tõeallikana. Meeskonnaliikmed saavad lihtsalt _värskendada_ muutujaid, et uuesti sünkroonis olla.

---

## 9. Palju õnne 🏆

Sa just lõpetasid täieliku töövoo, kus sa:

- [X] Valisid kasutatava AZD malli
- [X] Avasid malli toetatud arenduskeskkonnas
- [X] Juurutasid malli ja kontrollisid selle toimimist

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
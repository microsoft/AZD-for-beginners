# 2. Šablono patikrinimas

> Patikrinta „azd 1.27.1“ versija 2026 m. liepos mėn.

!!! tip "PABAIGĘ ŠĮ MODULĮ JŪS GALĖSITE"

    - [ ] Analizuoti DI sprendimų architektūrą
    - [ ] Suprasti AZD diegimo eigą
    - [ ] Naudoti GitHub Copilot pagalbai dėl AZD naudojimo
    - [ ] **Laboratorinis darbas 2:** Įdiegti ir patikrinti AI Agentų šabloną

---


## 1. Įvadas

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) arba `azd` yra atviro kodo komandinės eilutės įrankis, supaprastinantis programuotojo darbo eigą kuriant ir diegiant programas Azure aplinkoje.

[AZD šablonai](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) yra standartizuotos saugyklos, kuriose yra pavyzdinis programos kodas, _infrastruktūra kaip kodas_ turtas ir `azd` konfigūracijos failai vientisam sprendimų architektūros kūrimui. Infrastruktūros paruošimas tampa toks paprastas, kaip įvykdyti komandą `azd provision` - o naudojant `azd up` galite vienu metu įdiegti infrastruktūrą **ir** programą!

Todėl jūsų programos kūrimo proceso pradžia gali būti tokia paprasta, kaip rasti tinkamiausią _AZD Starter šabloną_, kuris atitinka jūsų programos ir infrastruktūros poreikius, ir pritaikyti saugyklą pagal savo scenarijaus reikalavimus.

Prieš pradėdami, įsitikinkite, kad turite įdiegę Azure Developer CLI.

1. Atidarykite VS Code terminalą ir įveskite šią komandą:

      ```bash title="" linenums="0"
      azd version
      ```

1. Turėtumėte pamatyti kažką panašaus!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Dabar galite pasirinkti ir diegti šabloną naudodami azd**

---

## 2. Šablono pasirinkimas

Microsoft Foundry platforma pateikia [rekomenduojamų AZD šablonų rinkinį](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), apimantį populiarius sprendimų scenarijus, tokius kaip _daugialypio agentų darbo srautų automatizavimas_ ir _daugialypio turinio apdorojimas_. Šiuos šablonus taip pat galite rasti apsilankę Microsoft Foundry portale.

1. Aplankykite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Prisijunkite prie Microsoft Foundry portalo, kai būsite paprašyti – matysite kažką panašaus.

![Pasirinkimas](../../../../../translated_images/lt/01-pick-template.60d2d5fff5ebc374.webp)


**Basic** parinktys yra jūsų pradiniai šablonai:

1. [ ] [Pradėti su AI Pokalbiu](https://github.com/Azure-Samples/get-started-with-ai-chat), kuris įdiegia paprastą pokalbių programėlę _su jūsų duomenimis_ Azure Container Apps aplinkoje. Naudokite tai norėdami ištirti bazinį DI pokalbių scenarijų.
1. [X] [Pradėti su AI Agentais](https://github.com/Azure-Samples/get-started-with-ai-agents), kuris taip pat įdiegia standartinį AI Agentą (naudojant Foundry Agentus). Naudokite tai, kad susipažintumėte su agentiniais DI sprendimais, apimančiais įrankius ir modelius.

Aplankykite antrą nuorodą naujame naršyklės skirtuke (arba spustelėkite `Open in GitHub` atitinkamai kortelei). Turėtumėte pamatyti saugyklą šiam AZD šablonui. Skirkite minutę README failo peržiūrai. Programos architektūra atrodo taip:

![Architektūra](../../../../../translated_images/lt/architecture.8cec470ec15c65c7.webp)

---

## 3. Šablono aktyvavimas

Pabandykime įdiegti šį šabloną ir įsitikinti, kad jis galioja. Vadovausimės [Pradžios](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) skyriuje pateiktomis gairėmis.

1. Pasirinkite darbo aplinką šablono saugyklai:

      - **GitHub Codespaces**: Spustelėkite [šią nuorodą](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ir patvirtinkite `Create codespace`
      - **Vietinė kopija arba kūrimo konteineris**: Nuklonuokite `Azure-Samples/get-started-with-ai-agents` ir atidarykite VS Code

1. Palaukite, kol VS Code terminalas bus paruoštas, tada įveskite šią komandą:

   ```bash title="" linenums="0"
   azd up
   ```

Užbaikite darbo eigas, kurias ši komanda suaktyvins:

1. Jums bus paprašyta prisijungti prie Azure - atlikite autentifikavimo nurodymus
1. Įveskite unikalų aplinkos pavadinimą – pvz., aš naudoju `nitya-mshack-azd`
1. Tai sukurs `.azure/` aplanką – matysite poaplankį su aplinkos vardu
1. Jums bus pasiūlyta pasirinkti prenumeratos pavadinimą – pasirinkite numatytąją
1. Jums bus pasiūlyta pasirinkti vietą – naudokite `East US 2`

Dabar palaukite, kol įvyks infrastruktūros paruošimas. **Tai užtrunka 10–15 minučių**

1. Baigus, jūsų konsolėje pasirodys SEKMIŲ (SUCCESS) pranešimas, panašus į šį:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Jūsų Azure portale dabar bus paruošta išteklių grupė su tuo aplinkos pavadinimu:

      ![Infrastruktūra](../../../../../translated_images/lt/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Dabar galite patikrinti įdiegtos infrastruktūros ir programos galiojimą**.

---

## 4. Šablono patikrinimas

1. Aplankykite Azure portalo [Išteklių grupių](https://portal.azure.com/#browse/resourcegroups) puslapį – prisijunkite, jei būsite paprašyti
1. Spustelėkite RG, kur atitinka jūsų aplinkos pavadinimą – pamatysite aukščiau esančią puslapio vaizdą

      - spustelėkite Azure Container Apps išteklių
      - spustelėkite Programos URL _Pagrindinėse_ (Essentials) sekcijos dalių viršuje dešinėje

1. Turėtumėte pamatyti tokią talpinamą programos vartotojo sąsają:

   ![Programa](../../../../../translated_images/lt/03-test-application.471910da12c3038e.webp)

1. Išbandykite užduoti keletą [pavyzdinių klausimų](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Paklauskite: ```Kokia yra Prancūzijos sostinė?``` 
      1. Paklauskite: ```Kokį geriausią palapinę iki 200 USD rekomenduotumėte dviem žmonėms ir kokios jos savybės?```

1. Turėtumėte gauti atsakymus, panašius į parodytus žemiau. _Bet kaip tai veikia?_

      ![Programa](../../../../../translated_images/lt/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentų patikrinimas

Azure Container App įdiegia galinį tašką, kuris jungiasi prie AI agente, įdiegtos Microsoft Foundry projekte šiam šablonui. Panagrinėkime, ką tai reiškia.

1. Grįžkite į Azure portalo _Apžvalgos_ puslapį savo išteklių grupėje

1. Spustelėkite `Microsoft Foundry` išteklių iš sąrašo

1. Turėtumėte pamatyti tai. Spustelėkite mygtuką `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/lt/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Pamatysite Foundry projektą jūsų DI programai
   ![Projektas](../../../../../translated_images/lt/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Spustelėkite `Agents` – matysite numatytąjį Agento įdiegimą projekte
   ![Agentai](../../../../../translated_images/lt/06-visit-agents.bccb263f77b00a09.webp)

1. Pasirinkite jį – pamatysite Agento duomenis. Atkreipkite dėmesį į šiuos dalykus:

      - Agentas pagal numatymą naudoja Failų Paiešką (visada)
      - Agentas „Knowledge“ rodo, kad įkeltas 32 failų rinkinys (failų paieškai)
      ![Agentai](../../../../../translated_images/lt/07-view-agent-details.0e049f37f61eae62.webp)

1. Kairėje meniu raskite „Data+indexes“ parinktį ir spustelėkite, kad pamatytumėte detales.

      - Matysite 32 žinių failus
      - Tai atitinka 12 klientų failų ir 20 produktų failų, esančių `src/files`
      ![Duomenys](../../../../../translated_images/lt/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Jūs patvirtinote Agento veikimą!**

1. Agento atsakymai grindžiami žiniomis iš tų failų.
1. Dabar galite užduoti klausimus, susijusius su tais duomenimis, ir gauti pagrįstus atsakymus.
1. Pavyzdys: `customer_info_10.json` aprašo 3 pirkinius, kuriuos atliko „Amanda Perez“

Grįžkite į naršyklės skirtuką su Container App galiniu tašku ir paklauskite: `Kokius produktus turi Amanda Perez?`. Turėtumėte pamatyti kažką panašaus:

![Duomenys](../../../../../translated_images/lt/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agentų demonstravimas

Sužinokime daugiau apie Microsoft Foundry galimybes, išbandydami Agentą Agentų demonstravimo zonoje (Playground).

1. Grįžkite į Microsoft Foundry `Agents` puslapį – pasirinkite numatytąjį agentą
1. Spustelėkite parinktį `Try in Playground` – turėtumėte gauti tokią demonstracinę vartotojo sąsają
1. Užduokite tą patį klausimą: `Kokius produktus turi Amanda Perez?`

    ![Duomenys](../../../../../translated_images/lt/09-ask-in-playground.a1b93794f78fa676.webp)

Gaunate tą patį (ar panašų) atsakymą, bet taip pat gaunate papildomos informacijos, leidžiančios suprasti agentinės programėlės kokybę, sąnaudas ir našumą. Pavyzdžiui:

1. Atkreipkite dėmesį, kad atsakyme nurodomi duomenų failai, naudojami atsakymo pagrindimui
1. Užveskite pelės žymeklį virš bet kurio failo ženklo – ar duomenys atitinka jūsų užklausą ir pateiktą atsakymą?

Po atsakymo taip pat matote _statistikos_ eilutę.

1. Užveskite pelės žymeklį virš bet kurio rodiklio – pvz., Safety (saugumas). Pamatysite tokį vaizdą
1. Ar įvertinimas atitinka jūsų intuiciją apie atsakymo saugumo lygį?

      ![Duomenys](../../../../../translated_images/lt/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Integruota stebėsena

Stebėsena reiškia jūsų programos instrumentavimą, kad generuotų duomenis, kuriuos galima naudoti veiklos supratimui, trikčių šalinimui ir optimizavimui. Norėdami susipažinti:

1. Spustelėkite mygtuką `View Run Info` – turėtumėte pamatyti tokią peržiūrą. Tai yra [Agento sekimo](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) pavyzdys veikiant. _Šią peržiūrą taip pat galite atidaryti pasirinkdami Thread Logs pagrindiniame meniu_.

   - Susipažinkite su vykdymo veiksmais ir agento naudojamais įrankiais
   - Sužinokite bendrą tokenų skaičių (priešingai nei išeinančių tokenų kiekis)
   - Supraskite vėlavimą ir kur vykdymo laikas yra išnaudojamas

      ![Agentas](../../../../../translated_images/lt/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Spustelėkite skirtuką `Metadata`, kad pamatytumėte papildomas vykdymo savybes, kurios gali būti naudingos trikčių šalinimui vėliau.

      ![Agentas](../../../../../translated_images/lt/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Spustelėkite skirtuką `Evaluations`, kad pamatytumėte automatinės agento atsakymų įvertinimą. Čia yra saugumo vertinimai (pvz., savęs žalojimo rizika) ir agento specifiniai vertinimai (pvz., ketinimų išaiškinimas, užduoties laikymasis).

      ![Agentas](../../../../../translated_images/lt/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Galiausiai spustelėkite skirtuką `Monitoring` šoniniame meniu.

      - Pasirinkite `Resource usage` skirtuką puslapyje – ir peržiūrėkite metrikas.
      - Sekite programos naudojimą pagal kaštus (tokenus) ir apkrovą (užklausas).
      - Sekite programos vėlavimą iki pirmojo baito (įvesties apdorojimas) ir paskutinio baito (išvesties).

      ![Agentas](../../../../../translated_images/lt/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Aplinkos kintamieji

Iki šiol peržiūrėjome diegimą naršyklėje ir patvirtinome, kad infrastruktūra paruošta, o programa veikia. Tačiau norint dirbti su programos kodu, turime sukonfigūruoti savo vietinę kūrimo aplinką atitinkamais kintamaisiais, reikalingais darbui su šiomis ištekliais. Naudojant `azd` tai paprasta.

1. Azure Developer CLI [naudoja aplinkos kintamuosius](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash), kad saugotų ir valdytų konfigūracijos nustatymus programos diegimams.

1. Aplinkos kintamieji saugomi faile `.azure/<env-name>/.env` – tai aprėpia juos pagal diegimo metu naudojamą `env-name` aplinką ir leidžia atskirti skirtingas aplinkas toje pačioje saugykloje.

1. Aplinkos kintamieji automatiškai įkelti komandai `azd` vykdant tam tikrą komandą (pvz., `azd up`). Pastaba – `azd` automatiškai nuskaito ne _OS lygio_ kintamuosius (pvz., nustatytus shell), vietoj to naudokite `azd set env` ir `azd get env`, kad perduotumėte informaciją skriptuose.


Išbandykime kelias komandas:

1. Gaukite visus aplinkos kintamuosius, nustatytus `azd` šioje aplinkoje:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Matysite kažką panašaus:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Gaukite konkretų kintamojo reikšmę – pvz., noriu sužinoti, ar nustatėme `AZURE_AI_AGENT_MODEL_NAME` reikšmę

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Matysite kažką panašaus – ji nebuvo nustatyta pagal numatymą!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Nustatykite naują aplinkos kintamąjį `azd`. Čia atnaujiname agento modelio pavadinimą. _Pastaba: bet kokie pakeitimai tuoj pat atsispindės faile `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Dabar turėtume rasti nustatytą reikšmę:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Atkreipkite dėmesį, kad kai kurie ištekliai yra pastovūs (pvz., modelių diegimai) ir reikės ne tik `azd up` komandos, kad priverstų perdiegimą. Pabandykime pašalinti pradinį diegimą ir įdiegti iš naujo, pakeitus aplinkos kintamuosius.

1. **Atnaujinti** Jei anksčiau diegėte infrastruktūrą naudojant azd šabloną – galite _atnaujinti_ vietinių aplinkos kintamųjų būseną pagal dabartinę Azure diegimo būseną naudodami šią komandą:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Tai yra galingas būdas _sinchronizuoti_ aplinkos kintamuosius tarp dviejų ar daugiau vietinių kūrimo aplinkų (pvz., komanda su keliomis plėtotojais) – leidžiantis įdiegti infrastruktūrą naudoti kaip pagrindinę tiesą dėl aplinkos kintamojo būsenos. Komandos nariai tiesiog _atnaujina_ kintamuosius, kad vėl sinchronizuotųsi.

---

## 9. Sveikiname 🏆

Jūs ką tik užbaigėte visą darbo eigą, kurioje jūs:

- [X] Pasirinkote norimą naudoti AZD šabloną
- [X] Atidarėte šabloną palaikomoje kūrimo aplinkoje
- [X] Įdiegėte šabloną ir patvirtinote, kad jis veikia

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
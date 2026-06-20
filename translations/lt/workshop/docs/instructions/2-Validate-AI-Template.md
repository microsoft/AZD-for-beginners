# 2. Patvirtinti šabloną

> Patikrinta su `azd 1.25.6` 2026 m. birželį.

!!! tip "PASIBAIGUS ŠIAM MODULIUI JŪS GALĖSITE"

    - [ ] Išanalizuoti AI sprendimo architektūrą
    - [ ] Suprasti AZD diegimo darbo eigą
    - [ ] Naudoti GitHub Copilot pagalbai dėl AZD naudojimo
    - [ ] **Laboratorija 2:** Diegti ir patikrinti AI agentų šabloną

---


## 1. Įvadas

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) arba `azd` yra atviro kodo komandų eilutės įrankis, kuris supaprastina kūrėjo darbo eigą kuriant ir diegiant programas Azure.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) yra standartizuotos saugyklos, kurios apima pavyzdinį programos kodą, _infrastructure-as-code_ turtą ir `azd` konfigūracijos failus vientisai sprendimo architektūrai. Infrastruktūros paruošimas tampa toks paprastas kaip komanda `azd provision` - tuo tarpu `azd up` leidžia vienu metu paruošti infrastruktūrą **ir** įdiegti jūsų programą!

Dėl to savo programos kūrimo procesą galima pradėti labai greitai – tereikia rasti tinkamą _AZD Starter šabloną_, kuris geriausiai atitinka jūsų programos ir infrastruktūros poreikius, ir tada pritaikyti saugyklą pagal savo scenarijų reikalavimus.

Prieš pradėdami, įsitikinkime, kad turite įdiegtą Azure Developer CLI.

1. Atidarykite VS Code terminalą ir įveskite šią komandą:

      ```bash title="" linenums="0"
      azd version
      ```

1. Turėtumėte matyti kažką panašaus į tai!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Dabar esate pasiruošę pasirinkti ir diegti šabloną su `azd`**

---

## 2. Šablono pasirinkimas

Microsoft Foundry platforma pateikiama su [rinkiniais rekomenduojamų AZD šablonų](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), kurie apima populiarias sprendimų scenarijas, tokius kaip _multi-agent workflow atomation_ ir _multi-modal content processing_. Taip pat galite atrasti šiuos šablonus apsilankę Microsoft Foundry portale.

1. Apsilankykite [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Prisijunkite prie Microsoft Foundry portalo, kai bus prašoma - pamatysite kažką panašaus.

![Pasirinkti](../../../../../translated_images/lt/01-pick-template.60d2d5fff5ebc374.webp)


The **Pagrindiniai** pasirinkimai yra jūsų pradžios šablonai:

1. [ ] [Pradėkite su AI pokalbiu](https://github.com/Azure-Samples/get-started-with-ai-chat) — diegia pagrindinę pokalbių programą _su jūsų duomenimis_ į Azure Container Apps. Naudokite tai norėdami ištirti pagrindinį AI pokalbio scenarijų.
1. [X] [Pradėti su AI agentais](https://github.com/Azure-Samples/get-started-with-ai-agents) — taip pat diegia standartinį AI agentą (su Foundry Agents). Naudokite tai, kad susipažintumėte su agentiniais AI sprendimais, kuriuose dalyvauja įrankiai ir modeliai.

Apsilankykite antrajame nuorodos skirtuke naršyklėje (arba spustelėkite `Open in GitHub` susijusiai kortelei). Jūs turėtumėte matyti šios AZD šablono saugyklą. Skirkite minutę README peržiūrai. Programos architektūra atrodo taip:

![Architektūra](../../../../../translated_images/lt/architecture.8cec470ec15c65c7.webp)

---

## 3. Šablono aktyvavimas

Pabandykime įdiegti šį šabloną ir įsitikinti, kad jis galioja. Vadovausimės nurodymais sekcijoje [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Pasirinkite darbinę aplinką šablono saugyklai:

      - **GitHub Codespaces**: Spustelėkite [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) ir patvirtinkite `Create codespace`
      - **Local clone or dev container**: Klonuokite `Azure-Samples/get-started-with-ai-agents` ir atidarykite jį VS Code

1. Palaukite, kol VS Code terminalas bus paruoštas, tada įveskite šią komandą:

   ```bash title="" linenums="0"
   azd up
   ```

Vykdykite darbo eigos žingsnius, kuriuos tai paleis:

1. Bus paprašyta prisijungti prie Azure - vykdykite instrukcijas, kad autentifikuotumėte
1. Įveskite unikalų aplinkos pavadinimą - pvz., aš naudojau `nitya-mshack-azd`
1. Tai sukurs `.azure/` aplanką - matysite poaplankį su aplinkos pavadinimu
1. Bus paprašyta pasirinkti prenumeratos pavadinimą - pasirinkite numatytąjį
1. Bus paprašyta nurodyti vietą - naudokite `East US 2`

Dabar palaukite, kol vykdomas paruošimas baigsis. **Tai užtrunka 10–15 minučių**

1. Baigus, jūsų konsolė parodys tokį SĖKMĖS pranešimą kaip šį:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Jūsų Azure portale dabar bus paruošta išteklių grupė su tuo aplinkos pavadinimu:

      ![Infrastruktūra](../../../../../translated_images/lt/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Dabar galite patikrinti įdiegtą infrastruktūrą ir programą**.

---

## 4. Šablono patvirtinimas

1. Apsilankykite Azure portalo [Išteklių grupės](https://portal.azure.com/#browse/resourcegroups) puslapyje - prisijunkite, kai bus paprašyta
1. Spustelėkite Išteklių grupę (RG) savo aplinkos pavadinimui - pamatysite aukščiau pateiktą puslapį

      - spustelėkite Azure Container Apps resursą
      - spustelėkite Application Url _Essentials_ skiltyje (viršuje dešinėje)

1. Turėtumėte matyti talpinamą programos priekinio plano vartotojo sąsają, panašią į tai:

   ![Programa](../../../../../translated_images/lt/03-test-application.471910da12c3038e.webp)

1. Pabandykite užduoti kelis [pavyzdinius klausimus](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Užduokite: ```Kokia yra Prancūzijos sostinė?``` 
      1. Užduokite: ```Koks yra geriausias palapinė iki $200 dviem žmonėms ir kokias savybes ji turi?```

1. Turėtumėte gauti panašius atsakymus kaip parodyta žemiau. _Bet kaip tai veikia?_ 

      ![Atsakymas](../../../../../translated_images/lt/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agentų patvirtinimas

Azure Container App diegia galinį tašką, kuris jungiasi prie AI agente, paruošto Microsoft Foundry projekte šiam šablonui. Pažiūrėkime, ką tai reiškia.

1. Grįžkite į Azure portalo _Peržvalga_ puslapį savo išteklių grupei

1. Spustelėkite `Microsoft Foundry` išteklių tame sąraše

1. Turėtumėte matyti tai. Spustelėkite mygtuką `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/lt/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Turėtumėte matyti Foundry projekto puslapį jūsų AI programai
   ![Projektas](../../../../../translated_images/lt/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Spustelėkite `Agents` - pamatysite numatytąjį agentą, paruoštą jūsų projekte
   ![Agentai](../../../../../translated_images/lt/06-visit-agents.bccb263f77b00a09.webp)

1. Pasirinkite jį - ir pamatysite agento išsamią informaciją. Atkreipkite dėmesį į šiuos dalykus:

      - Agentas pagal numatytuosius nustatymus naudoja Failų paiešką (visada)
      - Agento `Knowledge` rodo, kad įkeliami 32 failai (failų paieškai)
      ![Agentas](../../../../../translated_images/lt/07-view-agent-details.0e049f37f61eae62.webp)

1. Kairiajame meniu raskite parinktį `Data+indexes` ir spustelėkite, kad pamatytumėte detales. 

      - Turėtumėte matyti 32 duomenų failus, įkeltus žiniai.
      - Tai atitiks 12 klientų failų ir 20 produktų failų po `src/files`
      ![Duomenys](../../../../../translated_images/lt/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Jūs patvirtinote Agento veikimą!** 

1. Agento atsakymai yra pagrįsti žiniomis iš tų failų. 
1. Dabar galite užduoti klausimus susijusius su tais duomenimis ir gauti pagrįstus atsakymus.
1. Pavyzdys: `customer_info_10.json` aprašo 3 pirkimus, atliktus "Amanda Perez"

Grįžkite į naršyklės skirtuką su Container App galiniu tašku ir paklauskite: `Kokius produktus turi Amanda Perez?`. Turėtumėte pamatyti kažką panašaus:

![Duomenys](../../../../../translated_images/lt/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agentų žaidimų aikštelė

Sukurkime daugiau intuicijos apie Microsoft Foundry galimybes, išbandydami agentą Agentų žaidimų aikštelėje. 

1. Grįžkite į puslapį `Agents` Microsoft Foundry - pasirinkite numatytąjį agentą
1. Spustelėkite parinktį `Try in Playground` - turėtumėte gauti žaidimų aikštelės vartotojo sąsają panašią į šią
1. Užduokite tą patį klausimą: `Kokius produktus turi Amanda Perez?`

    ![Duomenys](../../../../../translated_images/lt/09-ask-in-playground.a1b93794f78fa676.webp)

Gaunate tą patį (ar panašų) atsakymą - tačiau taip pat gaunate papildomos informacijos, kurią galite naudoti, norėdami suprasti agentinės programos kokybę, kainą ir našumą. Pavyzdžiui:

1. Atkreipkite dėmesį, kad atsakymas nurodo duomenų failus, naudojamus atsakymo "pagrindimui"
1. Uždėkite pelę ant bet kurio iš šių failų žymų - ar duomenys atitinka jūsų užklausą ir parodytą atsakymą?

Taip pat matote _statistika_ eilutę po atsakymu. 

1. Uždėkite pelę ant bet kurio matavimo - pvz., Saugumas. Pamatysite kažką panašaus
1. Ar įvertinimo reitingas atitinka jūsų nuojautą apie atsakymo saugumo lygį?

      ![Duomenys](../../../../../translated_images/lt/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Įmontuota stebėsena

Stebėsena reiškia jūsų programos instrumentavimą, kad būtų sugeneruoti duomenys, kurie gali būti naudojami suprasti, derinti ir optimizuoti jos veikimą. Norėdami tai pajusti:

1. Spustelėkite mygtuką `View Run Info` - pamatysite šį vaizdą. Tai yra [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) pavyzdys veikime. _Šį vaizdą galite gauti ir spustelėję Thread Logs viršutinio lygio meniu_.

   - Susipažinkite su vykdymo žingsniais ir įrankiais, kuriuos naudoja agentas
   - Supraskite bendrą žetonų skaičių (lyginant su išvesties žetonų naudojimu) atsakymui
   - Supraskite delsą ir kur vykdymo metu praleidžiamas laikas

      ![Agentas](../../../../../translated_images/lt/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Spustelėkite skirtuką `Metadata`, kad pamatytumėte papildomas vykdymo savybes, kurios gali suteikti naudingą kontekstą derinant problemas vėliau.   

      ![Agentas](../../../../../translated_images/lt/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Spustelėkite skirtuką `Evaluations`, kad pamatytumėte automatiškai atliktus vertinimus apie agento atsakymą. Tai apima saugumo vertinimus (pvz., Self-harm) ir agentui būdingus vertinimus (pvz., ketinimo atpažinimas, užduoties laikymasis).

      ![Agentas](../../../../../translated_images/lt/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Galiausiai, spustelėkite skirtuką `Monitoring` šoninio meniu.

      - Pasirinkite skirtuką `Resource usage` rodomame puslapyje - ir peržiūrėkite metrikas.
      - Sekite programos naudojimą kaštų (žetonų) ir apkrovos (užklausų) atžvilgiu.
      - Stebėkite programos delsą iki pirmo baito (įvesties apdorojimas) ir paskutinio baito (išvestis).

      ![Agentas](../../../../../translated_images/lt/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Aplinkos kintamieji

Iki šiol žingsnis po žingsnio peržiūrėjome diegimą naršyklėje ir patikrinome, kad mūsų infrastruktūra yra paruošta ir programa veikia. Tačiau norint dirbti su programa _code-first_, turime sukonfigūruoti vietinę kūrimo aplinką su atitinkamais kintamaisiais, reikalingais darbui su šiomis paslaugomis. Naudojant `azd` tai yra paprasta.

1. Azure Developer CLI [naudoja aplinkos kintamuosius](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) saugoti ir valdyti konfigūracijos nustatymus programos diegimams.

1. Aplinkos kintamieji saugomi `.azure/<env-name>/.env` - tai suvaržo juos į `env-name` aplinką, naudojamą diegimo metu, ir padeda atskirti aplinkas tarp skirtingų diegimo tikslų toje pačioje saugykloje.

1. Aplinkos kintamieji automatiškai užkraunami vykdant `azd` komandą, kai ji atlieka tam tikrą komandą (pvz., `azd up`). Atkreipkite dėmesį, kad `azd` automatiškai neskaito _OS lygmens_ aplinkos kintamųjų (pvz., nustatytų shell'e) - vietoj to naudokite `azd set env` ir `azd get env`, kad perduotumėte informaciją skriptuose.


Pabandykime keletą komandų:

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

1. Gaukite konkrečią reikšmę - pvz., noriu sužinoti, ar nustatėme reikšmę `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Matysite kažką panašaus - tai nebuvo nustatyta pagal numatytuosius!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Nustatykite naują aplinkos kintamąjį `azd`. Čia atnaujiname agento modelio pavadinimą. _Pastaba: bet kokie atlikti pakeitimai bus iš karto atspindėti faile `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Dabar turėtume rasti, kad reikšmė nustatyta:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Atkreipkite dėmesį, kad kai kurie ištekliai yra nuolatiniai (pvz., modelių diegimai) ir reikalauja daugiau nei vien `azd up`, kad priverstumėte pakartotinį diegimą. Pabandykime pašalinti pradinį diegimą ir iš naujo įdiegti su pakeistais aplinkos kintamaisiais.

1. **Refresh** Jei anksčiau diegėte infrastruktūrą naudodami azd šabloną - galite _refresh_ vietinių aplinkos kintamųjų būseną pagal dabartinę Azure diegimo būseną naudodami šią komandą:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Tai galingas būdas _sinchronizuoti_ aplinkos kintamuosius tarp dviejų ar daugiau vietinių kūrimo aplinkų (pvz., komandoje su keliais kūrėjais) - leidžiantis diegiamai infrastruktūrai būti pagrindiniu šaltiniu, nurodančiu aplinkos kintamųjų būseną. Komandos nariai tiesiog _atnaujina_ kintamuosius, kad vėl būtų sinchronizuoti.

---

## 9. Sveikiname 🏆

Jūs ką tik užbaigėte visą darbo eigą, kurioje:

- [X] Pasirinkote AZD Template, kurį norite naudoti
- [X] Atidarėte šabloną palaikomoje kūrimo aplinkoje
- [X] Išdiegėte šabloną ir patvirtinote, kad jis veikia

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# 5. Kohanda malli

!!! tip "SELLE MODUULI LÕPUS OSKAD SA"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Määra baasjooned

Kasuta varasemate moodulite juures initsialiseeritud [AI agentidega alustamise](https://github.com/Azure-Samples/get-started-with-ai-agents) hoidlat. Enne mis tahes muutmist kirjuta üles malli revisjon, AZD versioon, valitud keskkond, mudeli juurutus ja töötavad näidisküsimused.

Näidis rakendab agendi tugistatud vestlusrakendust. See EI muutu kahe-agendiliseks jaemüügiks süsteemiks lihtsalt keskkonnamuutujate seadistamise või täiendavate juhistefailide salvestamisega. Täiendavate agentide, tööriistade haldurite, marsruutimise, autoriseerimise ja andmetele juurdepääsu jaoks on vajalik rakenduse kood.

Kontrolli praegu juurutatud agendi juhiseid ja tööriistu Foundrys. Testi ühte faktiküsimust, ühte otsinguküsimust ja ühte küsimust, millele näidisandmed ei oska vastata. Kinnita viited tegelike allikadokumentide vastu, selle asemel et eeldada, et sujuv vastus on õige.

## 5.2 Kohanda teadmiste otsingut

Mall toetab failipõhist otsingut ja valikulist Azure AI Search integratsiooni. Järgi [kehtivat AI Search juhendit](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) indekseerimiseks ja tööriistade seadistamiseks.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Teenuse lubamine on ainult üks osa otsingust. Enne oma andmete üleslaadimist:

1. Kinnita, et sul on luba dokumentide kasutamiseks ja eemalda tundlik teave.
2. Vali oma piirkonnas toetatud pesastamismudel ning sea selle ühilduv versioon, juurutustüüp ja vektorite mõõtmed.
3. Loo/täida indeks vastavalt näidise dokumenteeritud protsessile.
4. Sea agendi otsingutööriist kasutama seda indeksit.
5. Testi otsingut, viiteid, autoriseerimist ja käitumist, kui vastavat dokumenti ei eksisteeri.

Ära vaheta `text-embedding-3-small` teise pesastamismudeli vastu ilma mõõtmeid kontrollimata ja vektorite vajaduspõhiselt ümber ehitamata/indekseerimata. Nimi nagu `retail-products` ei ole teostatud kataloog ega ligipääsukontrollipoliitika.

## 5.3 Jälgimine ja monitooring

Järgi [näidise vaatlusjuhendit](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Veendu, et nõutav Application Insights ressurss ja ühendus on olemas; kui muudad infrastruktuuri seadeid, kasuta `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Saada testpäring, siis vaata konteineri rakenduse logisid ja agendi jälgimisvaadet Foundrys. Kontrolli latentsust, tööriistakõnesid, vigu ja päringu ning jälje seost. Ära eelda, et telemeetria on ühendatud vaid sellepärast, et juurutamine õnnestus.

Jäta `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` keelatud, kui sa pole selgesõnaliselt läbi vaadanud nõusolekut, peitmist, säilitust ja ligipääsukontrolle. Jäljed võivad sisaldada tundlikke tööriista argumente või dokumendi sisu isegi siis, kui tavapärased rakenduse logid näivad kahjutud.

## 5.4 Agendi hindamine

Näidise hindamisalguspunkt on nüüd [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), mitte `evals/` kataloog. Näidise juurest kasuta Pythoni keskkonda, mis vastab selle dokumenteeritud nõuetele:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Enne käivitamist täida [hindamise eeltingimused](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testid laadivad konfigureeringu valitud `.azure/<environment>/.env`; kinnita, et on valitud soovitud keskkond. Olulised sisendid on:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, kasutades selle näidise jaoks nõutavat formaat (läbitöötatud versioon kasutab `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, mida kasutatakse hindaja-mudeli juurutusena

Kontrolli teste, et mõista hindaja valikut, läve väärtusi, nõutavaid rolle ja mudeli kulusid. Läbitud jooks ei ole automaatselt heaks kiidetud kvaliteedivärav; vaata üle skoorid, nurjunud/veaga juhtumid ja seotud Foundry tulemused.

### Eraldi AZD hindamiste laiendus

Ülalmainitud Python test on **näidispõhine töövoog**. Valikuline `azure.ai.evaluations` laiendus on erinev töövoog oma `evals/azure.eval.yaml` konfigureerimisega. See paigaldatakse eraldi, ei ole kaasas üldiselt kättesaadavas `microsoft.foundry` 1.0 paketis:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Täieliku laienduse seadistuse jaoks vaata [hindamisprotsesse ja migratsiooni](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Alates agentide laiendusest beta.22 ära kasuta eemaldatud `azd ai agent eval` käske. Hindamiste laienduse paigaldamine ei muuda näidise Pythoni teste ega loo automaatselt hindamiskonfiguratsiooni.

Eraldi **GA hostitud agendi harjutuse** jaoks kasuta tühja kausta väljaspool selle töötuba näidist ja järgi [Foundry lokaalne-pilve juhendit](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Kasutab AZD 1.37.0+, paketti `microsoft.foundry`, Python 3.13+ ja praegust uv. Sa uurid `azure.yaml`, testid kohalikult Agent Inspectori abil, juurutad lähte kaug-Foundry ehituseks ning genereerid/läbid andmekogu ja hindamis- kriteeriumid enne `azd ai eval init --name quality` konfiguratsiooni seadmist. Ära asenda selle näidise teste ega eelda, et paketi paigaldamine muudab selle hostimismudelit.

## 5.5 AI punase meeskonna testimine ja pidev hindamine

Praegune näidis toetab [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Täida selle eeltingimused ja vaata üle siht ja kulud enne käivitamist:

```bash
pytest tests/test_red_teaming.py -s
```

Kasuta autoriseeritud testjuurutust ja sünteetilisi andmeid. Vaata üle genereeritud rünnakud ja tulemused; see skannimine ei taga, et rakendus on turvaline ega nõuetele vastav.

Jälgitavuse juhend [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) kirjeldab ka konteineri käivitamisel seadistatavat pidevat hindamist. See hindab reaalsete kasutajate interaktsioone, mitte genereeritud testiliiklust, ning hindaja tugi varieerub regiooniti. Kui interaktsioone pole, siis hindamiskandeid ei teki. Kontrolli paigaldatud näidise versiooni ja hindaja konfiguratsiooni selle asemel, et eeldada, et igal paigaldusel on samad vaikeseaded.

Autentimine on eraldatud hindamisest. Järgi näidise dokumenteeritud identiteedi/juurdepääsu seadistust. Avaliku lõpp-punkti kaitsmiseks ei ole dokumenteeritud “basic auth langust” tugineda.

## 5.6 Kujundusülesanne: jaemüügi kohandamine

!!! warning "Kujundusülesanne, mitte lõpetatud paigaldus"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Kirjuta lühike plaan, mis käsitleb:

| Valdkond | Otsus ja kogutavad tõendid |
|------|----------------------------------|
| Agendi vastutus | Alusta ühe agendiga või põhjenda eraldi Shopper ja Loyalty agentide ning marsruutimisloogika vajadust |
| Andmed | Määra sünteetiline kataloog/preemiate andmestik ja värskenduste omand |
| Tööriistad | Rakenda esmalt ainult- lugemise käsitlejad; täpsusta mis tahes kirjutuste autoriseerimist ja valideerimist |
| Mudelid | Vali saadaval olevad mudeli/versiooni/SKU kombinatsioonid ja kontrolli kvota; väldi kasutamata mudelite eelkonfigureerimist |
| Päringute töötlemine | Määra indekseerimine, manustamise mõõtmed, viited ja dokumenditasandi juurdepääsukontroll |
| Hindamine | Lisa oodatud vastused, toetamatud küsimused, tööriistakasutuse ja ohutusjuhtumid koos selgete lävenditega |
| Operatsioonid | Määra telemeetria, latentsuse/vigade eelarved, kulupiirangud ja koristamise vastutus |

Salvestamine `custom-agents/shopper-agent-instructions.md` ei põhjusta näidise selle laadimist. Leia rakenduskood, mis loob/värskendab agendi, ühenda oma ülevaadatud juhised sinna ning kontrolli tulemuseks saadud agendi versiooni enne testimist. Juhised ei saa anda juurdepääsu andmetele ega tööriistadele, mida sa pole ise rakendanud.

Rakenda muudatused ükshaaval, tee ümber mõjutatud komponendid ja testi uuesti oma algseisundi küsimusi ning hindamisi. Hoia töökorras versiooni võrdluseks. Arhitektuuri inspiratsiooni saamiseks vaata [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), mis samuti ei ole täielik jaemüügi rakendus.

!!! quote "SELLISeks LABI LÕPUS PEAD OLEMA"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Jätka [Teardown Infrastructure](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
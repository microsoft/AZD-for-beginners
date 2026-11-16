# 5. Kohanda malli

!!! tip "SELLE MÄLUMOODULI LÕPUKS SUUDATE TEHA"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Alusjoone kehtestamine

Kasutage eelmistest moodulitest lähtuvat algatatud [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) hoidlat. Enne muutmist salvestage malli revisjon, AZD versioon, valitud keskkond, mudeli kasutuselevõtt ja töötavad näidisküsimused.

Näidis rakendab agendipõhist vestlusrakendust. See EI MUUTU kaheahelaliseks jaemüügikeskkonnaks, kui seadistada keskkonnamuutujad või salvestada täiendavaid juhised faile. Lisagentide, tööriistade haldamise, marsruutimise, autoriseerimise ja andmejuurdepääsu jaoks on vaja rakenduse koodi.

Kontrollige praegu kasutusel oleva agendi juhiseid ja tööriistu Foundry's. Testige ühte faktiküsimust, ühte otsimisküsimust ja ühte küsimust, millele näidandmed vastust anda ei saa. Kontrollige viiteid tegelike allikadokumentide järgi, mitte ainult eeldades, et sujuv vastus on õige.

## 5.2 Kohandage teadmiste otsingut

Mall toetab failipõhist otsingut ja valikulist Azure AI Search integratsiooni. Järgige [praegust AI Search juhendit](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) indeksimiseks ja tööriista seadistamiseks.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Teenuse lubamine on alles üks osa otsingust. Enne oma andmete üleslaadimist:

1. Kinnitage, et teil on dokumentide kasutamise luba ning eemaldage tundlik info.
2. Valige teie regioonile toetatud manustamismudel ning seadistage selle sobiv versioon, kasutuselevõtu tüüp ja vektorite mõõtmed.
3. Looge/täitke indeks, kasutades näidise dokumenteeritud protsessi.
4. Seadistage agendi otsingutööriist kasutama seda indeksit.
5. Testige otsingut, viiteid, autoriseerimist ning käitumist, kui leitavat dokumenti ei ole.

Ärge vahetage `text-embedding-3-small` mõne teise manustamismudeli vastu ilma mõõtmeid kontrollimata ja vajadusel vektoreid uuesti koostamata/indekseerimata. Nimi nagu `retail-products` ei ole rakendatud kataloog ega juurdepääsukontrolli poliitika.

## 5.3 Jälgimine ja monitooring

Järgige [näidise jälgitavuse juhendit](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Veenduge, et nõutud Application Insights ressurss ja ühendus juba eksisteeriksid; infrastruktuuri seadete muutmisel kasutage `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Saatke testpäring ning seejärel vaadake Container App'i rakenduse logisid ja agendi jälgimisvaadet Foundry's. Kontrollige latentsust, tööriistakõnesid, vigu ning päringu ja jälje seost. Ärge eeldage, et telemeetria on ühendatud ainult selle tõttu, et kasutuselevõtt õnnestus.

Jätke `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` keelatuks, välja arvatud juhul, kui olete selgelt vaadanud üle nõusoleku, redigeerimise, säilitamise ja ligipääsukontrolli. Jäljed võivad sisaldada tundlikke tööriista argumente või dokumentide sisu isegi siis, kui tavalised rakenduse logid tunduvad kahjutud.

## 5.4 Agendi hindamine

Näidise hindamise alguspunkt on nüüd [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), mitte `evals/` kataloog. Näidise juurkataloogist kasutage Pythoni keskkonda, mis vastab selle dokumenteeritud nõuetele:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Enne käivitamist täitke [hindamise eeltingimused](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testid laadivad konfiguratsiooni valitud `.azure/<environment>/.env`; kontrollige, et oleks valitud soovitud keskkond. Olulised sisendid on:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, kasutades vormingut, mida nõuab praegune näidis (ülevaadatud versioon kasutab `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, mis on kasutusel kohtuniku mudeli kasutuselevõtuks

Vaadake teste, et mõista hindaja valikut, lävi, nõutavaid rolle ja mudeli kulusid. Lõpetatud jooks ei ole automaatselt läbitud kvaliteedivärav; kontrollige skoorid, ebaõnnestunud/veaga juhtumid ja lingitud Foundry tulemused.

### Eraldi AZD hindamiste laiendus

Ülalmainitud Python test on **spetsiifiline näidise töökäik**. Valikuline `azure.ai.evaluations` laiendus on eraldi töökäik, oma `evals/azure.eval.yaml` konfiguratsiooniga:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Täieliku laienduskomplekti seadistuse leidmiseks vaadake [hindamisprotsessid ja migratsioon](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Alates agents extension beta.22 versioonist ärge kasutage eemaldatud `azd ai agent eval` käske. Hindamislaienduse paigaldamine ei muuda näidise Pythoni teste ega loo automaatselt hindamiskonfiguratsiooni.

## 5.5 Tehisintellekti punase meeskonna testimine ja pidev hindamine

Praegune näidis sisaldab [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Täitke selle eeltingimused ja vaadake läbi sihttase ning kulud enne käivitamist:

```bash
pytest tests/test_red_teaming.py -s
```

Kasutage autoriseeritud testkasutust ja sünteetilisi andmeid. Vaadake üle genereeritud rünnakud ja tulemused; see skaneerimine ei tõesta, et rakendus on turvaline või vastav.

Jälgitavuse juhend [observability guide](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) kirjeldab ka konteineri käivitamisel seadistatavat pidevat hindamist. See hindab tõelisi kasutajategevusi, mitte genereeritud testiliiklust, ning hindamisvõimaluste tugi sõltub regioonist. Kui tegevusi ei toimu, siis hindamiskirjeid ei teki. Kontrollige paigaldatud näidise versiooni ja hindamise seadistust, selle asemel et eeldada, et igal juurutusel on samad vaikeväärtused.

Autentimine on eraldatud hindamisest. Järgige näidise dokumenteeritud identiteedi/juurdepääsu seadistust. Avaliku lõpp-punkti kaitsmiseks ei ole dokumenteeritud ühtegi „baasauthentimise varuplaani“.

## 5.6 Kujundusülesanne: jaemüügi kohandamine

!!! warning "Kujundusülesanne, mitte lõpule viidud juurutus"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Kirjutage lühike plaan järgmiste teemade käsitlemiseks:

| Valdkond | Otsus ja kogutavad tõendid |
|------|----------------------------------|
| Agendi vastutusvaldkonnad | Alustage ühe agendiga või põhjendage eraldi Shopperi ja Loyalty agendid ning marsruutimisloogika vajalikkust |
| Andmed | Määratlege sünteetiline kataloog/tasustamise andmekogum ja uuenduste omand |
| Tööriistad | Rakendage esmalt ainult lugemise käsitlejad; täpsustage volitused ja valideerimine iga kirjutise jaoks |
| Mudelid | Valige olemasolevad mudeli/versiooni/SKU kombinatsioonid ja kinnitage kvoot; vältige kasutamata mudelite ettevalmistamist |
| Taastamine | Määratlege indekseerimine, manustamise mõõtmed, viited ja dokumenditasemel juurdepääsukontrollid |
| Hindamine | Lisage oodatud vastuse, toetamata küsimuse, tööriista kasutamise ja turvalisuse juhtumid koos selgete lävenditega |
| Operatsioonid | Määratlege telemeetria, latentsus/vea eelarved, kulupiirangud ja puhastamise vastutus |

Salvestamine `custom-agents/shopper-agent-instructions.md` ei põhjusta näidise laadimist. Leidke rakenduse kood, mis loob/uuendab agendi, ühendage sinna oma üle vaadatud juhised ja kinnitage tulevase agendi versioon enne testimist. Juhised ei saa anda juurdepääsu andmetele ega tööriistadele, mida te pole rakendanud.

Rakendage muudatus üks haaval, juurutage vastavad komponendid uuesti ja käivitage uuesti oma baasjoon küsimused ja hinnangud. Hoidke võrdluseks töötav versioon. Arhitektuurilise inspiratsiooni saamiseks vaadake [jaemüügi lähteplaani](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), mis samuti ei ole täielik jaemüügirakendus.

!!! quote "SÕLTUVALT PRAGU PEAKSITE SELLE LABI LÕPUS OLEMA"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Jätkake [Infra struktuuri lammutamisega](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
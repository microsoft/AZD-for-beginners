# 5. Prilagodi predlogo

!!! tip "OB KONCU TEGA MODULA BOSTE ZMOGLI"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Določi začetno osnovo

Uporabi inicializirani repozitorij [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) iz prejšnjih modulov. Pred kakršnokoli spremembo zabeleži revizijo predloge, različico AZD, izbrano okolje, nameščanje modela in delujoča vzorčna vprašanja.

Vzorec implementira aplikacijo za klepet z agentom v ozadju. **Ni** avtomatično dvomestni sistem za maloprodajo samo zato, ker nastaviš spremenljivke okolja ali shraniš dodatne datoteke z navodili. Dodatni agenti, upravljavci orodij, usmerjanje, pooblaščanje in dostop do podatkov zahtevajo kodo aplikacije.

Preglej trenutno nameščena navodila in orodja agenta v Foundry. Preizkusi eno dejansko vprašanje, eno vprašanje za pridobivanje podatkov in eno vprašanje, na katerega vzorčni podatki ne znajo odgovoriti. Preveri navajanja glede na dejanske izvorne dokumente in ne predpostavljaj, da je tekoč odgovor pravilen.

## 5.2 Prilagodi pridobivanje znanja

Predloga podpira pridobivanje iz datotek in opcijsko integracijo Azure AI Search. Sledi [trenutnemu vodniku za AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) za indeksiranje in konfiguracijo orodij.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Omogočanje storitve je le del pridobivanja. Preden naložiš svoje podatke:

1. Potrdi, da imaš dovoljenje za uporabo dokumentov in odstrani občutljive informacije.
2. Izberi model vdelave, ki ga podpira tvoja regija, ter nastavi njegovo združljivo različico, vrsto nameščanja in dimenzije vektorjev.
3. Ustvari/zapolni indeks z uporabo dokumentiranega postopka v vzorcu.
4. Konfiguriraj agenta, da orodje za pridobivanje uporablja ta indeks.
5. Preizkusi pridobivanje, navajanja, pooblaščanje in obnašanje, ko ni relevantnega dokumenta.

Ne preklapljaj iz `text-embedding-3-small` na drug model vdelave brez preverjanja dimenzij in po potrebi obnove/ponovnega indeksiranja vektorjev. Ime, kot je `retail-products`, ni implementiran katalog ali politika nadzora dostopa.

## 5.3 Sledenje in nadzor

Sledi [vodniku za opazovanje vzorca](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Prepričaj se, da zahtevani vir Application Insights in povezava že obstajata; če spreminjaš infrastrukturo, uporabi `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Pošlji testni zahtevek, nato preglej dnevnike aplikacije Container App in pogled sledenja agenta v Foundry. Preveri zaostanek, klice orodij, napake in korelacijo med zahtevkom in sledjo. Ne predpostavljaj, da je telemetrija povezana samo zato, ker je nameščanje uspelo.

Pusti `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` onemogočen, če nisi izrecno pregledal soglasja, cenzure, hranjenja podatkov in kontrol dostopa. Sledi lahko vsebujejo občutljive argumente orodij ali vsebino dokumentov, tudi ko običajni dnevnik aplikacije izgleda nedolžno.

## 5.4 Vrednotenje agenta

Vstopna točka za vrednotenje v vzorcu je zdaj [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), ne imenik `evals/`. Iz korena vzorca uporabi Python okolje, ki izpolnjuje njegove dokumentirane zahteve:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Pred zagonom dokončaj [pogoje za vrednotenje](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testi naložijo konfiguracijo iz izbranega `.azure/<environment>/.env`; potrdi, da je izbrano predvideno okolje. Pomembni vhodni podatki vključujejo:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, v formatu, ki ga zahteva trenutni vzorec (pregledana različica uporablja `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, ki se uporablja kot nameščanje sodnikovega modela

Preglej teste, da razumeš izbiro vrednotitelja, pragove, potrebne vloge in stroške modelov. Končan zagon ni samodejno prehod kvalitativnega preizkusa; preveri ocene, neuspešne/napake primere in povezane rezultate v Foundry.

### Ločen dodatek za vrednotenje AZD

Python test zgoraj je **potek dela specifičen za vzorec**. Izbirni dodatek `azure.ai.evaluations` je drugačen potek dela, z lastno konfiguracijo `evals/azure.eval.yaml`. Namesti se posebej, ni vključen v splošno dostopno zbirko `microsoft.foundry` 1.0:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Za popolno nastavitev dodatka glej [poteke dela vrednotenja in migracije](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od betaverzije razširitve agentov 22 ne uporabljaj odstranjenih ukazov `azd ai agent eval`. Namestitev dodatka za vrednotenje ne pretvori Python testov vzorca ali samodejno ne ustvari konfiguracije vrednotenja.

Za ločeno **vajo gostujočega GA agenta**, uporabi prazno mapo izven tega vzorca in sledi [lokalnemu do oblačnemu pregledu Foundry](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Uporablja AZD 1.37.0+, zbirko `microsoft.foundry`, Python 3.13+ in trenutno uv. Preglej `azure.yaml`, testiraj lokalno z Agent Inspectorjem, implementiraj vir za oddaljeno zgradbo Foundry in ustvari/preglej podatkovni niz in merila pred konfiguracijo `azd ai eval init --name quality`. Ne zamenjuj testov tega vzorca ali predpostavljaj, da namestitev zbirke spremeni njegov gostujoči model.

## 5.5 Rdeča ekipa AI in stalno vrednotenje

Trenutni vzorec zagotavlja [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Dokončaj njegove predpogoje in preglej predvideni cilj ter stroške pred zagonom:

```bash
pytest tests/test_red_teaming.py -s
```

Uporabi pooblaščeno testno namestitev in sintetične podatke. Preglej generirane napade in rezultate; ta skeniranje ne potrjuje, da je aplikacija varna ali skladna.

Vodič za [opazovanje](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) opisuje tudi neprekinjeno evalvacijo, ki je konfigurirana ob zagonu kontejnerja. Evalvira dejanske interakcije uporabnikov, ne pa ustvarjenega testnega prometa, in podpora evalinatorja se razlikuje glede na regijo. Če ni interakcij, ni vnosov evalvacije. Preverite nameščeno vzorčno različico in konfiguracijo evalinatorja namesto da predpostavite, da ima vsak prehod enake privzete nastavitve.

Avtentikacija je ločena od evalvacije. Sledite dokumentirani nastavitvi identitete/dostopa v vzorcu. Ni dokumentiranega „osnovnega avtentikacijskega padca“ za zaščito javne točke.

## 5.6 Oblikovanjska vaja: prilagoditev maloprodaje

!!! warning "Oblikovanjska vaja, ne dokončana namestitev"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napišite kratek načrt, ki obravnava:

| Področje | Odločitev in dokazi za zbiranje |
|------|----------------------------------|
| Odgovornosti agentov | Začnite z enim agentom ali utemeljite ločena Shopper in Loyalty agenta ter usmerjevalno logiko |
| Podatki | Določite sintetični katalog/nabor nagrad in lastništvo posodobitev |
| Orodja | Najprej uvedite obdelovalce samo za branje; določite avtorizacijo in preverjanje za vse zapise |
| Modeli | Izberite razpoložljive kombinacije model/različica/SKU in preverite kvote; izogibajte se predpripravi neuporabljenih modelov |
| Pridobivanje | Določite indeksiranje, dimenzije vdelave, citate in nadzore dostopa na ravni dokumentov |
| Evalvacija | Dodajte pričakovane odgovore, nepodprta vprašanja, uporabo orodij in varnostne primere z izrecnimi pragovi |
| Operacije | Določite telemetrijo, zamudo/proračun napak, stroškovne omejitve in lastništvo čiščenja |

Shranjevanje `custom-agents/shopper-agent-instructions.md` ne povzroči, da ga vzorec naloži. Poiščite kodo aplikacije, ki ustvari/posodobi agenta, povežite tam svoje pregledane navodila in preverite nastalo različico agenta pred testiranjem. Navodila ne morejo dovoliti dostopa do podatkov ali orodij, ki jih niste implementirali.

Uvedite eno spremembo naenkrat, ponovno namestite prizadete komponente in ponovno izvedite osnovna vprašanja in evalvacije. Ohranite delovno različico za primerjavo. Za navdih arhitekture si oglejte [maloprodajni načrt](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), ki prav tako ni popolna maloprodajna aplikacija.

!!! quote "OB KONCU TE DELAVNICE BI MORALI IMETI"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Nadaljujte na [razstavitev infrastrukture](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
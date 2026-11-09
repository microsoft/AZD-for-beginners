# 5. Prilagodite predlogo

!!! tip "NA KONCU TEGA MODULA BOSTE ZMOGLI"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Ustanovite izhodišče

Uporabite inicializirano shrambno mesto [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) iz prejšnjih modulov. Preden karkoli spremenite, zabeležite revizijo predloge, različico AZD, izbrano okolje, namestitev modela in vzorčna delovna vprašanja.

Vzorec izvaja klepetalno aplikacijo z agentom. Ne postane **d**voagentni maloprodajni sistem samo z nastavitvijo spremenljivk okolja ali shranjevanjem dodatnih datotek z navodili. Dodatni agenti, upravljalci orodij, usmerjanje, avtorizacija in dostop do podatkov zahtevajo aplikacijsko kodo.

Preglejte trenutno nameščena navodila in orodja agenta v Foundry. Preizkusite eno dejansko vprašanje, eno iskalno vprašanje in eno vprašanje, na katerega vzorčni podatki ne morejo odgovoriti. Preverite citate glede na dejanske izvorne dokumente in ne predpostavljajte, da je tekoč odgovor pravilen.

## 5.2 Prilagodite pridobivanje znanja

Predloga podpira pridobivanje na podlagi datotek in dodatno integracijo Azure AI Search. Sledite [trenutnemu vodniku AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) za indeksiranje in konfiguracijo orodja.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Omogočanje storitve je le del pridobivanja. Pred nalaganjem lastnih podatkov:

1. Potrdite, da imate dovoljenje za uporabo dokumentov in odstranite občutljive informacije.
2. Izberite vdelani model, ki je podprt v vaši regiji, in nastavite njegovo združljivo različico, vrsto namestitve ter vektorske dimenzije.
3. Ustvarite/napolnite indeks s postopkom, dokumentiranim za vzorec.
4. Konfigurirajte orodje za pridobivanje agenta za uporabo tega indeksa.
5. Preizkusite pridobivanje, citate, avtorizacijo in vedenje, ko ni nobenega ustreznega dokumenta.

Ne preklapljajte z `text-embedding-3-small` na drug vdelani model, ne da bi preverili dimenzije in po potrebi ponovno zgradili/indeksirali vektorje. Ime, kot je `retail-products`, ni implementiran katalog ali politika nadzora dostopa.

## 5.3 Sledenje in nadzor

Sledite [vodniku za opazovanje vzorca](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Prepričajte se, da zahtevani vir Application Insights in povezava že obstajata; če spreminjate nastavitve infrastrukture, uporabite `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Pošljite testni zahtevek in preglejte dnevnike aplikacije Container App ter pogled sledenja agenta v Foundry. Preverite zakasnitve, klice orodij, napake in korelacije med zahtevkom in sledečim sledenjem. Ne predpostavljajte, da je telemetrija povezana samo zato, ker je namestitev uspela.

Pustite `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` onemogočen, razen če ste izrecno pregledali soglasje, odredbo, hrambo in kontrole dostopa. Slede lahko vsebujejo občutljive argumente orodij ali vsebino dokumentov tudi, ko običajni dnevniki aplikacij izgledajo nenevarni.

## 5.4 Ocena agenta

Vstopna točka ocene vzorca je zdaj [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), ne `evals/` imenik. Iz korena vzorca uporabite Python okolje, ki izpolnjuje dokumentirane zahteve:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Pred zagonom dokončajte [predpogoje za ocenjevanje](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testi naložijo konfiguracijo iz izbranega `.azure/<environment>/.env`; potrdite, da je izbrano želeno okolje. Pomembni vhodni podatki vključujejo:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, v obliki, ki jo zahteva trenutni vzorec (pregledana različica uporablja `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, uporabljena kot namestitev modela sodnika

Preglejte teste, da razumete izbiro evalvatorja, pragove, potrebne vloge in stroške modela. Zaključeno izvajanje ni samodejno uspešna kontrolna točka kakovosti; preglejte ocene, neuspešne/napačne primere in povezane rezultate v Foundry.

### Ločena razširitev za ocene AZD

Python test zgoraj je **specifični delovni tok za vzorec**. Izbirna razširitev `azure.ai.evaluations` ima drugačen delovni tok z lastno konfiguracijo `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Za popolno nastavitev razširitve glejte [delovne tokove ocenjevanja in migracijo](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od kar je beta.22 razširitve agentov, ne uporabljajte več odstranjenih ukazov `azd ai agent eval`. Namestitev razširitve ocen ne pretvori Python testov vzorca niti samodejno ne ustvari konfiguracije ocenjevanja.

## 5.5 Rdeče ekipe AI in neprekinjena ocena

Trenutni vzorec vključuje [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Dokončajte njegove predpogoje in preglejte namenjene cilje ter stroške pred zagonom:

```bash
pytest tests/test_red_teaming.py -s
```

Uporabite pooblaščeno testno namestitev in sintetične podatke. Preglejte ustvarjene napade in rezultate; ta pregled ne dokazuje, da je aplikacija varna ali skladna.

Vodnik za [opazovanje](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) prav tako opisuje neprekinjeno evalvacijo, nastavljeno ob zagonu kontejnerja. Oceni resnične interakcije uporabnikov, ne ustvarjen promet testov, podpora evaluatorja pa se razlikuje glede na regijo. Brez interakcij ni vnosov evaluacije. Preverite nameščeno vzorčno različico in konfiguracijo evaluatorja namesto, da bi domnevali, da ima vsak uvod enake privzete nastavitve.

Avtentikacija je ločena od evalvacije. Sledite dokumentirani nastavitvi identitete/dostopa vzorca. Za zaščito javne točke ni dokumentiranega "osnovnega avtentikacijskega rezervnega načina".

## 5.6 Oblikovalna vaja: prilagoditev maloprodaje

!!! warning "Oblikovalna vaja, ne dokončana uvedba"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napišite kratek načrt, ki naslavlja:

| Območje | Odločitev in dokazila za zbiranje |
|------|----------------------------------|
| Odgovornosti agentov | Začnite z enim agentom ali utemeljite ločena Agenta za Nakupce in Zvestobo ter usmerjevalno logiko |
| Podatki | Določite sintetični katalog/nabor nagrad in lastništvo posodobitev |
| Orodja | Najprej implementirajte samo za branje; določite pooblastila in preverjanje za zapisovanja |
| Modeli | Izberite razpoložljive kombinacije model/različica/SKU in preverite kvoto; izogibajte se zagotavljanju neuporabljenih modelov |
| Pridobivanje | Določite indeksiranje, dimenzije vdelave, citate in kontrole dostopa na ravni dokumenta |
| Evalvacija | Dodajte primere pričakovanih odgovorov, nepodprtih vprašanj, uporabe orodij in varnostne primere z jasnimi pragovi |
| Operacije | Določite telemetrijo, proračune za zakasnitev/napake, omejitve stroškov in lastništvo čiščenja |

Shranjevanje `custom-agents/shopper-agent-instructions.md` ne povzroči, da vzorec to naloži. Poiščite aplikacijsko kodo, ki ustvarja/posodablja agenta, povežite tam pregledna navodila in pred testiranjem preverite nastalo različico agenta. Navodila ne morejo dovoliti dostopa do podatkov ali orodij, ki jih niste implementirali.

Uveljavite eno spremembo naenkrat, ponovno uvedite prizadete komponente in ponovno izvedite osnovna vprašanja in evalvacije. Ohranjajte delujočo različico za primerjavo. Za arhitekturno navdihovanje si oglejte [maloprodajno zasnovo](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), ki prav tako ni popolna maloprodajna aplikacija.

!!! quote "OB KONCU TEGA LABORATORIJA MORATE IMETI"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Nadaljujte z [razgradnjo infrastrukture](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
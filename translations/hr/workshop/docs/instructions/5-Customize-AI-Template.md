# 5. Prilagodite predložak

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Uspostavite početnu točku

Koristite inicijalizirani repozitorij [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) iz prethodnih modula. Zabilježite reviziju predloška, verziju AZD-a, odabrano okruženje, implementaciju modela i radna uzorka pitanja prije nego što bilo što promijenite.

Uzorak implementira aplikaciju za chat podržanu agentom. Ne postaje sustav s dva agenta za maloprodaju samo postavljanjem varijabli okruženja ili spremanjem dodatnih datoteka s uputama. Dodatni agenti, upravljači alata, usmjeravanje, autorizacija i pristup podacima zahtijevaju kod aplikacije.

Pregledajte trenutno implementirane upute i alate agenta u Foundryju. Testirajte jedno faktualno pitanje, jedno pitanje za dohvat i jedno pitanje na koje uzorak podataka ne može odgovoriti. Provjerite citate u usporedbi s izvornim dokumentima umjesto da pretpostavljate da je tečan odgovor ispravan.

## 5.2 Prilagodite dohvat znanja

Predložak podržava dohvat temeljen na datotekama i opcionalnu integraciju Azure AI Searcha. Slijedite [trenutni vodič za AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) za indeksiranje i konfiguraciju alata.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Omogućavanje servisa je samo jedan dio dohvaćanja. Prije prijenosa vlastitih podataka:

1. Potvrdite da imate dozvolu za korištenje dokumenata i uklonite osjetljive informacije.
2. Odaberite model ugrađivanja podržan u vašoj regiji i postavite njegovu kompatibilnu verziju, vrstu implementacije i dimenzije vektora.
3. Kreirajte/popunite indeks koristeći dokumentirani proces uzorka.
4. Konfigurirajte alat za dohvat agenta da koristi taj indeks.
5. Testirajte dohvat, citate, autorizaciju i ponašanje kada ne postoji relevantan dokument.

Nemojte prelaziti s `text-embedding-3-small` na drugačiji model ugrađivanja bez provjere dimenzija i ponovne izgradnje/indeksiranja vektora prema potrebi. Naziv poput `retail-products` nije implementirani katalog niti politika kontrole pristupa.

## 5.3 Praćenje i nadzor

Slijedite [vodič za promatranje uzorka](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Osigurajte da potrebni Application Insights resurs i veza već postoje; ako mijenjate postavke infrastrukture, koristite `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Pošaljite testni zahtjev, zatim pregledajte zapisnike aplikacije Container App i prikaz praćenja agenta u Foundryju. Provjerite latenciju, pozive alata, pogreške i korelaciju između zahtjeva i traga. Nemojte pretpostavljati da je telemetrija povezana samo zato što je implementacija uspjela.

Ostavite `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` onemogućen osim ako niste izričito pregledali pristanak, uklanjanje, zadržavanje i kontrole pristupa. Tragovi mogu sadržavati osjetljive parametre alata ili sadržaj dokumenta čak i kada obični zapisnici aplikacije izgledaju bezopasno.

## 5.4 Procjena agenta

Ulazna točka procjene uzorka sada je [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), a ne direktorij `evals/`. Iz korijena uzorka koristite Python okruženje koje zadovoljava njegove dokumentirane zahtjeve:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Prije pokretanja dovršite [preduvjete procjene](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testovi učitavaju konfiguraciju iz odabranog `.azure/<environment>/.env`; potvrdite da je odabrano željeno okruženje. Važni ulazi uključuju:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, koristeći format koji zahtijeva trenutni uzorak (pregledana verzija koristi `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, korišten kao implementacija modela sudca

Pregledajte testove kako biste razumjeli izbor evaluatora, pragove, potrebne uloge i troškove modela. Završno pokretanje nije automatski prolaz kapije kvalitete; pregledajte rezultate, neuspjele/pogrešne slučajeve i povezane rezultata u Foundryju.

### Odvojeno proširenje AZD evaluacija

Gornji Python test je **specifični radni tijek za uzorak**. Opcionalno proširenje `azure.ai.evaluations` je drugačiji radni tijek s vlastitom `evals/azure.eval.yaml` konfiguracijom. Instalira se zasebno, nije uključeno u općenito dostupni paket `microsoft.foundry` 1.0:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Za potpunu konfiguraciju proširenja pogledajte [radne tijekove evaluacije i migraciju](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od beta verzije 22 proširenja agenata, nemojte koristiti uklonjene naredbe `azd ai agent eval`. Instalacija proširenja evaluacija ne konvertira Python testove uzorka niti automatski ne kreira konfiguraciju evaluacije.

Za zasebnu **GA vježbu hostiranog agenta**, koristite praznu mapu izvan ovog uzorka radionice i slijedite [Foundry lokalno-u-oblak vodič](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Koristi AZD 1.37.0+, paket `microsoft.foundry`, Python 3.13+, i trenutni uv. Pregledat ćete `azure.yaml`, testirati lokalno s Agent Inspectorom, implementirati izvor za udaljenu Foundry gradnju te generirati/pregledati skup podataka i rubriku prije konfiguriranja `azd ai eval init --name quality`. Nemojte zamijeniti testove ovog uzorka niti pretpostavljati da instalacija paketa mijenja njegov model hostiranja.

## 5.5 AI red teaming i kontinuirana evaluacija

Trenutni uzorak pruža [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Dovršite njegove preduvjete i pregledajte namjenski cilj i troškove prije pokretanja:

```bash
pytest tests/test_red_teaming.py -s
```

Koristite autoriziranu testnu implementaciju i sintetičke podatke. Pregledajte generirane napade i rezultate; ovaj skeniranje ne jamči da je aplikacija sigurna ili usklađena.

Vodič za [promatranje](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) također opisuje kontinuiranu evaluaciju konfiguriranu pri pokretanju kontejnera. Evaluira stvarne interakcije korisnika, ne generirani testni promet, a podrška evaluatoru varira ovisno o regiji. Nema interakcija znači nema unosa evaluacije. Provjerite instaliranu uzornu verziju i konfiguraciju evaluatora umjesto da pretpostavljate da svaka implementacija ima iste zadane postavke.

Autentifikacija je odvojena od evaluacije. Slijedite dokumentiranu postavku identiteta/pristupa iz uzorka. Nema dokumentiranog „povratka na osnovnu autentifikaciju” na koji se možete osloniti za zaštitu javne točke.

## 5.6 Dizajnerska vježba: prilagodba maloprodaje

!!! warning "Dizajnerska vježba, a ne dovršena implementacija"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napišite kratak plan koji se bavi:

| Područje | Odluka i dokazi za prikupljanje |
|---------|---------------------------------|
| Odgovornosti agenta | Počnite s jednim agentom ili opravdajte odvojene agente Shopper i Loyalty te logiku usmjeravanja |
| Podaci | Definirajte sintetički katalog/skup nagrada i vlasništvo nad ažuriranjima |
| Alati | Prvo implementirajte rukovatelje samo za čitanje; odredite ovlaštenja i validaciju za sve zapise |
| Modeli | Odaberite dostupne kombinacije model/različica/SKU i provjerite kvotu; izbjegavajte dodjeljivanje neiskorištenih modela |
| Dohvat | Definirajte indeksiranje, dimenzije ugradnje, citate i pristupe na razini dokumenata |
| Evaluacija | Dodajte slučajeve očekivanih odgovora, nepodržanih pitanja, korištenja alata i sigurnosnih slučajeva s eksplicitnim pragovima |
| Operacije | Definirajte telemetriju, vremenske okvire kašnjenja/gresaka, ograničenja troškova i vlasništvo nad čišćenjem |

Spremanje `custom-agents/shopper-agent-instructions.md` ne uzrokuje da ga uzorak učita. Pronađite kod aplikacije koji stvara/ažurira agenta, povežite tamo svoje pregledane upute i provjerite rezultatnu verziju agenta prije testiranja. Upute ne mogu omogućiti pristup podacima ili alatima koje niste implementirali.

Primijenite jednu promjenu u isto vrijeme, ponovno implementirajte pogođene komponente i ponovno pokrenite vaša osnovna pitanja i evaluacije. Zadržite radnu reviziju za usporedbu. Za nadahnuće arhitekture pogledajte [maloprodajni nacrt](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), koji također nije potpuna maloprodajna aplikacija.

!!! quote "NA KRAJU OVE RADIONICE TREBALI BISTE IMATI"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Nastavite na [Raspad infrastrukture](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
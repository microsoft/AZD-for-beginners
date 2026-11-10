# 5. Prilagodite predložak

!!! tip "NA KRAJU OVOG MODULA BIT ĆETE SPOSOBNI"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Uspostavljanje početne točke

Upotrijebite inicijalizirani spremište [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) iz prethodnih modula. Zabilježite reviziju predloška, verziju AZD-a, odabrano okruženje, raspoređivanje modela i radna uzorku pitanja prije nego što bilo što promijenite.

Uzorak implementira aplikaciju za chat podržanu agentima. Ne postaje **dvoagentni** maloprodajni sustav samo postavljanjem varijabli okruženja ili spremanjem dodatnih datoteka s uputama. Dodatni agenti, upravljanje alatima, usmjeravanje, autorizacija i pristup podacima zahtijevaju kod aplikacije.

Pregledajte trenutno raspoređene upute i alate agenta u Foundryju. Testirajte jedno činjenično pitanje, jedno pitanje za dohvat i jedno pitanje na koje uzorak podataka ne može odgovoriti. Provjerite citate u odnosu na stvarne izvorne dokumente umjesto da pretpostavljate da je tečan odgovor točan.

## 5.2 Prilagodba dohvaćanja znanja

Predložak podržava dohvaćanje temeljeno na datotekama i opcijskoj integraciji Azure AI Search. Slijedite [trenutni vodič za AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) za indeksiranje i konfiguraciju alata.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Omogućavanje usluge je samo dio dohvaćanja. Prije učitavanja vlastitih podataka:

1. Potvrdite da imate dopuštenje koristiti dokumente i uklonite osjetljive informacije.
2. Odaberite model ugrađivanja podržan u vašoj regiji i postavite njegovu kompatibilnu verziju, vrstu raspoređivanja i dimenzije vektora.
3. Stvorite/napunite indeks koristeći dokumentirani postupak iz uzorka.
4. Konfigurirajte alat agenta za dohvaćanje da koristi taj indeks.
5. Testirajte dohvaćanje, citate, autorizaciju i ponašanje kad ne postoji relevantan dokument.

Nemojte prelaziti s `text-embedding-3-small` na drugi model ugrađivanja bez provjere dimenzija i ponovne gradnje/indeksiranja vektora po potrebi. Ime poput `retail-products` nije implementirani katalog niti politika upravljanja pristupom.

## 5.3 Praćenje i nadzor

Slijedite [vodič za promatranje uzorka](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Osigurajte da potrebni resurs Application Insights i veza već postoje; ako mijenjate postavke infrastrukture, upotrijebite `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Pošaljite testni zahtjev, zatim pregledajte dnevnike aplikacije Container App i prikaz praćenja agenta u Foundryju. Provjerite kašnjenje, pozive alata, pogreške i korelaciju između zahtjeva i praćenja. Nemojte pretpostavljati da je telemetrija povezana samo zato što je raspoređivanje uspjelo.

Ostavite `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` onemogućen osim ako niste izričito pregledali pristanak, redakciju, zadržavanje i kontrole pristupa. Tragovi mogu sadržavati osjetljive argumente alata ili sadržaj dokumenata čak i kada obični dnevnici aplikacije izgledaju bezopasno.

## 5.4 Evaluacija agenta

Ulazna točka za evaluaciju uzorka sada je [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), a ne direktorij `evals/`. Iz korijena uzorka upotrijebite Python okruženje koje zadovoljava njegove dokumentirane zahtjeve:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Prije pokretanja dovršite [zahtjeve za evaluaciju](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Testovi učitavaju konfiguraciju iz odabranog `.azure/<environment>/.env`; potvrdite da je odabrano namijenjeno okruženje. Važni ulazi uključuju:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, koristeći format potreban za trenutni uzorak (pregledana verzija koristi `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, koristi se kao raspoređivanje modela suca

Pregledajte testove da biste razumjeli odabir evaluatora, pragove, potrebne uloge i troškove modela. Dovršeni prolaz nije automatski prolazna kvalitativna vrata; pregledajte rezultate, neuspjele/pogrešne slučajeve i povezane Foundry rezultate.

### Odvojeno proširenje evaluacija AZD

Python test iznad je **specifičan tijek rada za uzorak**. Opcijsko proširenje `azure.ai.evaluations` jest drukčiji tijek rada s vlastitom konfiguracijom `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Za potpunu postavku proširenja, pogledajte [tijekove rada i migraciju evaluacije](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Od kada je dostupno proširenje agenata beta.22, ne koristite uklonjene `azd ai agent eval` naredbe. Instalacija proširenja evaluacije ne pretvara Python testove uzorka niti automatski ne stvara konfiguraciju evaluacije.

## 5.5 AI red teaming i kontinuirana evaluacija

Trenutačni uzorak pruža [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Dovršite njegove preduvjete i pregledajte namijenjenu cilјnu skupinu i troškove prije pokretanja:

```bash
pytest tests/test_red_teaming.py -s
```

Koristite ovlašteno testno raspoređivanje i sintetičke podatke. Pregledajte generirane napade i rezultate; ovaj skeniranje ne potvrđuje da je aplikacija sigurna ili usklađena.

Vodič za [promatranje](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) također opisuje kontinuiranu evaluaciju konfiguriranu pri pokretanju kontejnera. Ona procjenjuje stvarne interakcije korisnika, a ne generirani testni promet, a podrška evaluatoru razlikuje se ovisno o regiji. Nema interakcija znači nema unosa evaluacije. Provjerite instaliranu verziju uzorka i konfiguraciju evaluator prije nego što pretpostavite da svaka implementacija ima iste zadane postavke.

Autentifikacija je odvojena od evaluacije. Slijedite dokumentiranu postavku identiteta/pristupa uzorka. Ne postoji dokumentirani “basic auth fallback” na koji se možete osloniti za zaštitu javne točke pristupa.

## 5.6 Dizajnerska vježba: personalizacija maloprodaje

!!! warning "Dizajnerska vježba, nije gotova implementacija"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Napišite kratak plan koji se bavi:

| Područje | Odluka i dokazi za prikupljanje |
|------|----------------------------------|
| Odgovornosti agenata | Počnite s jednim agentom ili opravdajte zasebne agente Shopper i Loyalty te logiku usmjeravanja |
| Podaci | Definirajte sintetički katalog/naglasnu bazu podataka i vlasništvo nad ažuriranjima |
| Alati | Najprije implementirajte rukovatelje samo za čitanje; specificirajte autorizaciju i provjeru valjanosti za bilo kakve zapise |
| Modeli | Odaberite dostupne kombinacije model/verzija/SKU i provjerite kvotu; izbjegavajte osiguravanje neiskorištenih modela |
| Dohvat | Definirajte indeksiranje, dimenzije ugradnje, citate i kontrole pristupa na razini dokumenata |
| Evaluacija | Dodajte slučajeve očekivanih odgovora, nepodržanih pitanja, korištenja alata i sigurnosnih slučajeva s eksplicitnim pragovima |
| Operacije | Definirajte telemetriju, latenciju/budžete pogrešaka, ograničenja troškova i vlasništvo čišćenja |

Spremanje `custom-agents/shopper-agent-instructions.md` ne uzrokuje da ga uzorak učita. Pronađite kôd aplikacije koji stvara/azurira agenta, povežite svoje pregledane upute tamo i provjerite rezultirajuću verziju agenta prije testa. Upute ne mogu dati pristup podacima ili alatima koje niste implementirali.

Primijenite jednu promjenu u isto vrijeme, ponovno implementirajte pogođene komponente i ponovno pokrenite svoje osnovne upite i evaluacije. Očuvajte funkcionalnu reviziju za usporedbu. Za inspiraciju arhitekture pogledajte [maloprodajni plavi otisak](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), koji također nije potpuna maloprodajna aplikacija.

!!! quote "NA KRAJU OVOG LABOSA TREBALI STE IMATI"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Nastavite na [Rasklop infrastrukture](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
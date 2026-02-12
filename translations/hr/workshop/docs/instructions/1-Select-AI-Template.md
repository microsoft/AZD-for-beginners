# 1. Odaberite predložak

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Opisati što su AZD predlošci
    - [ ] Otkriti i koristiti AZD predloške za AI
    - [ ] Početi s predloškom AI agenata
    - [ ] **Lab 1:** Brzi početak s AZD-om u GitHub Codespaces

---

## 1. Analogija graditelja

Izgradnja modernih AI aplikacija spremnih za poduzeće _od nule_ može biti zastrašujuća. To je malo kao da sami gradite svoj novi dom, ciglu po ciglu. Da, može se napraviti! Ali to nije najučinkovitiji način da se dođe do željenog rezultata! 

Umjesto toga, često počinjemo s postojećim _dizajnerskim nacrtom_ i radimo s arhitektom na prilagodbi prema našim osobnim zahtjevima. I upravo je to pristup koji treba primijeniti pri izgradnji inteligentnih aplikacija. Prvo pronađite dobar dizajn arhitekture koji odgovara vašem području problema. Zatim surađujte sa rješenjskim arhitektom kako biste prilagodili i razvili rješenje za vaš specifični scenarij.

Ali gdje možemo pronaći te dizajnerske nacrte? I kako pronaći arhitekta koji je spreman naučiti nas kako samostalno prilagoditi i implementirati te nacrte? U ovom radionici odgovaramo na ta pitanja predstavljajući vam tri tehnologije:

1. [Azure Developer CLI](https://aka.ms/azd) - alat otvorenog koda koji ubrzava razvojni put od lokalnog razvoja (izgradnje) do implementacije u oblaku (isporuke).
1. [Microsoft Foundry Predlošci](https://ai.azure.com/templates) - standardizirani repozitoriji otvorenog koda koji sadrže uzorke koda, infrastrukture i konfiguracijskih datoteka za implementaciju AI arhitekture rješenja.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - kodirajući agent temeljen na Azure znanju koji nas može voditi kroz kodnu bazu i pomagati u izmjenama - koristeći prirodni jezik.

S ovim alatima u ruci sada možemo _otkriti_ pravi predložak, _implementirati_ ga kako bismo provjerili da radi i _prilagoditi_ ga tako da odgovara našim specifičnim scenarijima. Krenimo i saznajmo kako ti alati funkcioniraju.


---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (ili `azd`) je alat otvorenog koda za naredbenu liniju koji može ubrzati vaš put od koda do oblaka s nizom naredbi prilagođenih programerima, koje dosljedno rade u vašem IDE-u (razvojnom okruženju) i CI/CD (devops) okruženjima.

Sa `azd`, vaš put implementacije može biti jednostavan kao:

- `azd init` - Inicijalizira novi AI projekt iz postojećeg AZD predloška.
- `azd up` - Priprema infrastrukturu i implementira vašu aplikaciju u jednom koraku.
- `azd monitor` - Prikazuje nadzor u stvarnom vremenu i dijagnostiku za vašu implementiranu aplikaciju.
- `azd pipeline config` - Postavlja CI/CD cjevovode za automatizaciju implementacije u Azure.

**🎯 | VJEŽBA**: <br/> Istražite `azd` alat naredbene linije sada u svom GitHub Codespaces okruženju. Počnite upisivanjem ove naredbe da vidite što alat može učiniti:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/hr/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD predložak

Da bi `azd` to postigao, treba znati koju infrastrukturu treba pripremiti, koje konfiguracijske postavke primijeniti i koju aplikaciju implementirati. Tu dolaze [AZD predlošci](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp). 

AZD predlošci su repozitoriji otvorenog koda koji kombiniraju uzorak koda s infrastrukturnim i konfiguracijskim datotekama potrebnim za implementaciju arhitekture rješenja.
Korištenjem pristupa _Infrastruktura-kao-kod_ (IaC), dopuštaju verzioniranje definicija resursa i konfiguracijskih postavki (kao i izvorni kod aplikacije) - stvarajući ponovljive i dosljedne tijekove rada za korisnike tog projekta.

Prilikom izrade ili ponovne upotrebe AZD predloška za _vaš_ scenarij, razmotrite ova pitanja:

1. Što gradite? → Postoji li predložak koji ima početni kod za taj scenarij?
1. Kako je vaše rješenje arhitektonski postavljeno? → Postoji li predložak koji sadrži potrebne resurse?
1. Kako je vaše rješenje implementirano? → Razmislite o `azd deploy` s pre/post-obradnim koracima!
1. Kako ga možete dodatno optimizirati? → Razmislite o ugrađenom nadzoru i automatiziranim cjevovodima!

**🎯 | VJEŽBA**: <br/> 
Posjetite [Awesome AZD](https://azure.github.io/awesome-azd/) galeriju i koristite filtre da istražite preko 250 predložaka koji su trenutno dostupni. Provjerite možete li pronaći onaj koji odgovara _vašim_ zahtjevima.

![Code](../../../../../translated_images/hr/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Predlošci AI aplikacija

Za aplikacije pogonjene AI-jem, Microsoft pruža specijalizirane predloške koji sadrže **Microsoft Foundry** i **Foundry Agents**. Ovi predlošci ubrzavaju vaš put do izgradnje inteligentnih aplikacija spremnih za produkciju.

### Microsoft Foundry i Foundry Agents Predlošci

Odaberite predložak u nastavku za implementaciju. Svaki predložak dostupan je na [Awesome AZD](https://azure.github.io/awesome-azd/) i može se inicijalizirati jednom naredbom.

| Predložak | Opis | Naredba za implementaciju |
|----------|-------------|----------------|
| **[AI Chat s RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Chat aplikacija s Retrieval Augmented Generation koristeći Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Izgradite AI agente s Foundry Agents za autonomnu izvedbu zadataka | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Orkestracija Više Agenata](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Koordinirajte više Foundry Agenata za složene radne tokove | `azd init -t azure-samples/multi-agent-orchestration` |
| **[Inteligencija za Dokumente AI](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Izvlačite i analizirajte dokumente putem Microsoft Foundry modela | `azd init -t azure-samples/ai-document-processing` |
| **[Razgovorni AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Izgradite inteligentne chat botove s Microsoft Foundry integracijom | `azd init -t azure-samples/ai-chat-protocol` |
| **[Generiranje AI Slika](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Generirajte slike koristeći DALL-E putem Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | AI agenti koristeći Semantic Kernel s Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Multi-agent sustavi koristeći AutoGen okvir | `azd init -t azure-samples/autogen-multi-agent` |

### Brzi početak

1. **Pregledajte predloške**: Posjetite [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) i filtrirajte prema `AI`, `Agents` ili `Microsoft Foundry`
2. **Odaberite predložak**: Izaberite onaj koji odgovara vašem slučaju
3. **Inicijalizirajte**: Pokrenite `azd init` naredbu za odabrani predložak
4. **Implementirajte**: Pokrenite `azd up` za pripremu i implementaciju

**🎯 | VJEŽBA**: <br/>
Odaberite jedan od predložaka gore prema vašem scenariju:

- **Gradite chatbota?** → Počnite s **AI Chat s RAG** ili **Razgovorni AI Bot**
- **Trebate autonomne agente?** → Isprobajte **Foundry Agent Service Starter** ili **Orkestraciju Više Agenata**
- **Obrađujete dokumente?** → Koristite **Inteligenciju za Dokumente AI**
- **Želite AI pomoć u kodiranju?** → Istražite **Semantic Kernel Agent** ili **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Istražite Više Predložaka"
    Galerija [Awesome AZD](https://azure.github.io/awesome-azd/) sadrži više od 250 predložaka. Koristite filtre da pronađete predloške koji odgovaraju vašim specifičnim zahtjevima za jezik, okvir i Azure usluge.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden korištenjem AI usluge prevođenja [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati ovlaštenim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
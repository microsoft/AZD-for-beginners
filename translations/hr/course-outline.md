<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-18T11:57:55+00:00",
  "source_file": "course-outline.md",
  "language_code": "hr"
}
-->
## Struktura učenja kroz 8 poglavlja

### Poglavlje 1: Osnove i brzi početak (30-45 minuta) 🌱
**Preduvjeti**: Azure pretplata, osnovno znanje naredbenog retka  
**Složenost**: ⭐

#### Što ćete naučiti
- Razumijevanje osnova Azure Developer CLI
- Instalacija AZD-a na vašoj platformi  
- Vaša prva uspješna implementacija
- Ključni koncepti i terminologija

#### Resursi za učenje
- [Osnove AZD-a](docs/getting-started/azd-basics.md) - Ključni koncepti
- [Instalacija i postavljanje](docs/getting-started/installation.md) - Vodiči specifični za platformu
- [Vaš prvi projekt](docs/getting-started/first-project.md) - Praktični vodič
- [Popis naredbi](resources/cheat-sheet.md) - Brzi referentni vodič

#### Praktični rezultat
Uspješno implementirajte jednostavnu web aplikaciju na Azure koristeći AZD

---

### Poglavlje 2: Razvoj usmjeren na AI (1-2 sata) 🤖
**Preduvjeti**: Završeno poglavlje 1  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Integracija Azure AI Foundry s AZD-om
- Implementacija aplikacija koje koriste AI
- Razumijevanje konfiguracija AI usluga
- Obrasci RAG (Retrieval-Augmented Generation)

#### Resursi za učenje
- [Integracija Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [Implementacija AI modela](docs/ai-foundry/ai-model-deployment.md)
- [AI radionica](docs/ai-foundry/ai-workshop-lab.md) - Praktična radionica
- [Predlošci Azure AI Foundry](README.md#featured-azure-ai-foundry-templates)

#### Praktični rezultat
Implementirajte i konfigurirajte AI aplikaciju za chat s RAG mogućnostima

---

### Poglavlje 3: Konfiguracija i autentifikacija (45-60 minuta) ⚙️
**Preduvjeti**: Završeno poglavlje 1  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Upravljanje konfiguracijom i okruženjem
- Najbolje prakse za autentifikaciju i sigurnost
- Organizacija i imenovanje resursa
- Implementacija u više okruženja

#### Resursi za učenje
- [Vodič za konfiguraciju](docs/getting-started/configuration.md) - Postavljanje okruženja
- Sigurnosni obrasci i upravljani identitet
- Primjeri za više okruženja

#### Praktični rezultat
Upravljajte više okruženja uz pravilnu autentifikaciju i sigurnost

---

### Poglavlje 4: Infrastruktura kao kod i implementacija (1-1.5 sati) 🏗️
**Preduvjeti**: Završena poglavlja 1-3  
**Složenost**: ⭐⭐⭐

#### Što ćete naučiti
- Napredni obrasci implementacije
- Infrastruktura kao kod koristeći Bicep
- Strategije za dodjelu resursa
- Izrada prilagođenih predložaka

#### Resursi za učenje
- [Vodič za implementaciju](docs/deployment/deployment-guide.md) - Kompletni tijekovi rada
- [Dodjela resursa](docs/deployment/provisioning.md) - Upravljanje resursima
- Primjeri za kontejnere i mikroservise

#### Praktični rezultat
Implementirajte složene aplikacije s više servisa koristeći prilagođene infrastrukturne predloške

---

### Poglavlje 5: AI rješenja s više agenata (2-3 sata) 🤖🤖
**Preduvjeti**: Završena poglavlja 1-2  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Obrasci arhitekture s više agenata
- Orkestracija i koordinacija agenata
- AI implementacije spremne za produkciju
- Implementacija agenata za korisnike i inventar

#### Resursi za učenje
- [Maloprodajno rješenje s više agenata](examples/retail-scenario.md) - Kompletna implementacija
- [ARM predložak paketa](../../examples/retail-multiagent-arm-template) - Implementacija jednim klikom
- Obrasci koordinacije agenata

#### Praktični rezultat
Implementirajte i upravljajte AI rješenjem s više agenata spremnim za produkciju

---

### Poglavlje 6: Validacija i planiranje prije implementacije (1 sat) 🔍
**Preduvjeti**: Završeno poglavlje 4  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Planiranje kapaciteta i validacija resursa
- Strategije odabira SKU-a
- Automatske provjere prije implementacije
- Planiranje optimizacije troškova

#### Resursi za učenje
- [Planiranje kapaciteta](docs/pre-deployment/capacity-planning.md) - Validacija resursa
- [Odabir SKU-a](docs/pre-deployment/sku-selection.md) - Isplative opcije
- [Provjere prije implementacije](docs/pre-deployment/preflight-checks.md) - Automatizirani skripti

#### Praktični rezultat
Validirajte i optimizirajte implementacije prije izvršenja

---

### Poglavlje 7: Rješavanje problema i otklanjanje grešaka (1-1.5 sati) 🔧
**Preduvjeti**: Završeno bilo koje poglavlje o implementaciji  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Sustavni pristupi otklanjanju grešaka
- Uobičajeni problemi i rješenja
- Specifično otklanjanje grešaka za AI
- Optimizacija performansi

#### Resursi za učenje
- [Uobičajeni problemi](docs/troubleshooting/common-issues.md) - FAQ i rješenja
- [Vodič za otklanjanje grešaka](docs/troubleshooting/debugging.md) - Korak-po-korak strategije
- [Specifično otklanjanje grešaka za AI](docs/troubleshooting/ai-troubleshooting.md) - Problemi s AI uslugama

#### Praktični rezultat
Samostalno dijagnosticirajte i riješite uobičajene probleme s implementacijom

---

### Poglavlje 8: Produkcija i obrasci za poduzeća (2-3 sata) 🏢
**Preduvjeti**: Završena poglavlja 1-4  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Strategije implementacije za produkciju
- Sigurnosni obrasci za poduzeća
- Praćenje i optimizacija troškova
- Skalabilnost i upravljanje

#### Resursi za učenje
- [Najbolje prakse za produkcijski AI](docs/ai-foundry/production-ai-practices.md) - Obrasci za poduzeća
- Primjeri za mikroservise i poduzeća
- Okviri za praćenje i upravljanje

#### Praktični rezultat
Implementirajte aplikacije spremne za poduzeća s punim produkcijskim mogućnostima

---

## Napredak u učenju i složenost

### Progresivno razvijanje vještina

- **🌱 Početnici**: Započnite s Poglavljem 1 (Osnove) → Poglavlje 2 (Razvoj AI-a)
- **🔧 Srednji nivo**: Poglavlja 3-4 (Konfiguracija i infrastruktura) → Poglavlje 6 (Validacija)
- **🚀 Napredni nivo**: Poglavlje 5 (Rješenja s više agenata) → Poglavlje 7 (Rješavanje problema)
- **🏢 Poduzeća**: Završite sva poglavlja, fokusirajte se na Poglavlje 8 (Obrasci za produkciju)

### Indikatori složenosti

- **⭐ Osnovno**: Jednostavni koncepti, vođeni vodiči, 30-60 minuta
- **⭐⭐ Srednje**: Više koncepata, praktična vježba, 1-2 sata  
- **⭐⭐⭐ Napredno**: Složene arhitekture, prilagođena rješenja, 1-3 sata
- **⭐⭐⭐⭐ Ekspertno**: Produkcijski sustavi, obrasci za poduzeća, 2-4 sata

### Fleksibilni putovi učenja

#### 🎯 Brzi put za AI developere (4-6 sati)
1. **Poglavlje 1**: Osnove i brzi početak (45 minuta)
2. **Poglavlje 2**: Razvoj usmjeren na AI (2 sata)  
3. **Poglavlje 5**: AI rješenja s više agenata (3 sata)
4. **Poglavlje 8**: Najbolje prakse za produkcijski AI (1 sat)

#### 🛠️ Put za stručnjake za infrastrukturu (5-7 sati)
1. **Poglavlje 1**: Osnove i brzi početak (45 minuta)
2. **Poglavlje 3**: Konfiguracija i autentifikacija (1 sat)
3. **Poglavlje 4**: Infrastruktura kao kod i implementacija (1.5 sati)
4. **Poglavlje 6**: Validacija i planiranje prije implementacije (1 sat)
5. **Poglavlje 7**: Rješavanje problema i otklanjanje grešaka (1.5 sati)
6. **Poglavlje 8**: Produkcija i obrasci za poduzeća (2 sata)

#### 🎓 Kompletno putovanje učenja (8-12 sati)
Sekvencijalno završavanje svih 8 poglavlja uz praktičnu vježbu i validaciju

## Okvir za završetak tečaja

### Validacija znanja
- **Kontrolne točke poglavlja**: Praktične vježbe s mjerljivim rezultatima
- **Praktična provjera**: Implementirajte funkcionalna rješenja za svako poglavlje
- **Praćenje napretka**: Vizualni indikatori i značke za završetak
- **Validacija zajednice**: Podijelite iskustva na Azure Discord kanalima

### Procjena rezultata učenja

#### Završetak poglavlja 1-2 (Osnove + AI)
- ✅ Implementirajte osnovnu web aplikaciju koristeći AZD
- ✅ Implementirajte AI aplikaciju za chat s RAG mogućnostima
- ✅ Razumijte osnovne koncepte AZD-a i AI integracije

#### Završetak poglavlja 3-4 (Konfiguracija + infrastruktura)  
- ✅ Upravljajte implementacijama u više okruženja
- ✅ Izradite prilagođene infrastrukturne predloške koristeći Bicep
- ✅ Implementirajte sigurne obrasce autentifikacije

#### Završetak poglavlja 5-6 (Više agenata + validacija)
- ✅ Implementirajte složeno AI rješenje s više agenata
- ✅ Provedite planiranje kapaciteta i optimizaciju troškova
- ✅ Implementirajte automatiziranu validaciju prije implementacije

#### Završetak poglavlja 7-8 (Rješavanje problema + produkcija)
- ✅ Samostalno otklonite probleme s implementacijom  
- ✅ Implementirajte praćenje i sigurnost na razini poduzeća
- ✅ Implementirajte aplikacije spremne za produkciju s upravljanjem

### Certifikacija i priznanje
- **Značka za završetak tečaja**: Završite svih 8 poglavlja uz praktičnu validaciju
- **Priznanje zajednice**: Aktivno sudjelovanje u Azure AI Foundry Discordu
- **Profesionalni razvoj**: Vještine relevantne za implementaciju AZD-a i AI-a
- **Napredak u karijeri**: Sposobnosti za implementaciju u oblaku spremne za poduzeća

## Prikladnost sadržaja za moderne developere

### Tehnička dubina i pokrivenost
- **Integracija Azure OpenAI**: Potpuna pokrivenost GPT-4o, ugrađivanja i implementacije više modela
- **Obrasci AI arhitekture**: Implementacije RAG-a, orkestracija više agenata i produkcijski AI tijekovi rada
- **Infrastruktura kao kod**: Bicep predlošci, ARM implementacije i automatizirana dodjela resursa
- **Spremnost za produkciju**: Sigurnost, skaliranje, praćenje, optimizacija troškova i upravljanje
- **Obrasci za poduzeća**: Implementacije u više okruženja, CI/CD integracija i okviri za usklađenost

### Fokus na praktično učenje
- **Automatizacija implementacije**: Naglasak na praktične AZD tijekove rada, ne teorijske koncepte
- **Scenariji iz stvarnog svijeta**: Kompletno maloprodajno rješenje s više agenata za korisnike i inventar
- **Primjeri za produkciju**: ARM predlošci, implementacije jednim klikom i obrasci za poduzeća
- **Vještine rješavanja problema**: Specifično otklanjanje grešaka za AI, dijagnostika više servisa i optimizacija performansi
- **Industrijska relevantnost**: Temeljeno na povratnim informacijama zajednice Azure AI Foundry i zahtjevima poduzeća

### Integracija zajednice i podrške
- **Integracija Discorda**: Aktivno sudjelovanje u zajednicama Azure AI Foundry i Microsoft Azure
- **Rasprave na GitHubu**: Suradničko učenje i rješavanje problema s kolegama i stručnjacima
- **Pristup stručnjacima**: Direktna povezanost s Microsoft inženjerima i stručnjacima za implementaciju AI-a
- **Kontinuirana ažuriranja**: Sadržaj tečaja se razvija s ažuriranjima Azure platforme i povratnim informacijama zajednice
- **Razvoj karijere**: Vještine direktno primjenjive na moderne uloge u razvoju oblaka i AI-a

### Validacija rezultata učenja
- **Mjerljive vještine**: Svako poglavlje uključuje praktične vježbe implementacije s provjerljivim rezultatima
- **Razvoj portfelja**: Kompletni projekti prikladni za profesionalne portfelje i intervjue za posao
- **Priznanje u industriji**: Vještine usklađene s trenutnim zahtjevima tržišta rada za AZD i AI implementaciju
- **Profesionalna mreža**: Pristup zajednici Azure developera za napredak u karijeri i suradnju

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za nesporazume ili pogrešne interpretacije koje mogu proizaći iz korištenja ovog prijevoda.
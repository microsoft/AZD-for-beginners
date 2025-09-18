<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-18T14:02:40+00:00",
  "source_file": "course-outline.md",
  "language_code": "lt"
}
-->
## 8 skyrių mokymosi struktūra

### 1 skyrius: Pagrindai ir greitas startas (30–45 minutės) 🌱
**Reikalavimai**: Azure prenumerata, pagrindinės komandinės eilutės žinios  
**Sudėtingumas**: ⭐

#### Ko išmoksite
- Azure Developer CLI pagrindų supratimas
- AZD diegimas jūsų platformoje  
- Pirmasis sėkmingas diegimas
- Pagrindinės sąvokos ir terminai

#### Mokymosi ištekliai
- [AZD pagrindai](docs/getting-started/azd-basics.md) - Pagrindinės sąvokos
- [Diegimas ir nustatymas](docs/getting-started/installation.md) - Platformai pritaikyti vadovai
- [Jūsų pirmasis projektas](docs/getting-started/first-project.md) - Praktinis vadovas
- [Komandų atmintinė](resources/cheat-sheet.md) - Greita nuoroda

#### Praktinis rezultatas
Sėkmingai įdiegti paprastą interneto programą į Azure naudojant AZD

---

### 2 skyrius: AI pagrindu sukurtas vystymas (1–2 valandos) 🤖
**Reikalavimai**: Baigtas 1 skyrius  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Azure AI Foundry integracija su AZD
- AI pagrindu sukurtų programų diegimas
- AI paslaugų konfigūracijų supratimas
- RAG (Retrieval-Augmented Generation) modeliai

#### Mokymosi ištekliai
- [Azure AI Foundry integracija](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI modelio diegimas](docs/ai-foundry/ai-model-deployment.md)
- [AI dirbtuvių laboratorija](docs/ai-foundry/ai-workshop-lab.md) - Praktinė laboratorija
- [Azure AI Foundry šablonai](README.md#featured-azure-ai-foundry-templates)

#### Praktinis rezultatas
Įdiegti ir sukonfigūruoti AI pagrindu sukurtą pokalbių programą su RAG funkcijomis

---

### 3 skyrius: Konfigūracija ir autentifikacija (45–60 minutės) ⚙️
**Reikalavimai**: Baigtas 1 skyrius  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Aplinkos konfigūracija ir valdymas
- Autentifikacijos ir saugumo geriausios praktikos
- Išteklių pavadinimų ir organizavimo strategijos
- Diegimas keliuose aplinkose

#### Mokymosi ištekliai
- [Konfigūracijos vadovas](docs/getting-started/configuration.md) - Aplinkos nustatymas
- Saugumo modeliai ir valdomos tapatybės
- Pavyzdžiai kelioms aplinkoms

#### Praktinis rezultatas
Valdyti kelias aplinkas su tinkama autentifikacija ir saugumu

---

### 4 skyrius: Infrastruktūra kaip kodas ir diegimas (1–1,5 valandos) 🏗️
**Reikalavimai**: Baigti 1–3 skyriai  
**Sudėtingumas**: ⭐⭐⭐

#### Ko išmoksite
- Pažangūs diegimo modeliai
- Infrastruktūra kaip kodas naudojant Bicep
- Išteklių teikimo strategijos
- Individualių šablonų kūrimas

#### Mokymosi ištekliai
- [Diegimo vadovas](docs/deployment/deployment-guide.md) - Pilni darbo procesai
- [Išteklių teikimas](docs/deployment/provisioning.md) - Išteklių valdymas
- Konteinerių ir mikroservisų pavyzdžiai

#### Praktinis rezultatas
Įdiegti sudėtingas daugiapakopės paslaugų programas naudojant individualius infrastruktūros šablonus

---

### 5 skyrius: AI sprendimai su keliais agentais (2–3 valandos) 🤖🤖
**Reikalavimai**: Baigti 1–2 skyriai  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Architektūros modeliai su keliais agentais
- Agentų koordinavimas ir valdymas
- AI diegimas, paruoštas gamybai
- Klientų ir inventoriaus agentų įgyvendinimas

#### Mokymosi ištekliai
- [Mažmeninės prekybos sprendimas su keliais agentais](examples/retail-scenario.md) - Pilnas įgyvendinimas
- [ARM šablonų paketas](../../examples/retail-multiagent-arm-template) - Vieno paspaudimo diegimas
- Agentų koordinavimo modeliai

#### Praktinis rezultatas
Įdiegti ir valdyti gamybai paruoštą AI sprendimą su keliais agentais

---

### 6 skyrius: Prieš diegimą: patikrinimas ir planavimas (1 valanda) 🔍
**Reikalavimai**: Baigtas 4 skyrius  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Pajėgumų planavimas ir išteklių patikrinimas
- SKU pasirinkimo strategijos
- Prieš diegimą atliekami patikrinimai ir automatizavimas
- Kaštų optimizavimo planavimas

#### Mokymosi ištekliai
- [Pajėgumų planavimas](docs/pre-deployment/capacity-planning.md) - Išteklių patikrinimas
- [SKU pasirinkimas](docs/pre-deployment/sku-selection.md) - Kaštų efektyvumo pasirinkimai
- [Prieš diegimą atliekami patikrinimai](docs/pre-deployment/preflight-checks.md) - Automatiniai scenarijai

#### Praktinis rezultatas
Patikrinti ir optimizuoti diegimus prieš vykdymą

---

### 7 skyrius: Trikčių šalinimas ir derinimas (1–1,5 valandos) 🔧
**Reikalavimai**: Baigtas bet kuris diegimo skyrius  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Sistemingi trikčių šalinimo metodai
- Dažniausios problemos ir jų sprendimai
- AI specifinis trikčių šalinimas
- Našumo optimizavimas

#### Mokymosi ištekliai
- [Dažniausios problemos](docs/troubleshooting/common-issues.md) - DUK ir sprendimai
- [Derinimo vadovas](docs/troubleshooting/debugging.md) - Žingsnis po žingsnio strategijos
- [AI specifinis trikčių šalinimas](docs/troubleshooting/ai-troubleshooting.md) - AI paslaugų problemos

#### Praktinis rezultatas
Savarankiškai diagnozuoti ir spręsti dažniausias diegimo problemas

---

### 8 skyrius: Gamyba ir įmonių modeliai (2–3 valandos) 🏢
**Reikalavimai**: Baigti 1–4 skyriai  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Gamybos diegimo strategijos
- Įmonių saugumo modeliai
- Stebėjimas ir kaštų optimizavimas
- Skalavimas ir valdymas

#### Mokymosi ištekliai
- [Gamybos AI geriausios praktikos](docs/ai-foundry/production-ai-practices.md) - Įmonių modeliai
- Mikroservisų ir įmonių pavyzdžiai
- Stebėjimo ir valdymo sistemos

#### Praktinis rezultatas
Įdiegti gamybai paruoštas programas su pilnomis valdymo galimybėmis

---

## Mokymosi progresija ir sudėtingumas

### Progresyvus įgūdžių ugdymas

- **🌱 Pradedantieji**: Pradėkite nuo 1 skyriaus (Pagrindai) → 2 skyrius (AI vystymas)
- **🔧 Vidutinio lygio**: 3–4 skyriai (Konfigūracija ir infrastruktūra) → 6 skyrius (Patikrinimas)
- **🚀 Pažengusieji**: 5 skyrius (Sprendimai su keliais agentais) → 7 skyrius (Trikčių šalinimas)
- **🏢 Įmonių lygis**: Baigti visus skyrius, sutelkti dėmesį į 8 skyrių (Gamybos modeliai)

### Sudėtingumo indikatoriai

- **⭐ Pagrindinis**: Vienos sąvokos, vadovaujami mokymai, 30–60 minučių
- **⭐⭐ Vidutinis**: Kelios sąvokos, praktiniai užsiėmimai, 1–2 valandos  
- **⭐⭐⭐ Pažengęs**: Sudėtingos architektūros, individualūs sprendimai, 1–3 valandos
- **⭐⭐⭐⭐ Ekspertas**: Gamybos sistemos, įmonių modeliai, 2–4 valandos

### Lankstūs mokymosi keliai

#### 🎯 AI kūrėjo greitas kelias (4–6 valandos)
1. **1 skyrius**: Pagrindai ir greitas startas (45 min.)
2. **2 skyrius**: AI pagrindu sukurtas vystymas (2 val.)  
3. **5 skyrius**: AI sprendimai su keliais agentais (3 val.)
4. **8 skyrius**: Gamybos AI geriausios praktikos (1 val.)

#### 🛠️ Infrastruktūros specialisto kelias (5–7 valandos)
1. **1 skyrius**: Pagrindai ir greitas startas (45 min.)
2. **3 skyrius**: Konfigūracija ir autentifikacija (1 val.)
3. **4 skyrius**: Infrastruktūra kaip kodas ir diegimas (1,5 val.)
4. **6 skyrius**: Prieš diegimą: patikrinimas ir planavimas (1 val.)
5. **7 skyrius**: Trikčių šalinimas ir derinimas (1,5 val.)
6. **8 skyrius**: Gamyba ir įmonių modeliai (2 val.)

#### 🎓 Pilnas mokymosi kelias (8–12 valandų)
Nuoseklus visų 8 skyrių užbaigimas su praktiniais užsiėmimais ir patikrinimu

## Kurso užbaigimo struktūra

### Žinių patikrinimas
- **Skyrių kontroliniai taškai**: Praktiniai užsiėmimai su matomais rezultatais
- **Praktinis patikrinimas**: Veikiančių sprendimų diegimas kiekvienam skyriui
- **Progresijos stebėjimas**: Vizualiniai indikatoriai ir užbaigimo ženkliukai
- **Bendruomenės patikrinimas**: Dalinkitės patirtimi Azure Discord kanaluose

### Mokymosi rezultatų vertinimas

#### 1–2 skyrių užbaigimas (Pagrindai + AI)
- ✅ Įdiegti paprastą interneto programą naudojant AZD
- ✅ Įdiegti AI pagrindu sukurtą pokalbių programą su RAG
- ✅ Suprasti AZD pagrindines sąvokas ir AI integraciją

#### 3–4 skyrių užbaigimas (Konfigūracija + infrastruktūra)  
- ✅ Valdyti diegimus keliuose aplinkose
- ✅ Sukurti individualius Bicep infrastruktūros šablonus
- ✅ Įgyvendinti saugias autentifikacijos strategijas

#### 5–6 skyrių užbaigimas (Keliais agentais + patikrinimas)
- ✅ Įdiegti sudėtingą AI sprendimą su keliais agentais
- ✅ Atlikti pajėgumų planavimą ir kaštų optimizavimą
- ✅ Įgyvendinti automatizuotą prieš diegimą atliekamą patikrinimą

#### 7–8 skyrių užbaigimas (Trikčių šalinimas + gamyba)
- ✅ Savarankiškai šalinti ir spręsti diegimo problemas  
- ✅ Įgyvendinti įmonių stebėjimo ir saugumo modelius
- ✅ Įdiegti gamybai paruoštas programas su valdymo galimybėmis

### Sertifikavimas ir pripažinimas
- **Kurso užbaigimo ženkliukas**: Užbaigti visus 8 skyrius su praktiniu patikrinimu
- **Bendruomenės pripažinimas**: Aktyvus dalyvavimas Azure AI Foundry Discord
- **Profesinis tobulėjimas**: Pramonėje aktualūs AZD ir AI diegimo įgūdžiai
- **Karjeros pažanga**: Įmonių lygio debesų diegimo galimybės

## Turinys tinkamas šiuolaikiniams kūrėjams

### Techninis gylis ir aprėptis
- **Azure OpenAI integracija**: Pilna GPT-4o, įterpimų ir daugiamodelių diegimų aprėptis
- **AI architektūros modeliai**: RAG įgyvendinimai, agentų koordinavimas ir gamybos AI darbo procesai
- **Infrastruktūra kaip kodas**: Bicep šablonai, ARM diegimai ir automatinis teikimas
- **Gamybos pasirengimas**: Saugumas, skalavimas, stebėjimas, kaštų optimizavimas ir valdymas
- **Įmonių modeliai**: Diegimai keliuose aplinkose, CI/CD integracija ir atitikties modeliai

### Praktinis mokymosi dėmesys
- **Diegimo automatizavimas**: Dėmesys praktiniams AZD darbo procesams, o ne teorinėms sąvokoms
- **Realių situacijų scenarijai**: Pilnas mažmeninės prekybos sprendimas su klientų ir inventoriaus agentais
- **Gamybos pavyzdžiai**: ARM šablonų paketai, vieno paspaudimo diegimai ir įmonių modeliai
- **Trikčių šalinimo įgūdžiai**: AI specifinis derinimas, daugiapakopės diagnostikos ir našumo optimizavimas
- **Pramonės aktualumas**: Remiantis Azure AI Foundry bendruomenės atsiliepimais ir įmonių poreikiais

### Bendruomenės ir palaikymo integracija
- **Discord integracija**: Aktyvus dalyvavimas Azure AI Foundry ir Microsoft Azure bendruomenėse
- **GitHub diskusijos**: Bendradarbiavimas mokantis ir sprendžiant problemas su kolegomis ir ekspertais
- **Ekspertų prieiga**: Tiesioginis ryšys su Microsoft inžinieriais ir AI diegimo specialistais
- **Nuolatiniai atnaujinimai**: Kurso turinys atnaujinamas pagal Azure platformos naujienas ir bendruomenės atsiliepimus
- **Karjeros vystymas**: Įgūdžiai tiesiogiai pritaikomi šiuolaikiniams debesų ir AI vystymo vaidmenims

### Mokymosi rezultatų patikrinimas
- **Matomi įgūdžiai**: Kiekvienas skyrius apima praktinius diegimo užsiėmimus su patikrinamais rezultatais
- **Portfelio kūrimas**: Baigti projektai tinkami profesionaliems portfeliams ir darbo pokalbiams
- **Pramonės pripažinimas**: Įgūdžiai atitinka dabartinius darbo rinkos poreikius AZD ir AI diegimo srityje
- **Profesinis tinklas**: Prieiga prie Azure kūrėjų bendruomenės karjeros pažangai ir bendradarbiavimui

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius naudojant šį vertimą.
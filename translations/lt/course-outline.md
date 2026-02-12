# AZD Pradedantiesiems: Kurso Apžvalga ir Mokymosi Sistema

## Kurso Apžvalga

Išmokite Azure Developer CLI (azd) naudojimą per struktūrizuotus skyrius, sukurtus palaipsniui mokytis. **Dėmesys AI taikymų diegimui su Microsoft Foundry integracija.**

### Kodėl Šis Kursas Yra Būtinas Šiuolaikiniams Programuotojams

Remiantis Microsoft Foundry Discord bendruomenės įžvalgomis, **45 % programuotojų nori naudoti AZD AI darbo krūviams**, bet susiduria su iššūkiais:
- Sudėtingos daugiaservisinės AI architektūros
- Geriausios praktikos AI produkcijos diegime  
- Azure AI paslaugų integravimas ir konfigūracija
- Sąnaudų optimizavimas AI darbo krūviams
- AI specifinių diegimo problemų trikčių šalinimas

### Pagrindiniai Mokymosi Tikslai

Baigę šį struktūrizuotą kursą, Jūs:
- **Išmoksite AZD pagrindus**: Pagrindinės sąvokos, diegimas ir konfigūracija
- **Diegsite AI programėles**: Naudosite AZD su Microsoft Foundry paslaugomis
- **Įgyvendinsite Infrastructure as Code**: Valdysite Azure išteklius su Bicep šablonais
- **Trikčių šalinimą**: Spręsite įprastas problemas ir darysite klaidų paiešką
- **Optimizuosite produkcijai**: Saugumas, mastelio keitimas, stebėsena ir sąnaudų valdymas
- **Kursite daugiaagentų sprendimus**: Diegsite sudėtingas AI architektūras

## 🎓 Dirbtuvėse gaunama mokymosi patirtis

### Lankstūs mokymosi būdai
Šis kursas sukurtas palaikyti tiek **savarankišką individualų mokymąsi**, tiek **vadovaujamus dirbtuvių seansus**, suteikiant mokiniams galimybę praktiškai naudotis AZD ir įgyti praktiškų įgūdžių per interaktyvias užduotis.

#### 🚀 Savarankiško mokymosi režimas
**Puikus individualiems programuotojams bei nuolatiniam mokymuisi**

**Savybės:**
- **Naršyklėje veikianti sąsaja**: Pilnai MkDocs varoma dirbtuvė, pasiekiama per bet kurią naršyklę
- **GitHub Codespaces integracija**: Vieno spustelėjimo kūrimo aplinka su iš anksto sukonfigūruotais įrankiais
- **Interaktyvi DevContainer aplinka**: Nereikia vietinės sąrankos - pradėkite koduoti iš karto
- **Progreso sekimas**: Įmontuotos kontrolinės punktai ir patvirtinimo užduotys
- **Bendruomenės palaikymas**: Prieiga prie Azure Discord kanalų klausimams ir bendradarbiavimui

**Mokymosi struktūra:**
- **Lankstus laiko tvarkaraštis**: Baikite skyrius savo tempu per kelias dienas ar savaites
- **Kontrolinių punktų sistema**: Patvirtinkite žinias prieš pereidami prie sudėtingesnių temų
- **Ištekliai**: Išsami dokumentacija, pavyzdžiai ir trikčių šalinimo vadovai
- **Portfolio kūrimas**: Kurkite diegiamus projektus savo profesionaliam portfeliui

**Pradžia (savęs mokymuisi):**
```bash
# Parinktis 1: GitHub Codespaces (Rekomenduojama)
# Eikite į saugyklą ir spustelėkite „Code“ → „Create codespace on main“

# Parinktis 2: Vietinis vystymas
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Vadovaukitės diegimo instrukcijomis faile workshop/README.md
```

#### 🏛️ Vadovaujamos dirbtuvės
**Tinka įmonių mokymams, stovykloms ir švietimo įstaigoms**

**Dirbtuvių formatų galimybės:**

**📚 Akademinių kursų integracija (8-12 savaičių)**
- **Universitetų programos**: Semestro kursas su savaitiniais 2 valandų seansais
- **Stovyklos formatas**: Intensyvus 3-5 dienų programos su kasdieniniais 6-8 valandų seansais
- **Įmonių mokymai**: Mėnesio komandos seansai su praktiniais projekto įgyvendinimais
- **Vertinimo sistema**: Įvertintos užduotys, kolegų peržiūros ir baigiamieji projektai

**🚀 Intensyvios dirbtuvės (1-3 dienos)**
- **1 diena**: Pagrindai + AI vystymas (1-2 skyriai) - 6 valandos
- **2 diena**: Konfigūracija + infrastruktūra (3-4 skyriai) - 6 valandos  
- **3 diena**: Pažangūs modeliai + produkcija (5-8 skyriai) - 8 valandos
- **Tolimesnė pagalba**: Pasirenkamas 2 savaičių mentoriavimas projekto užbaigimui

**⚡ Vadovų susipažinimo sesija (4-6 valandos)**
- **Strateginė apžvalga**: AZD vertės pasiūlymas ir verslo poveikis (1 valanda)
- **Praktinis demo**: Pilnas AI programėlės diegimas (2 valandos)
- **Architektūros peržiūra**: Įmonių modeliai ir valdymas (1 valanda)
- **Įgyvendinimo planavimas**: Organizacijos adaptacijos strategija (1-2 valandos)

#### 🛠️ Dirbtuvių mokymosi metodika
**Atrankos → Diegimo → Tinklinimo metodika praktiniam įgūdžių įgijimui**

**1 fazė: Atranka (45 minutės)**
- **Šablonų tyrimas**: Vertinkite Microsoft Foundry šablonus ir paslaugas
- **Architektūros analizė**: Supraskite daugiaagentės architektūros modelius ir diegimo strategijas
- **Reikalavimų vertinimas**: Nustatykite organizacijos poreikius ir ribojimus
- **Aplinkos paruošimas**: Konfigūruokite kūrimo aplinką ir Azure išteklius

**2 fazė: Diegimas (2 valandos)**
- **Vedama įgyvendinimo eiga**: Žingsnis po žingsnio AI programėlių diegimas su AZD
- **Paslaugų konfigūracija**: Konfigūruokite Azure AI paslaugas, galinius taškus ir autentifikaciją
- **Saugumo įgyvendinimas**: Taikykite įmonių saugumo modelius ir prieigos valdymą
- **Patvirtinimo testavimas**: Patikrinkite diegimus ir šalinkite dažnas problemas

**3 fazė: Tinklinimas (45 minutės)**
- **Programėlių modifikavimas**: Pritaikykite šablonus konkretiems naudojimo atvejams ir reikalavimams
- **Optimali produkcija**: Įgyvendinkite stebėsenos, sąnaudų valdymo ir mastelio keitimo strategijas
- **Pažangūs modeliai**: Ištirkite daugiaagentės koordinavimo ir sudėtingų architektūrų galimybes
- **Tolesni žingsniai**: Nustatykite mokymosi kelią tolesniam įgūdžių tobulinimui

#### 🎯 Dirbtuvių mokymosi rezultatai
**Įgūdžių įvertinimas per praktinę veiklą**

**Techniniai gebėjimai:**
- **Diegti AI programėles produkcijoje**: Sėkmingai diegti ir konfigūruoti AI sprendimus
- **Infrastructure as Code valdymas**: Kurti ir valdyti adaptyvius Bicep šablonus
- **Daugiaagentė architektūra**: Įgyvendinti koordinuotus AI agentų sprendimus
- **Produkcinis pasirengimas**: Taikyti saugumo, stebėsenos ir valdymo modelius
- **Trikčių šalinimo įgūdžiai**: Savarankiškai spręsti diegimo ir konfigūracijos problemas

**Profesiniai gebėjimai:**
- **Projekto valdymas**: Vadovauti techninėms komandoms debesijos diegimuose
- **Architektūros projektavimas**: Kurti mastelio keičiamus ir sąnaudų efektyvius Azure sprendimus
- **Žinių perdavimas**: Mokyti ir mentoriauti kolegas AZD geriausiose praktikose
- **Strateginis planavimas**: Įtakoti organizacijos debesijos adaptacijos strategijas

#### 📋 Dirbtuvių ištekliai ir medžiagos
**Išsamus rinkinys vedėjams ir mokiniams**

**Vedėjams:**
- **Instruktoriaus vadovas**: [Dirbtuvių apžvalga](workshop/README.md) - sesijų planavimas ir vedimas
- **Pristatymo medžiaga**: Skaidrės, architektūros schemos ir demo scenarijai
- **Vertinimo priemonės**: Praktinės užduotys, žinių patikrinimai ir vertinimo kriterijai
- **Techninė sąranka**: Aplinkos konfigūracijos, trikčių šalinimo vadovai ir atsarginiai planai

**Mokiniams:**
- **Interaktyvi dirbtuvių aplinka**: [Dirbtuvių medžiaga](workshop/README.md) - naršyklėje veikianti mokymosi platforma
- **Žingsnis po žingsnio instrukcijos**: [Vedinamos užduotys](../../workshop/docs/instructions) - išsamūs įgyvendinimo pavyzdžiai  
- **Nuorodų dokumentacija**: [AI dirbtuvių laboratorija](docs/microsoft-foundry/ai-workshop-lab.md) - AI tematikos giluminės žinios
- **Bendruomenės ištekliai**: Azure Discord kanalai, GitHub diskusijos ir ekspertų pagalba

#### 🏢 Įmonių dirbtuvių įgyvendinimas
**Organizacinių diegimo ir mokymo strategijos**

**Įmonių mokymo programos:**
- **Naujų darbuotojų integracija**: Naujo personalo įvadinis mokymas su AZD pagrindais (2-4 savaitės)
- **Komandų tobulinimas**: Kas ketvirtinės dirbtuvės esamoms plėtros komandoms (1-2 dienos)
- **Architektūros peržiūra**: Mėnesio seansai vyresniems inžinieriams ir architektams (4 valandos)
- **Vadovų susitikimai**: Vadovų dirbtuvės techniniams sprendimų priėmėjams (pusdienis)

**Įgyvendinimo palaikymas:**
- **Individualios dirbtuvės**: Turinys pritaikytas specifiniams organizacijos poreikiams
- **Bandomųjų projektų valdymas**: Struktūruotas įgyvendinimas su sėkmės metrika ir grįžtamuoju ryšiu  
- **Nuolatinis mentoriavimas**: Po dirbtuvių palaikymas projektų įgyvendinimui
- **Bendruomenės kūrimas**: Vidinės Azure AI programuotojų bendruomenės ir žinių dalijimasis

**Sėkmės matavimas:**
- **Įgūdžių įsisavinimas**: Prieš ir po vertinimai, matuojantys techninių gebėjimų augimą
- **Prod. diegimo sėkmė**: Dalyvių, sėkmingai įdiegusių produkcines programėles, procentas
- **Produktyvumo laikas**: Sutrumpintas naujų Azure AI projektų įsisavinimo laikotarpis
- **Žinių išlaikymas**: Tolimesni vertinimai 3-6 mėnesius po dirbtuvių

## 8 skyrių mokymosi struktūra

### 1 skyrius: Pagrindai ir greitas startas (30-45 minutės) 🌱
**Reikalavimai**: Azure prenumerata, pagrindinės komandinės eilutės žinios  
**Sudėtingumas**: ⭐

#### Ko išmoksite
- Suprasti Azure Developer CLI pagrindus
- Įdiegti AZD savo platformoje  
- Padaryti pirmą sėkmingą diegimą
- Pagrindinės sąvokos ir terminai

#### Mokymosi šaltiniai
- [AZD pagrindai](docs/getting-started/azd-basics.md) - Pagrindinės sąvokos
- [Diegimas ir sąranka](docs/getting-started/installation.md) - Platformos vadovai
- [Jūsų pirmas projektas](docs/getting-started/first-project.md) - Praktinis vadovas
- [Komandų spartusis vadovas](resources/cheat-sheet.md) - Greita atmintinė

#### Praktinis rezultatas
Sėkmingai įdiekite paprastą internetinę programėlę į Azure naudojant AZD

---

### 2 skyrius: AI-pirmas vystymas (1-2 valandos) 🤖
**Reikalavimai**: 1 skyrius baigtas  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Microsoft Foundry integracija su AZD
- AI palaikomų programėlių diegimas
- AI paslaugų konfigūracijų supratimas
- RAG (gavimo stiprinimo) modeliai

#### Mokymosi šaltiniai
- [Microsoft Foundry integracija](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI modelių diegimas](docs/microsoft-foundry/ai-model-deployment.md)
- [AI dirbtuvių laboratorija](docs/microsoft-foundry/ai-workshop-lab.md) - **NAUJA**: Išsami 2-3 valandų praktinė laboratorija
- [Interaktyvus dirbtuvių vadovas](workshop/README.md) - **NAUJA**: Naršyklėje veikianti dirbtuvių platforma su MkDocs peržiūra
- [Microsoft Foundry šablonai](README.md#featured-microsoft-foundry-templates)
- [Dirbtuvių instrukcijos](../../workshop/docs/instructions) - **NAUJA**: Žingsnis po žingsnio vedamos užduotys

#### Praktinis rezultatas
Įdiekite ir sukonfigūruokite AI palaikomą pokalbių programėlę su RAG funkcionalumu

#### Dirbtuvių mokymosi kelias (pasirinkimas papildymui)
**NAUJA interaktyvi patirtis**: [Pilnas dirbtuvių vadovas](workshop/README.md)
1. **Atranka** (30 min): Šablonų pasirinkimas ir įvertinimas
2. **Diegimas** (45 min): AI šablono funkcionalumo diegimas ir patikrinimas  
3. **Išardymas** (30 min): Šablono architektūros ir komponentų supratimas
4. **Konfigūracija** (30 min): Nustatymų ir parametrų pritaikymas
5. **Tinklinimas** (45 min): Modifikavimas ir darbo tęsinys
6. **Valymas** (15 min): Išteklių pašalinimas ir jų ciklo supratimas
7. **Apibendrinimas** (15 min): Tolimesni žingsniai ir pažangesni mokymosi keliai

---

### 3 skyrius: Konfigūracija ir autentifikacija (45-60 minučių) ⚙️
**Reikalavimai**: 1 skyrius baigtas  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Aplinkos konfigūracija ir valdymas
- Autentifikacijos ir saugumo geriausios praktikos
- Išteklų pavadinimai ir organizavimas
- Daugiaplaniai diegimai

#### Mokymosi šaltiniai
- [Konfigūracijos vadovas](docs/getting-started/configuration.md) - Aplinkos nustatymas
- [Autentifikacija ir saugumo modeliai](docs/getting-started/authsecurity.md) - Valdomos tapatybės ir Key Vault integracija
- Pavyzdžiai su keliomis aplinkomis

#### Praktinis rezultatas
Valdykite kelias aplinkas su tinkama autentifikacija ir saugumu

---

### 4 skyrius: Infrastructure as Code ir diegimas (1-1.5 valandos) 🏗️
**Reikalavimai**: 1-3 skyrius baigti  
**Sudėtingumas**: ⭐⭐⭐

#### Ko išmoksite
- Pažangūs diegimo modeliai
- Infrastructure as Code naudojimas su Bicep
- Išteklų suteikimo strategijos
- Individualių šablonų kūrimas

- Programėlių diegimas konteineriuose su Azure Container Apps ir AZD

#### Mokymosi šaltiniai
- [Diegimo vadovas](docs/deployment/deployment-guide.md) - Pilni darbo eiga
- [Išteklų suteikimas](docs/deployment/provisioning.md) - Išteklų valdymas
- Konteinerių ir mikroservisų pavyzdžiai
- [Container App pavyzdžiai](examples/container-app/README.md) - Greitas startas, produkcija ir pažangūs diegimo modeliai

#### Praktinis rezultatas
Diegti sudėtingas daugiaservises programėles naudojant individualius infrastruktūros šablonus

---

### 5 skyrius: Daugiaagentai AI sprendimai (2-3 valandos) 🤖🤖
**Reikalavimai**: 1-2 skyrius baigti  
**Sudėtingumas**: ⭐⭐⭐⭐

#### Ko išmoksite
- Daugiaagentės architektūros modeliai
- Agentų koordinavimas ir valdymas
- Produkcijai pasirengę AI diegimai
- Klientų ir inventoriaus agentų įgyvendinimas

- Konteinerizuotų mikroservisų integravimas kaip agentų sprendimų dalis

#### Mokymosi šaltiniai
- [Mažmeninės prekybos daugiaagentų sprendimas](examples/retail-scenario.md) - Pilnas įgyvendinimas
- [ARM šablonų paketas](../../examples/retail-multiagent-arm-template) - Vieno spustelėjimo diegimas
- Daugiaagentų koordinavimo modeliai
- [Mikroservisų architektūros pavyzdys](../../examples/container-app/microservices) - Paslaugų tarpusavio komunikacija, asinchroniniai pranešimai ir produkcinis diegimas

#### Praktinis rezultatas
Įdiekite ir valdykite produkcijai pasirengtą daugiaagentį AI sprendimą

---

### 6 skyrius: Priešdiegimo validacija ir planavimas (1 valanda) 🔍
**Reikalavimai**: 4 skyrius baigtas  
**Sudėtingumas**: ⭐⭐

#### Ko išmoksite
- Talpos planavimas ir išteklių patikrinimas
- SKU pasirinkimo strategijos
- Priešdiegimo patikros ir automatizavimas
- Sąnaudų optimizavimo planavimas

#### Mokymosi šaltiniai
- [Talpos planavimas](docs/pre-deployment/capacity-planning.md) - Išteklų validavimas
- [SKU pasirinkimas](docs/pre-deployment/sku-selection.md) - Ekonomiškas pasirinkimas
- [Priešdiegimo patikros](docs/pre-deployment/preflight-checks.md) - Automatizuotos skriptai
- [Application Insights integracija](docs/pre-deployment/application-insights.md) - Stebėsena ir matomumas
- [Daugiaagentų koordinavimo modeliai](docs/pre-deployment/coordination-patterns.md) - Agentų valdymo strategijos

#### Praktinis rezultatas
Patikrinkite ir optimizuokite diegimus prieš vykdymą
---

### 7 skyrius: Gedimų šalinimas ir derinimas (1–1,5 valandos) 🔧  
**Išankstinės žinios**: Baigtas bet kuris diegimo skyrius  
**Sunkumo lygis**: ⭐⭐

#### Ką išmoksite  
- Sistemingus gedimų šalinimo metodus  
- Dažniausiai pasitaikančias problemas ir sprendimus  
- AI specifinius gedimų šalinimo būdus  
- Veikimo optimizavimą  

#### Mokymosi ištekliai  
- [Dažnos problemos](docs/troubleshooting/common-issues.md) – DUK ir sprendimai  
- [Derinimo vadovas](docs/troubleshooting/debugging.md) – Žingsnis po žingsnio strategijos  
- [AI specifinis gedimų šalinimas](docs/troubleshooting/ai-troubleshooting.md) – AI paslaugų problemos  

#### Praktinis rezultatas  
Savistoviškai diagnozuoti ir išspręsti dažnas diegimo problemas  

---

### 8 skyrius: Produkciniai ir verslo šablonai (2–3 valandos) 🏢  
**Išankstinės žinios**: Baigti 1–4 skyriai  
**Sunkumo lygis**: ⭐⭐⭐⭐

#### Ką išmoksite  
- Produkcijos diegimo strategijas  
- Verslo saugumo šablonus  
- Stebėjimą ir kaštų optimizavimą  
- Masto keitimo galimybes ir valdymą  

- Gerąsias praktikas konteinerinių programų gamybinio diegimo srityje (sauga, stebėjimas, sąnaudos, CI/CD)  

#### Mokymosi ištekliai  
- [Produkcinės AI gerosios praktikos](docs/microsoft-foundry/production-ai-practices.md) – Verslo šablonai  
- Mikroservisų ir verslo pavyzdžiai  
- Stebėjimo ir valdymo sistemos  
- [Mikroservisų architektūros pavyzdys](../../examples/container-app/microservices) – Blue-green/canary diegimas, paskirstytas sekimas ir kaštų optimizavimas  

#### Praktinis rezultatas  
Diegti verslui paruoštas programas su pilnais produkciniais pajėgumais  

---

## Mokymosi pažangos ir sudėtingumo apžvalga

### Laipsniškas įgūdžių ugdymas

- **🌱 Pradedantieji**: Pradėti nuo 1 skyriaus (pagrindai) → 2 skyriaus (AI kūrimas)  
- **🔧 Vidutiniai**: 3–4 skyriai (konfigūracija ir infrastruktūra) → 6 skyrius (patikra)  
- **🚀 Pažengusieji**: 5 skyrius (multi-agent sprendimai) → 7 skyrius (gedimų šalinimas)  
- **🏢 Verslas**: Baigti visus skyrius, ypatingai 8 skyrių (produkcinių šablonų)  

- **Konteinerių programų kelias**: 4 skyriaus (konteinerizuotas diegimas), 5 skyriaus (mikroservisų integracija), 8 skyriaus (produkcijos gerosios praktikos)  

### Sudėtingumo žymėjimas

- **⭐ Pagrindinis**: Vienos temos, vedamos pamokos, 30–60 min  
- **⭐⭐ Vidutinis**: Kelios temos, praktika, 1–2 valandos  
- **⭐⭐⭐ Pažangus**: Sudėtinga architektūra, individualūs sprendimai, 1–3 valandos  
- **⭐⭐⭐⭐ Ekspertas**: Produkcinės sistemos, verslo šablonai, 2–4 valandos  

### Lankstūs mokymosi keliai

#### 🎯 AI kūrėjo greitasis maršrutas (4–6 valandos)  
1. **1 skyrius**: Pagrindai ir greitas pradžia (45 min)  
2. **2 skyrius**: AI pirmenybės kūrimas (2 valandos)  
3. **5 skyrius**: Multi-agent AI sprendimai (3 valandos)  
4. **8 skyrius**: Produkcinės AI gerosios praktikos (1 valanda)  

#### 🛠️ Infrastruktūros specialisto kelias (5–7 valandos)  
1. **1 skyrius**: Pagrindai ir greitas pradžia (45 min)  
2. **3 skyrius**: Konfigūracija ir autentifikacija (1 valanda)  
3. **4 skyrius**: Infrastruktūra kaip kodas ir diegimas (1,5 valandos)  
4. **6 skyrius**: Išankstinė patikra ir planavimas (1 valanda)  
5. **7 skyrius**: Gedimų šalinimas ir derinimas (1,5 valandos)  
6. **8 skyrius**: Produkciniai ir verslo šablonai (2 valandos)  

#### 🎓 Visapusiškas mokymosi kelias (8–12 valandų)  
Sekmingas visų 8 skyrių užbaigimas su praktine veikla ir patikra  

## Kurso baigimo sistema

### Žinių patikra  
- **Skyriaus kontroliniai taškai**: Praktinės užduotys su matomais rezultatais  
- **Praktinė patikra**: Dirbančių sprendimų diegimas kiekvienam skyriui  
- **Pažangos stebėjimas**: Vizualūs indikatoriai ir baigimo ženkleliai  
- **Bendruomenės patikra**: Patirties dalinimasis Azure Discord kanaluose  

### Mokymosi rezultatų vertinimas

#### 1–2 skyrių užbaigimas (pagrindai + AI)  
- ✅ Pagrindinės internetinės programos diegimas naudojant AZD  
- ✅ AI pagrindu veikianti pokalbių programa su RAG diegimas  
- ✅ Azure AZD pagrindinių koncepcijų ir AI integracijos supratimas  

#### 3–4 skyrių užbaigimas (konfigūracija + infrastruktūra)  
- ✅ Kelių aplinkų diegimų valdymas  
- ✅ Individualių Bicep infrastruktūros šablonų kūrimas  
- ✅ Saugios autentifikacijos šablonų diegimas  

#### 5–6 skyrių užbaigimas (multi-agent + patikra)  
- ✅ Kompleksinių multi-agent AI sprendimų diegimas  
- ✅ Pajėgumų planavimo ir kaštų optimizavimo atlikimas  
- ✅ Automatizuotos išankstinės patikros įgyvendinimas  

#### 7–8 skyrių užbaigimas (gedimų šalinimas + produkcija)  
- ✅ Savarankiškas diegimo problemų derinimas ir sprendimas  
- ✅ Verslo lygio stebėjimo ir saugumo šablonų diegimas  
- ✅ Produkcijai paruoštų programų diegimas su valdymu  

### Sertifikavimas ir pripažinimas  
- **Kurso baigimo ženklelis**: Visų 8 skyrių baigimas su praktine patikra  
- **Bendruomenės pripažinimas**: Aktyvus dalyvavimas Microsoft Foundry Discord  
- **Profesinis tobulėjimas**: Rinkoje pripažinti AZD ir AI diegimo įgūdžiai  
- **Karjeros galimybės**: Verslui paruošto debesijos diegimo kompetencijos  

## 🎓 Išsamūs mokymosi rezultatai

### Pagrindinis lygis (1–2 skyriai)  
Baigus pagrindinius skyrius, mokiniai gebės:

**Techninės kompetencijos:**  
- Diegti paprastas interneto programas į Azure naudojant AZD komandas  
- Konfigūruoti ir diegti AI pokalbių programas su RAG galimybėmis  
- Suprasti AZD pagrindines sąvokas: šablonus, aplinkas, paruošimo srautus  
- Integruoti Microsoft Foundry paslaugas su AZD diegimais  
- Naudotis Azure AI paslaugų konfigūracijomis ir API galutiniais taškais  

**Profesiniai įgūdžiai:**  
- Vykdyti struktūruotus diegimo srautus pastoviems rezultatams  
- Šalinti paprastas diegimo problemas naudojant žurnalus ir dokumentaciją  
- Efektyviai komunikuoti apie debesijos diegimo procesus  
- Taikyti gerąsias praktikas saugiai AI paslaugų integracijai  

**Mokymosi patikra:**  
- ✅ Sėkmingai įdiegti `todo-nodejs-mongo` šabloną  
- ✅ Įdiegti ir konfigūruoti `azure-search-openai-demo` su RAG  
- ✅ Atlikti interaktyvias praktines dirbtuves (atradimo fazė)  
- ✅ Dalyvauti Azure Discord bendruomenės diskusijose  

### Vidutinis lygis (3–4 skyriai)  
Baigus vidutinius skyrius, mokiniai gebės:

**Techninės kompetencijos:**  
- Valdyti kelių aplinkų diegimus (vystymas, testavimas, gamyba)  
- Kurti individualius Bicep šablonus infrastruktūrai kaip kodui  
- Diegti saugius autentifikacijos šablonus su valdomomis tapatybėmis  
- Diegti sudėtingas kelių paslaugų programas su individualiomis konfigūracijomis  
- Optimizuoti išteklių paruošimo strategijas kaštams ir veikimui  

**Profesiniai įgūdžiai:**  
- Kurti skalavimo infrastruktūros architektūras  
- Diegti saugumo gerąsias praktikas debesų sistemose  
- Dokumentuoti infrastruktūros šablonus komandiniam darbui  
- Vertinti ir pasirinkti tinkamas Azure paslaugas pagal poreikius  

**Mokymosi patikra:**  
- ✅ Konfigūruoti atskiras aplinkas su aplinkos specifiniais nustatymais  
- ✅ Kurti ir diegti individualų Bicep šabloną kelių paslaugų programai  
- ✅ Diegti valdomos tapatybės autentifikaciją saugiam prieigos valdymui  
- ✅ Atlikti konfigūracijos valdymo užduotis realiomis situacijomis  

### Pažangus lygis (5–6 skyriai)  
Baigus pažangius skyrius, mokiniai gebės:

**Techninės kompetencijos:**  
- Diegti ir valdyti multi-agent AI sprendimus su koordinuotais srautais  
- Įgyvendinti klientų ir inventoriaus agentų architektūras mažmeninės prekybos scenarijams  
- Atlikti išsamų pajėgumų planavimą ir išteklių patikrą  
- Vykdyti automatizuotą išankstinę diegimo patikrą ir optimizavimą  
- Kurti kaštus taupančius SKU pasirinkimus pagal darbo krūvio reikalavimus  

**Profesiniai įgūdžiai:**  
- Architektuoti sudėtingus AI sprendimus gamybos aplinkai  
- Vadovauti techninėms diskusijoms apie AI diegimo strategijas  
- Mentorystė jaunesniems kūrėjams AZD ir AI diegimo geriausių praktikos klausimais  
- Vertinti ir rekomenduoti AI architektūros šablonus verslo poreikiams  

**Mokymosi patikra:**  
- ✅ Įdiegti pilną mažmeninės prekybos multi-agent sprendimą su ARM šablonais  
- ✅ Demonstruoti agentų koordinavimą ir srautų valdymą  
- ✅ Atlikti pajėgumų planavimo pratimus su realiais išteklių apribojimais  
- ✅ Patvirtinti diegimo pasirengimą per automatizuotus patikrinimus  

### Eksperto lygis (7–8 skyriai)  
Baigus ekspertų skyrius, mokiniai gebės:

**Techninės kompetencijos:**  
- Savarankiškai diagnozuoti ir spręsti sudėtingas diegimo problemas  
- Diegti verslo lygio saugumo šablonus ir valdymo sistemas  
- Kurti išsamias stebėjimo ir perspėjimų strategijas  
- Optimizuoti produkcinius diegimus pagal mastą, kaštus ir veikimą  
- Įgyvendinti CI/CD srautus su tinkamu testavimu ir patikra  

**Profesiniai įgūdžiai:**  
- Vadovauti verslo debesijos transformacijos iniciatyvoms  
- Kurti ir įgyvendinti organizacinius diegimo standartus  
- Mokyti ir mentorinti kūrėjų komandas pažangiose AZD praktikose  
- Daryti poveikį techniniams sprendimams verslo AI diegimuose  

**Mokymosi patikra:**  
- ✅ Išspręsti sudėtingus kelių paslaugų diegimo gedimus  
- ✅ Įgyvendinti verslo saugumo šablonus su atitikties reikalavimais  
- ✅ Kurti ir diegti gamybos stebėjimo sprendimus su Application Insights  
- ✅ Atlikti verslo valdymo sistemos diegimą  

## 🎯 Kurso baigimo sertifikavimas

### Pažangos stebėjimo sistema  
Stebėkite savo mokymosi pažangą per struktūruotus kontrolinius taškus:

- [ ] **1 skyrius**: Pagrindai ir greitas pradžia ✅  
- [ ] **2 skyrius**: AI pirmenybės kūrimas ✅  
- [ ] **3 skyrius**: Konfigūracija ir autentifikacija ✅  
- [ ] **4 skyrius**: Infrastruktūra kaip kodas ir diegimas ✅  
- [ ] **5 skyrius**: Multi-agent AI sprendimai ✅  
- [ ] **6 skyrius**: Išankstinė patikra ir planavimas ✅  
- [ ] **7 skyrius**: Gedimų šalinimas ir derinimas ✅  
- [ ] **8 skyrius**: Produkciniai ir verslo šablonai ✅  

### Patikros procesas  
Baigus kiekvieną skyrių, patikrinkite savo žinias:

1. **Praktinių užduočių įgyvendinimas**: Diegti veikiančius sprendimus kiekvienam skyriui  
2. **Žinių vertinimas**: Peržiūrėti DUK skyrius ir atlikti savarankiškus įvertinimus  
3. **Bendruomenės dalyvavimas**: Dalintis patirtimi ir gauti atsiliepimus Azure Discord  
4. **Portfolio kūrimas**: Dokumentuoti savo diegimus ir pamokas  
5. **Bendrų peržiūrų atlikimas**: Bendradarbiauti su kitais mokiniais sprendžiant sudėtingas situacijas  

### Kurso baigimo privalumai  
Baigus visus skyrius su patikrinimu, absolventai turės:

**Techninę ekspertizę:**  
- **Produkcinė patirtis**: Realūs AI programų diegimai Azure aplinkose  
- **Profesiniai įgūdžiai**: Verslui paruošto diegimo ir gedimų šalinimo gebėjimai  
- **Architektūros žinios**: Multi-agent AI sprendimai ir sudėtingi infrastruktūros šablonai  
- **Gedimų šalinimo meistrystė**: Savarankiškas diegimo ir konfigūracijos problemų sprendimas  

**Profesinis tobulėjimas:**  
- **Pripažinimas rinkoje**: Įrodytas įgūdžių lygis labai paklausiose AZD ir AI diegimo srityse  
- **Karjeros galimybės**: Tinkamumas debesų architekto ir AI diegimo specialisto pozicijoms  
- **Bendruomenės lyderystė**: Aktyvumas Azure kūrėjų bei AI bendruomenėse  
- **Nuolatinis mokymasis**: Pagrindas pažangiai Microsoft Foundry specializacijai  

**Portfolio vertybės:**  
- **Įdiegti sprendimai**: Veikiantys AI programų ir infrastruktūros šablonų pavyzdžiai  
- **Dokumentacija**: Išsamios diegimo gaires ir gedimų šalinimo procedūros  
- **Bendruomenės indėlis**: Diskusijos, pavyzdžiai ir patobulinimai Azure bendruomenei  
- **Profesinis tinklas**: Ryšiai su Azure ekspertais ir AI diegimo praktikais  

### Pokurso mokymosi kelias  
Absolventai yra pasirengę tolesniam specializavimuisi:  
- **Microsoft Foundry ekspertas**: Gilus AI modelių diegimo ir orkestravimo specializavimas  
- **Debesų architektūros lyderystė**: Verslo masto diegimo dizainas ir valdymas  
- **Kūrėjų bendruomenės lyderystė**: Indėlis į Azure pavyzdžius ir bendruomenės išteklius  
- **Įmonių mokymai**: AZD ir AI diegimo įgūdžių mokymas organizacijose  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus žmogaus vertimas. Mes neatsakome už bet kokius nesusipratimus ar neteisingus aiškinimus, kilusius naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
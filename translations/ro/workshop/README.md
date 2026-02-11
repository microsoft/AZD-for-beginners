<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Atelier AZD pentru Dezvoltatori AI
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Un atelier practic pentru construirea aplicațiilor AI cu Azure Developer CLI.</strong><br>
      Parcurge 7 module pentru a stăpâni șabloanele AZD și fluxurile de lucru pentru implementarea AI.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Ultima actualizare: Februarie 2026
      </span>
    </div>
  </div>
</div>

# Atelier AZD pentru Dezvoltatori AI

Bine ați venit la atelierul practic pentru învățarea Azure Developer CLI (AZD) cu accent pe implementarea aplicațiilor AI. Acest atelier vă ajută să înțelegeți aplicat șabloanele AZD în 3 pași:

1. **Descoperire** - găsește șablonul potrivit pentru tine.
1. **Implementare** - implementează și validează că funcționează
1. **Personalizare** - modifică și iterează pentru a-l face al tău!

Pe parcursul acestui atelier, vei fi introdus și în unelte și fluxuri de lucru de bază pentru dezvoltatori, pentru a-ți simplifica întregul parcurs de dezvoltare de la început la sfârșit.

<br/>

## Ghid bazat pe browser

Lecțiile atelierului sunt în Markdown. Le poți naviga direct în GitHub - sau poți lansa o previzualizare bazată pe browser, așa cum este prezentat în captură de ecran de mai jos.

![Workshop](../../../translated_images/ro/workshop.75906f133e6f8ba0.webp)

Pentru a folosi această opțiune - fă fork la depozit în profilul tău și pornește GitHub Codespaces. Odată ce terminalul VS Code este activ, tastează această comandă:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

În câteva secunde, vei vedea un dialog pop-up. Selectează opțiunea de `Open in browser`. Ghidul web se va deschide acum într-un nou tab al browserului. Unele beneficii ale acestei previzualizări:

1. **Căutare integrată** - găsește rapid cuvinte cheie sau lecții.
1. **Pictogramă de copiere** - trece cursorul peste blocurile de cod pentru a vedea această opțiune
1. **Comutator temă** - comută între teme deschise și închise
1. **Obține ajutor** - fă clic pe pictograma Discord din footer pentru a te alătura!

<br/>

## Prezentare Generală a Atelierului

**Durată:** 3-4 ore  
**Nivel:** Începător până la Intermediar  
**Prerechizite:** Familiaritate cu Azure, concepte AI, VS Code și unelte de linie de comandă.

Acesta este un atelier practic în care înveți făcând. După ce ai terminat exercițiile, recomandăm să revizuiești curriculum-ul AZD Pentru Începători pentru a-ți continua parcursul de învățare în bune practici pentru Securitate și Productivitate.

| Timp| Modul  | Obiectiv |
|:---|:---|:---|
| 15 min | [Introducere](docs/instructions/0-Introduction.md) | Setează cadrul, înțelege obiectivele |
| 30 min | [Selectează Șablon AI](docs/instructions/1-Select-AI-Template.md) | Explorează opțiunile și alege un start | 
| 30 min | [Validare Șablon AI](docs/instructions/2-Validate-AI-Template.md) | Implementează soluția implicită în Azure |
| 30 min | [Deconstruiește Șablonul AI](docs/instructions/3-Deconstruct-AI-Template.md) | Explorează structura și configurarea |
| 30 min | [Configurează Șablonul AI](docs/instructions/4-Configure-AI-Template.md) | Activează și încearcă funcționalitățile disponibile |
| 30 min | [Personalizează Șablonul AI](docs/instructions/5-Customize-AI-Template.md) | Adaptează șablonul la nevoile tale |
| 30 min | [Demolarea Infrastructurii](docs/instructions/6-Teardown-Infrastructure.md) | Curățare și eliberare resurse |
| 15 min | [Încheiere & Pași Următori](docs/instructions/7-Wrap-up.md) | Resurse de învățare, provocarea atelierului |

<br/>

## Ce vei învăța

Gândește-te la Șablonul AZD ca la un sandbox de învățare pentru a explora diverse capabilități și unelte pentru dezvoltare de la cap la coadă pe Microsoft Foundry. La finalul acestui atelier, ar trebui să ai o înțelegere intuitivă a diferitelor unelte și concepte în acest context.

| Concept  | Obiectiv |
|:---|:---|
| **Azure Developer CLI** | Înțelege comenzile și fluxurile de lucru ale uneltei |
| **Șabloane AZD**| Înțelege structura și configurarea proiectului |
| **Agent AI Azure**| Provisionează și implementează proiectul Microsoft Foundry |
| **Căutare AI Azure**| Activează ingineria contextului cu agenți |
| **Observabilitate**| Explorează urmărirea, monitorizarea și evaluările |
| **Red Teaming**| Explorează testarea adversarială și măsurile de atenuare |

<br/>

## Structura Atelierului

Atelierul este structurat să te conducă într-o călătorie de la descoperirea șablonului, la implementare, deconstrucție și personalizare - folosind șablonul oficial [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) ca bază.

### [Modul 1: Selectează Șablon AI](docs/instructions/1-Select-AI-Template.md) (30 min)

- Ce sunt Șabloanele AI?
- Unde pot găsi Șabloane AI?
- Cum pot începe să construiesc Agenți AI?
- **Laborator**: Quickstart cu GitHub Codespaces

### [Modul 2: Validare Șablon AI](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Care este arhitectura șablonului AI?
- Care este fluxul de lucru AZD de dezvoltare?
- Cum pot obține ajutor pentru dezvoltarea AZD?
- **Laborator**: Implementează și validează șablonul Agenți AI

### [Modul 3: Deconstruiește Șablon AI](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Explorează mediul tău în `.azure/` 
- Explorează configurarea resurselor în `infra/` 
- Explorează configurația AZD în `azure.yaml`
- **Laborator**: Modifică variabilele de mediu și reimplementează

### [Modul 4: Configurează Șablon AI](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Explorează: Generarea augmentată cu regăsire
- Explorează: Evaluarea Agenților & Red Teaming
- Explorează: Urmărire și monitorizare
- **Laborator**: Explorează Agent AI + Observabilitate

### [Modul 5: Personalizează Șablon AI](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definește: PRD cu cerințe de scenariu
- Configurează: Variabile de mediu pentru AZD
- Implementează: Hook-uri de ciclu de viață pentru sarcini suplimentare
- **Laborator**: Personalizează șablonul pentru scenariul meu

### [Modul 6: Demolarea Infrastructurii](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Recapitulare: Ce sunt șabloanele AZD?
- Recapitulare: De ce să folosim Azure Developer CLI?
- Pași următori: Încearcă un alt șablon!
- **Laborator**: Dezprovisionează infrastructura și curățare

<br/>

## Provocarea Atelierului

Vrei să te provoci să faci mai mult? Iată câteva sugestii de proiecte - sau împărtășește-ți ideile cu noi!!

| Proiect | Descriere |
|:---|:---|
|1. **Deconstruiește un Șablon AI Complex** | Folosește fluxul de lucru și uneltele prezentate și vezi dacă poți implementa, valida și personaliza un șablon diferit pentru soluții AI. _Ce ai învățat?_|
|2. **Personalizează cu Scenariul Tău**  | Încearcă să scrii un PRD (Document de Cerințe de Produs) pentru un scenariu diferit. Apoi folosește GitHub Copilot în repo-ul șablonului în Agent Model - și cere-i să genereze un flux de lucru personalizat pentru tine. _Ce ai învățat? Cum ai putea îmbunătăți aceste sugestii?_|
| | |

## Ai feedback?

1. Postează o problemă în acest repo - eticheteaz-o cu `Workshop` pentru comoditate.
1. Alătură-te Discord-ului Microsoft Foundry - conectează-te cu colegii tăi!


| | | 
|:---|:---|
| **📚 Acasă Curs**| [AZD Pentru Începători](../README.md)|
| **📖 Documentație** | [Începe cu șabloane AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Șabloane AI** | [Șabloane Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Următorii pași** | [Începe Atelierul](../../../workshop) |
| | |

<br/>

---

**Navigare:** [Curs Principal](../README.md) | [Introducere](docs/instructions/0-Introduction.md) | [Modul 1: Selectează Șablon](docs/instructions/1-Select-AI-Template.md)

**Gata să începi să construiești aplicații AI cu AZD?**

[Începe Atelierul: Introducere →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertisment**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să aveți în vedere că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite apărute în urma utilizării acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Atelier în construcție 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Acest atelier este în prezent în dezvoltare activă.</strong><br>
      Conținutul poate fi incomplet sau supus modificărilor. Revino curând pentru actualizări!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Ultima actualizare: Octombrie 2025
      </span>
    </div>
  </div>
</div>

# Atelier AZD pentru Dezvoltatori AI

Bine ai venit la atelierul practic pentru învățarea Azure Developer CLI (AZD) cu accent pe implementarea aplicațiilor AI. Acest atelier te ajută să obții o înțelegere aplicată a șabloanelor AZD în 3 pași:

1. **Descoperire** - găsește șablonul potrivit pentru tine.
1. **Implementare** - implementează și validează funcționalitatea acestuia.
1. **Personalizare** - modifică și adaptează pentru nevoile tale!

Pe parcursul acestui atelier, vei fi introdus și în instrumente și fluxuri de lucru esențiale pentru dezvoltatori, pentru a-ți eficientiza procesul de dezvoltare de la început până la sfârșit.

<br/>

## Ghid bazat pe browser

Lecțiile atelierului sunt în Markdown. Le poți naviga direct pe GitHub - sau poți lansa o previzualizare bazată pe browser, așa cum este ilustrat în captura de ecran de mai jos.

![Atelier](../../../translated_images/ro/workshop.75906f133e6f8ba0.webp)

Pentru a utiliza această opțiune - clonează repository-ul în profilul tău și lansează GitHub Codespaces. Odată ce terminalul VS Code este activ, tastează această comandă:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

În câteva secunde, vei vedea un dialog pop-up. Selectează opțiunea `Open in browser`. Ghidul bazat pe web se va deschide acum într-o filă nouă a browserului. Unele beneficii ale acestei previzualizări:

1. **Căutare integrată** - găsește rapid cuvinte cheie sau lecții.
1. **Icon pentru copiere** - treci cu mouse-ul peste blocurile de cod pentru a vedea această opțiune.
1. **Comutare temă** - schimbă între temele întunecate și luminoase.
1. **Obține ajutor** - apasă pe iconul Discord din footer pentru a te alătura!

<br/>

## Prezentare generală a atelierului

**Durată:** 3-4 ore  
**Nivel:** Începător până la Intermediar  
**Cerințe preliminare:** Familiaritate cu Azure, concepte AI, VS Code și instrumente de linie de comandă.

Acesta este un atelier practic în care înveți prin aplicare. După ce finalizezi exercițiile, îți recomandăm să revizuiești curriculumul AZD Pentru Începători pentru a-ți continua călătoria de învățare în cele mai bune practici de securitate și productivitate.

| Timp| Modul  | Obiectiv |
|:---|:---|:---|
| 15 min | [Introducere](docs/instructions/0-Introduction.md) | Setează scena, înțelege obiectivele |
| 30 min | [Selectează șablonul AI](docs/instructions/1-Select-AI-Template.md) | Explorează opțiunile și alege un punct de plecare | 
| 30 min | [Validează șablonul AI](docs/instructions/2-Validate-AI-Template.md) | Implementează soluția implicită pe Azure |
| 30 min | [Deconstruiește șablonul AI](docs/instructions/3-Deconstruct-AI-Template.md) | Explorează structura și configurația |
| 30 min | [Configurează șablonul AI](docs/instructions/4-Configure-AI-Template.md) | Activează și testează funcționalitățile disponibile |
| 30 min | [Personalizează șablonul AI](docs/instructions/5-Customize-AI-Template.md) | Adaptează șablonul la nevoile tale |
| 30 min | [Elimină infrastructura](docs/instructions/6-Teardown-Infrastructure.md) | Curăță și eliberează resursele |
| 15 min | [Concluzii și pași următori](docs/instructions/7-Wrap-up.md) | Resurse de învățare, provocarea atelierului |

<br/>

## Ce vei învăța

Gândește-te la șablonul AZD ca la un mediu de învățare pentru explorarea diverselor capabilități și instrumente pentru dezvoltarea completă pe Azure AI Foundry. Până la finalul acestui atelier, ar trebui să ai o înțelegere intuitivă a diverselor instrumente și concepte în acest context.

| Concept  | Obiectiv |
|:---|:---|
| **Azure Developer CLI** | Înțelege comenzile și fluxurile de lucru ale instrumentului |
| **Șabloane AZD**| Înțelege structura proiectului și configurația |
| **Agent AI Azure**| Proiectează și implementează proiectul Azure AI Foundry |
| **Căutare AI Azure**| Activează ingineria contextului cu agenți |
| **Observabilitate**| Explorează trasabilitatea, monitorizarea și evaluările |
| **Testare adversarială**| Explorează testarea adversarială și soluțiile de atenuare |

<br/>

## Structura atelierului

Atelierul este structurat pentru a te ghida într-o călătorie de la descoperirea șablonului, la implementare, deconstrucție și personalizare - folosind șablonul oficial [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) ca bază.

### [Modulul 1: Selectează șablonul AI](docs/instructions/1-Select-AI-Template.md) (30 min)

- Ce sunt șabloanele AI?
- Unde pot găsi șabloane AI?
- Cum pot începe să construiesc agenți AI?
- **Laborator**: Începe rapid cu GitHub Codespaces

### [Modulul 2: Validează șablonul AI](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Care este arhitectura șablonului AI?
- Care este fluxul de lucru AZD?
- Cum pot obține ajutor pentru dezvoltarea AZD?
- **Laborator**: Implementează și validează șablonul agenților AI

### [Modulul 3: Deconstruiește șablonul AI](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Explorează mediul tău în `.azure/` 
- Explorează configurarea resurselor în `infra/` 
- Explorează configurația AZD în `azure.yaml`s
- **Laborator**: Modifică variabilele de mediu și reimplementează

### [Modulul 4: Configurează șablonul AI](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Explorează: Generarea augmentată prin recuperare
- Explorează: Evaluarea agenților și testarea adversarială
- Explorează: Trasabilitate și monitorizare
- **Laborator**: Explorează agentul AI + observabilitatea 

### [Modulul 5: Personalizează șablonul AI](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definește: PRD cu cerințele scenariului
- Configurează: Variabilele de mediu pentru AZD
- Implementează: Lifecycle Hooks pentru sarcini suplimentare
- **Laborator**: Personalizează șablonul pentru scenariul meu

### [Modulul 6: Elimină infrastructura](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Recapitulare: Ce sunt șabloanele AZD?
- Recapitulare: De ce să folosești Azure Developer CLI?
- Pași următori: Încearcă un alt șablon!
- **Laborator**: Dezactivează infrastructura și curăță

<br/>

## Provocarea atelierului

Vrei să te provoci să faci mai mult? Iată câteva sugestii de proiecte - sau împărtășește ideile tale cu noi!!

| Proiect | Descriere |
|:---|:---|
|1. **Deconstruiește un șablon AI complex** | Folosește fluxul de lucru și instrumentele pe care le-am prezentat și vezi dacă poți implementa, valida și personaliza un alt șablon de soluție AI. _Ce ai învățat?_|
|2. **Personalizează cu scenariul tău**  | Încearcă să scrii un PRD (Document de Cerințe ale Produsului) pentru un alt scenariu. Apoi folosește GitHub Copilot în repository-ul tău de șablon în Agent Model - și cere-i să genereze un flux de lucru de personalizare pentru tine. _Ce ai învățat? Cum ai putea îmbunătăți aceste sugestii?_|
| | |

## Ai feedback?

1. Postează o problemă pe acest repository - etichetează-o `Workshop` pentru comoditate.
1. Alătură-te Discordului Azure AI Foundry - conectează-te cu colegii tăi!


| | | 
|:---|:---|
| **📚 Pagina principală a cursului**| [AZD Pentru Începători](../README.md)|
| **📖 Documentație** | [Începe cu șabloanele AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Șabloane AI** | [Șabloane Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Pași următori** | [Acceptă provocarea](../../../workshop) |
| | |

<br/>

---

**Anterior:** [Ghid de depanare AI](../docs/troubleshooting/ai-troubleshooting.md) | **Următor:** Începe cu [Laboratorul 1: Bazele AZD](../../../workshop/lab-1-azd-basics)

**Ești gata să începi să construiești aplicații AI cu AZD?**

[Începe Laboratorul 1: Bazele AZD →](./lab-1-azd-basics/README.md)

---

**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa natală ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
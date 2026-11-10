# Capitolul 4: Infrastructură ca și Cod & Implementare

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 2-3 ore lectură; alocă timp suplimentar pentru exercițiile de implementare | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă modele de Infrastructură ca și Cod (IaC) cu șabloane Bicep, aprovizionarea resurselor și strategii de implementare folosind Azure Developer CLI.

> Țintă pentru revizuirea comenzilor și configurațiilor: `azd 1.37.2` (noiembrie 2026). Producția live de aprovizionare Azure nu a fost realizată în timpul revizuirii.

## Obiective de învățare

Prin completarea acestui capitol, vei:
- Înțelege structura și sintaxa șabloanelor Bicep
- Aproviziona resurse Azure cu `azd provision`
- Implementa aplicații cu `azd deploy`
- Aplica strategii de implementare blue-green și rolling

---

## 📚 Lecții

| # | Lecție | Descriere | Durată |
|---|--------|-------------|------|
| 1 | [Aprovizionarea resurselor](provisioning.md) | Gestionarea resurselor Azure cu AZD | 45 min |
| 2 | [Ghid de implementare](deployment-guide.md) | Strategii de implementare a aplicațiilor | 45 min |
| 3 | [Crearea propriului șablon](custom-templates.md) | Construiește și publică șabloane azd reutilizabile | 30 min |

---

## 🚀 Început rapid

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 Structura proiectului AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Comenzi esențiale

| Comandă | Descriere |
|---------|-------------|
| `azd init` | Inițializează proiectul |
| `azd provision` | Creează resurse Azure |
| `azd deploy` | Implementează codul aplicației |
| `azd up` | aprovizionare + implementare |
| `azd down` | Șterge toate resursele |

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |
| **Următor** | [Capitolul 5: Soluții Multi-Agent](../chapter-05-multi-agent/README.md) |

---

## 📖 Resurse conexe

- [Verificări înainte de implementare](../chapter-06-pre-deployment/README.md)
- [Exemple de aplicații containerizate](../../examples/container-app/README.md)
- [Exemplu de aplicație bază de date](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
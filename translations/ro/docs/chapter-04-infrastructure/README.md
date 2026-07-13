# Capitolul 4: Infrastructura ca Cod & Implementare

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 1-1.5 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă tiparele Infrastructure as Code (IaC) cu șabloane Bicep, aprovizionarea resurselor și strategiile de implementare folosind Azure Developer CLI.

> Validat cu `azd 1.27.1` în iulie 2026.

## Obiective de învățare

Prin parcurgerea acestui capitol, vei:
- Înțelege structura și sintaxa șabloanelor Bicep
- Aproviziona resurse Azure cu `azd provision`
- Implementa aplicații cu `azd deploy`
- Implementa strategii de implementare blue-green și rolling

---

## 📚 Lecții

| # | Lecție | Descriere | Durată |
|---|--------|-------------|--------|
| 1 | [Aprovizionarea resurselor](provisioning.md) | Administrarea resurselor Azure cu AZD | 45 min |
| 2 | [Ghid de implementare](deployment-guide.md) | Strategii de implementare a aplicațiilor | 45 min |
| 3 | [Crearea propriului șablon](custom-templates.md) | Construirea și publicarea șabloanelor azd reutilizabile | 30 min |

---

## 🚀 Început rapid

```bash
# Inițializează din șablon
azd init --template azure-functions-python-v2-http

# Previzualizează ce va fi creat
azd provision --preview

# Provoacă doar infrastructura
azd provision

# Deploiază doar codul
azd deploy

# Sau ambele împreună
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
|---------|------------|
| `azd init` | Inițializează proiectul |
| `azd provision` | Creează resurse Azure |
| `azd deploy` | Implementează codul aplicației |
| `azd up` | aprovizionare + implementare |
| `azd down` | Șterge toate resursele |

---

## 🔗 Navigare

| Direcție | Capitol |
|----------|---------|
| **Anterior** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |
| **Următor** | [Capitolul 5: Soluții Multi-Agent](../chapter-05-multi-agent/README.md) |

---

## 📖 Resurse conexe

- [Verificări pre-implementare](../chapter-06-pre-deployment/README.md)
- [Exemple Container App](../../examples/container-app/README.md)
- [Exemplu aplicație bază de date](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
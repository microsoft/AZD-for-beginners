# Capitolul 4: Infrastructură ca Cod și Implementare

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 1-1.5 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă modele Infrastructure as Code (IaC) cu șabloane Bicep, aprovizionarea resurselor și strategii de implementare folosind Azure Developer CLI.

> Validat cu `azd 1.25.6` în iunie 2026.

## Obiective de învățare

Prin parcurgerea acestui capitol, vei:
- Înțelege structura și sintaxa șabloanelor Bicep
- Aproviziona resurse Azure cu `azd provision`
- Implementa aplicații cu `azd deploy`
- Implementa strategii de implementare blue-green și rolling

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Aprovizionarea Resurselor](provisioning.md) | Managementul resurselor Azure cu AZD | 45 min |
| 2 | [Ghid de Implementare](deployment-guide.md) | Strategii de implementare a aplicațiilor | 45 min |
| 3 | [Crearea Propriului Șablon](custom-templates.md) | Construiește și publică șabloane azd reutilizabile | 30 min |

---

## 🚀 Pornire Rapidă

```bash
# Inițializează din șablon
azd init --template azure-functions-python-v2-http

# Previzualizează ce va fi creat
azd provision --preview

# Provisionează doar infrastructura
azd provision

# Distribuie doar codul
azd deploy

# Sau ambele împreună
azd up
```

---

## 📁 Structura Proiectului AZD

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

## 🔧 Comenzi Esențiale

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

## 📖 Resurse Asemănătoare

- [Verificări Pre-Implementare](../chapter-06-pre-deployment/README.md)
- [Exemple Container App](../../examples/container-app/README.md)
- [Exemplu Aplicație Bază de Date](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
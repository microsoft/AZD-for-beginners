# Capitolul 4: Infrastructură ca Cod și Implementare

**📚 Curs**: [AZD pentru Începători](../../README.md) | **⏱️ Durată**: 1-1.5 hours | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă modele Infrastructure as Code (IaC) cu șabloane Bicep, provisionarea resurselor și strategii de implementare folosind Azure Developer CLI.

## Obiective de învățare

La finalul acestui capitol, vei:
- Înțelege structura și sintaxa șabloanelor Bicep
- Provisionează resurse Azure cu `azd provision`
- Desfășoară aplicații cu `azd deploy`
- Implementează strategii de implementare blue-green și rolling

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Provisionare resurse](provisioning.md) | Gestionarea resurselor Azure cu AZD | 45 min |
| 2 | [Ghid de implementare](deployment-guide.md) | Strategii de implementare a aplicațiilor | 45 min |

---

## 🚀 Pornire rapidă

```bash
# Inițializează din șablon
azd init --template azure-functions-python-v2-http

# Previzualizează ce va fi creat
azd provision --preview

# Furnizează doar infrastructura
azd provision

# Desfășoară doar codul
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
|---------|-------------|
| `azd init` | Inițializează proiectul |
| `azd provision` | Creează resurse Azure |
| `azd deploy` | Desfășoară codul aplicației |
| `azd up` | provizionează + implementează |
| `azd down` | Șterge toate resursele |

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |
| **Următor** | [Capitolul 5: Soluții Multi-Agent](../chapter-05-multi-agent/README.md) |

---

## 📖 Resurse conexe

- [Verificări pre-implementare](../chapter-06-pre-deployment/README.md)
- [Exemple de aplicații container](../../examples/container-app/README.md)
- [Exemplu de aplicație de bază de date](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Declinare de responsabilitate:
Acest document a fost tradus utilizând serviciul de traducere AI Co-op Translator (https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări eronate care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->
# Capitolul 4: Infrastructură ca Cod și Implementare

**📚 Curs**: [AZD For Beginners](../../README.md) | **⏱️ Durată**: 1–1,5 ore | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă modele Infrastructure as Code (IaC) cu șabloane Bicep, aprovizionarea resurselor și strategii de implementare folosind Azure Developer CLI.

> Validat cu `azd 1.23.12` în martie 2026.

## Obiective de învățare

Parcurgând acest capitol, veți:
- Înțelege structura și sintaxa șabloanelor Bicep
- Veți aproviziona resurse Azure cu `azd provision`
- Veți implementa aplicații cu `azd deploy`
- Implementa strategii de tip blue-green și rolling

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Aprovizionarea resurselor](provisioning.md) | Gestionarea resurselor Azure cu AZD | 45 min |
| 2 | [Ghid de implementare](deployment-guide.md) | Strategii de implementare a aplicațiilor | 45 min |

---

## 🚀 Pornire rapidă

```bash
# Inițializare din șablon
azd init --template azure-functions-python-v2-http

# Previzualizare a ceea ce va fi creat
azd provision --preview

# Provisionare doar a infrastructurii
azd provision

# Implementare doar a codului
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
| `azd deploy` | Implementează codul aplicației |
| `azd up` | aprovizionare + implementare |
| `azd down` | Șterge toate resursele |

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 3: Configurare](../chapter-03-configuration/README.md) |
| **Următor** | [Capitolul 5: Soluții multi-agent](../chapter-05-multi-agent/README.md) |

---

## 📖 Resurse conexe

- [Verificări înainte de implementare](../chapter-06-pre-deployment/README.md)
- [Exemple pentru Container App](../../examples/container-app/README.md)
- [Exemplu pentru Database App](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă ar trebui considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite care rezultă din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->